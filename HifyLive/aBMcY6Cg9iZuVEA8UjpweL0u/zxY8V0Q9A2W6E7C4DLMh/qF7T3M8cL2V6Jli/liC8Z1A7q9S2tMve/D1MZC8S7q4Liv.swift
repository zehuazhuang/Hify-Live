//
//  D1MZC8S7q4Liv.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//
import UIKit
import SnapKit
import AgoraRtcKit
final class LiveViewController: UIViewController {

    private let remoteVideoView = UIView()
    
    var channelId: String = ""
    var rtcToken: String = ""
    var uid: UInt = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        startWatching()
    }

    private func setupUI() {
        view.addSubview(remoteVideoView)
        remoteVideoView.backgroundColor = .red
        remoteVideoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func startWatching() {
        AgoraManager.shared.setup()
        
        // 闭包保证远端视频渲染到 remoteVideoView
        AgoraManager.shared.onRemoteVideoJoined = { [weak self] uid in
            guard let self = self else { return nil }

            // ⚡ 设置 Canvas
            let canvas = AgoraRtcVideoCanvas()
            canvas.uid = uid
            canvas.view = self.remoteVideoView
            canvas.renderMode = .fit
            AgoraManager.shared.engine?.setupRemoteVideo(canvas)

            // 红色占位改黑色
            self.remoteVideoView.backgroundColor = .black
            return self.remoteVideoView
        }

        // 加入频道
        AgoraManager.shared.joinChannel(channelId: channelId, token: rtcToken, uid: uid)
        
        print("📌 已加入频道 \(channelId), uid=\(uid)")
    }

    deinit {
        AgoraManager.shared.leaveChannel()
        print("⚠️ LiveViewController deinit, 已离开频道")
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // 确保 view 有 frame
        if AgoraManager.shared.engine != nil, remoteVideoView.bounds.width > 0 {
            print("📌 remoteVideoView frame: \(remoteVideoView.frame)")
        }
    }
}


