//礼物动画播放

import SwiftUI
import AVKit
import Combine
import SVGAPlayer

struct YJWP5zTn6GK2Yd: View {
    let url: URL
    @Binding var isPlaying: Bool

    @State private var player: AVPlayer?
    @State private var isReadyToPlay: Bool = false
    @State private var playerObserver: AnyCancellable?

    @State private var svgaPlayer: SVGAPlayer?

    var body: some View {
        ZStack {
            if isPlaying {
                if url.pathExtension.lowercased() == "mp4" {
                    if isReadyToPlay {
                        VideoPlayer(player: player)
                            .ignoresSafeArea()
                            .transition(.scale.combined(with: .opacity))
                            .allowsHitTesting(false) // 点击不可打断
                    }
                } else if url.pathExtension.lowercased() == "svga" {
                    SVGAPlayerViewWrapper(url: url, isPlaying: $isPlaying)
                        .ignoresSafeArea()
                        .transition(.scale.combined(with: .opacity))
                        .allowsHitTesting(false)
                }
            }
        }
        .zIndex(10)
        .onAppear {
            guard isPlaying else { return }
            if url.pathExtension.lowercased() == "mp4" {
                startMP4Player()
            }
        }
        .onDisappear {
            // 停止 MP4
            player?.pause()
            player = nil
            playerObserver?.cancel()
            playerObserver = nil
            isReadyToPlay = false
            
            // 停止 SVGA
            svgaPlayer?.stopAnimation()
            svgaPlayer = nil
        }
    }

    // MARK: - MP4 播放
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

                    NotificationCenter.default.addObserver(
                        forName: .AVPlayerItemDidPlayToEndTime,
                        object: player?.currentItem,
                        queue: .main
                    ) { _ in
                        isPlaying = false
                        isReadyToPlay = false
                    }
                }
            }
    }
}

// MARK: - SVGAPlayer SwiftUI 包装
struct SVGAPlayerViewWrapper: UIViewRepresentable {
    let url: URL
    @Binding var isPlaying: Bool

    func makeUIView(context: Context) -> SVGAPlayer {
        let player = SVGAPlayer()
        player.loops = 1
        player.clearsAfterStop = true

        let parser = SVGAParser()
        
        parser.parse(with: url, completionBlock: { videoItem in
            DispatchQueue.main.async {
                guard player.superview != nil else { return } // 页面已经消失
                player.videoItem = videoItem
                player.startAnimation()
            }
        }, failureBlock: { error in
            DispatchQueue.main.async {
                self.isPlaying = false
            }
        })

        player.delegate = context.coordinator
        return player
    }

    func updateUIView(_ uiView: SVGAPlayer, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, SVGAPlayerDelegate {
        var parent: SVGAPlayerViewWrapper

        init(_ parent: SVGAPlayerViewWrapper) {
            self.parent = parent
        }

        func svgaPlayerDidFinishedAnimation(_ player: SVGAPlayer!) {
            DispatchQueue.main.async {
                self.parent.isPlaying = false
            }
        }
    }
}
