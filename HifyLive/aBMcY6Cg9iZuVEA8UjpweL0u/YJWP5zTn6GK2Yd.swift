//礼物动画播放

import SwiftUI
import AVKit
import Combine
import SVGAPlayer

// MARK: - 礼物模型
struct GiftAnimationItem: Identifiable, Equatable {
    let id = UUID()
    let giftId: String
    let url: URL
    var count: Int = 1
}

// MARK: - 队列管理器
class GiftQueueManager: ObservableObject {
    
    @Published var currentItem: GiftAnimationItem?  // 当前播放的礼物
    
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
                .transition(.scale.combined(with: .opacity))
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
                    VideoPlayer(player: player)
                        .ignoresSafeArea()
                        .allowsHitTesting(false)
                }
            } else if url.pathExtension.lowercased() == "svga" {
                SVGAPlayerViewWrapper(url: url, onFinish: onFinish)
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
