//礼物动画播放

import SwiftUI
import AVKit
import Combine
import SVGAPlayer
import YYEVA

// MARK: - 礼物模型
struct GiftAnimationItem: Identifiable, Equatable {
    let id = UUID()
    let giftId: String
    let url: URL
    var count: Int = 1
    var message: ChatMessage?

    static func == (lhs: GiftAnimationItem, rhs: GiftAnimationItem) -> Bool {
        return lhs.id == rhs.id
    }
}

// MARK: - 队列管理器
class GiftQueueManager: ObservableObject {
    
    @Published var currentItem: GiftAnimationItem?  // 当前播放的礼物
    
    // 🔥 新增
    var onAnimationStart: ((GiftAnimationItem) -> Void)?
    
    private var queue: [GiftAnimationItem] = []      // 礼物队列
    private let maxQueue = 50
    
    // 入队
    func enqueueGift(_ item: GiftAnimationItem) {
        DispatchQueue.main.async {
            guard self.queue.count < self.maxQueue else { return }

            // 当前播放相同礼物累加
            if let current = self.currentItem, current.giftId == item.giftId {
                var newCurrent = current
                newCurrent.count += item.count
                self.currentItem = newCurrent
                return
            }

            // 队列里相同礼物累加
            if let index = self.queue.firstIndex(where: { $0.giftId == item.giftId }) {
                self.queue[index].count += item.count
                return
            }

            // 入队
            self.queue.append(item)
            self.playNextIfNeeded()
        }
    }
    
    // 播放队列第一个
    private func playNextIfNeeded() {
        guard currentItem == nil, !queue.isEmpty else { return }
        let next = queue.removeFirst()
        currentItem = next
        
        
    }
    
    // 动画播放完毕
    func finishCurrentAnimation() {
        DispatchQueue.main.async {
            self.currentItem = nil
            self.playNextIfNeeded()
        }
    }
}


class LiveGiftManager {
    static var managers: [UInt: GiftQueueManager] = [:] // key: liveRoomId
    
    static func manager(for roomId: UInt) -> GiftQueueManager {
        if let manager = managers[roomId] {
            return manager
        } else {
            let manager = GiftQueueManager()
            managers[roomId] = manager
            return manager
        }
    }
}

// MARK: - 礼物动画播放视图
struct GiftAnimationPlayer: View {
    @ObservedObject var manager: GiftQueueManager
    
    var body: some View {
        ZStack {
            if let item = manager.currentItem {
                GiftAnimationView(url: item.url) {
                    manager.finishCurrentAnimation()
                }
                .id(item.id)
                .onAppear {
                                    // 👇 监听“真正开始播放”
                                    NotificationCenter.default.addObserver(
                                        forName: .giftAnimationDidStart,
                                        object: nil,
                                        queue: .main
                                    ) { _ in
                                        manager.onAnimationStart?(item)
                                    }
                                }
                .onDisappear {
                                    NotificationCenter.default.removeObserver(
                                        self,
                                        name: .giftAnimationDidStart,
                                        object: nil
                                    )
                                }
                .zIndex(10)
            }
        }
        .animation(.easeInOut, value: manager.currentItem)
    }
}

// MARK: - 单个礼物动画
struct GiftAnimationView: View {
    let url: URL
    let onFinish: () -> Void
    
    @State private var player: AVPlayer?
    @State private var isReadyToPlay = false
    @State private var playerObserver: AnyCancellable?
    @State private var endObserver: NSObjectProtocol?
    
    var body: some View {
        ZStack {
            if url.pathExtension.lowercased() == "mp4" {
                if isReadyToPlay {
                    YYEVAVideoPlayerView(videoURL: url, onFinish: onFinish)
                                       .ignoresSafeArea()
                                       .allowsHitTesting(false)
                }
            } else if url.pathExtension.lowercased() == "svga" {
                SVGAPlayerViewWrapper(url: url, onFinish: onFinish)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }else if url.pathExtension.lowercased() == "png" {
                GiftPNGAnimationView(url: url, onFinish: onFinish)
                    .ignoresSafeArea()
                    .allowsHitTesting(false)
            }
        }
        .onAppear {
            if url.pathExtension.lowercased() == "mp4" {
                startMP4Player()
            }
        }
        .onDisappear {
            player?.pause()
            player = nil
            playerObserver?.cancel()
            playerObserver = nil
            
            if let endObserver {
                NotificationCenter.default.removeObserver(endObserver)
                self.endObserver = nil
            }
            isReadyToPlay = false
        }
    }
    
    private func startMP4Player() {
        
        let item = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: item)
        
        // 监听缓冲状态
        playerObserver = item.publisher(for: \.status)
            .receive(on: DispatchQueue.main)
            .sink { status in
                if status == .readyToPlay {
                    isReadyToPlay = true
                    player?.play()
                    
                    DispatchQueue.main.async {
                           NotificationCenter.default.post(name: .giftAnimationDidStart, object: nil)
                       }
                    
                    if let endObserver {
                        NotificationCenter.default.removeObserver(endObserver)
                    }
                    
                    endObserver = NotificationCenter.default.addObserver(
                        forName: .AVPlayerItemDidPlayToEndTime,
                        object: item,
                        queue: .main
                    ) { _ in
                        onFinish()
                        isReadyToPlay = false
                    }
                }
            }
    }
}

// MARK: - SVGA 包装
struct SVGAPlayerViewWrapper: UIViewRepresentable {
    let url: URL
    let onFinish: () -> Void
    
    func makeUIView(context: Context) -> SVGAPlayerContainer {
        let container = SVGAPlayerContainer()
        container.configure(url: url, onFinish: onFinish)
        return container
    }
    
    func updateUIView(_ uiView: SVGAPlayerContainer, context: Context) {
        uiView.play(url: url)
    }
    
    func makeCoordinator() -> Coordinator { Coordinator() }
    
    class Coordinator: NSObject {}
}

// MARK: - SVGAContainer
class SVGAPlayerContainer: UIView {
    private var player: SVGAPlayer?
    private var onFinish: (() -> Void)?
    
    func configure(url: URL, onFinish: @escaping () -> Void) {
        player?.removeFromSuperview()
        let newPlayer = SVGAPlayer()
        newPlayer.loops = 1
        newPlayer.clearsAfterStop = true
        newPlayer.delegate = self
        self.player = newPlayer
        self.addSubview(newPlayer)
        newPlayer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newPlayer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            newPlayer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            newPlayer.topAnchor.constraint(equalTo: self.topAnchor),
            newPlayer.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        self.onFinish = onFinish
    }
    
    func play(url: URL) {
        SVGACacheManager.shared.loadSVGA(url: url) { [weak self] videoItem in
            guard let self, let videoItem = videoItem else {
                self?.onFinish?()
                return
            }
            self.player?.stopAnimation()
            self.player?.videoItem = videoItem
            self.player?.startAnimation()
            
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .giftAnimationDidStart, object: nil)
            }
        }
    }
}

extension SVGAPlayerContainer: SVGAPlayerDelegate {
    func svgaPlayerDidFinishedAnimation(_ player: SVGAPlayer!) {
        onFinish?()
    }
}

// MARK: - SVGA 缓存管理
class SVGACacheManager {
    static let shared = SVGACacheManager()
    private var cache: [String: SVGAVideoEntity] = [:]
    private let lock = NSLock()
    private let maxCache = 30
    
    func loadSVGA(url: URL, completion: @escaping (SVGAVideoEntity?) -> Void) {
        let key = url.absoluteString
        lock.lock()
        if let entity = cache[key] {
            lock.unlock()
            completion(entity)
            return
        }
        lock.unlock()
        
        let parser = SVGAParser()
        parser.parse(with: url) { videoItem in
            if let videoItem {
                self.lock.lock()
                if self.cache.count > self.maxCache {
                    self.cache.removeAll()
                }
                self.cache[key] = videoItem
                self.lock.unlock()
            }
            completion(videoItem)
        } failureBlock: { _ in
            completion(nil)
        }
    }
}




struct YYEVAVideoPlayerView: UIViewRepresentable {
    let videoURL: URL
    let onFinish: (() -> Void)?
    
    class PlayerWrapper {
        let player = YYEVAPlayer()
    }
    
    func makeUIView(context: Context) -> UIView {
        let containerView = UIView(frame: UIScreen.main.bounds)
        containerView.backgroundColor = .clear
        containerView.layer.cornerRadius = 0
        containerView.clipsToBounds = false
        
        let player = context.coordinator.wrapper.player
        player.frame = containerView.bounds
        player.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        player.layer.cornerRadius = 0
        containerView.addSubview(player)
        
        downloadAndPlay(url: videoURL, player: player, onFinish: onFinish)
        
        return containerView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator {
        let wrapper = PlayerWrapper()
    }
    
    private func downloadAndPlay(url: URL, player: YYEVAPlayer, onFinish: (() -> Void)?) {
        URLSession.shared.downloadTask(with: url) { tempURL, _, error in
            guard let tempURL = tempURL, error == nil else { return }
            
            let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let localURL = docs.appendingPathComponent(UUID().uuidString + ".mp4")
            
            do {
                if FileManager.default.fileExists(atPath: localURL.path) {
                    try FileManager.default.removeItem(at: localURL)
                }
                try FileManager.default.moveItem(at: tempURL, to: localURL)
                
                DispatchQueue.main.async {
                    player.play(localURL.path)
                    
                    // 监听播放结束
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("YYEVAPlayerDidFinishPlayNotification"), object: player, queue: .main) { _ in
                        onFinish?()
                        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("YYEVAPlayerDidFinishPlayNotification"), object: player)
                    }
                }
            } catch {
                print("保存失败:", error)
            }
        }.resume()
    }
}
struct GiftPNGAnimationView: View {
    let url: URL
    let onFinish: () -> Void
    
    @State private var offsetY: CGFloat = 0
    @State private var scale: CGFloat = 1.0
    @State private var opacity: Double = 1.0
    @State private var isImageReady = false
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                
                AsyncImage(url: url) { phase in
                    switch phase {
                        
                    case .empty:
                        Color.clear
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .onAppear {
                                if !isImageReady {
                                    isImageReady = true
                                    DispatchQueue.main.async {
                                              NotificationCenter.default.post(name: .giftAnimationDidStart, object: nil)
                                          }
                                    startAnimation(screenHeight: geo.size.height)
                                }
                            }
                        
                    case .failure:
                        Color.clear
                            .onAppear {
                                
                                if !isImageReady {
                                    isImageReady = true
                                    DispatchQueue.main.async {
                                              NotificationCenter.default.post(name: .giftAnimationDidStart, object: nil)
                                          }
                                    startAnimation(screenHeight: geo.size.height)
                                }
                            }
                        
                    @unknown default:
                        EmptyView()
                    }
                }
                    .frame(width: 80, height: 80)
                    .offset(y: offsetY)
                    .scaleEffect(scale)
                    
            }
            .frame(
                width: geo.size.width,
                height: geo.size.height,
                
            ).onAppear {
                offsetY = geo.size.height / 2 + 100
            }
        }
    }
    
    private func startAnimation(screenHeight: CGFloat) {
        
        let target: CGFloat = 0
        
        
        withAnimation(.easeOut(duration: 0.6)) {
            offsetY = target
        }
        
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            
           
            withAnimation(.easeOut(duration: 0.6)) {
                scale = 1.5
            }
            
           
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
             
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    scale = 1.0
                }
            }
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            onFinish()
        }
    }
}
extension Notification.Name {
    static let giftAnimationDidStart = Notification.Name("giftAnimationDidStart")
}
