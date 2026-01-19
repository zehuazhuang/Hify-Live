//
//  C1q7S9A8tM4Ago.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//

//
//  AgoraManager.swift
//  HifyLive
//

import AgoraRtcKit
import UIKit

final class AgoraManager: NSObject {

    static let shared = AgoraManager()
    private override init() {}

    private var engine: AgoraRtcEngineKit?
    private var remoteView: UIView?

    // MARK: - Setup
    func setup() {
        let config = AgoraRtcEngineConfig()
        config.appId = "4af61c7a92f447d3a582308b5817dbd2"
        config.channelProfile = .liveBroadcasting

        engine = AgoraRtcEngineKit.sharedEngine(with: config, delegate: self)
        engine?.enableVideo()
        
    }

    // MARK: - Join
    func joinChannel(
        channelId: String,
        token: String,
        uid: UInt,
        remoteView: UIView
    ) {
        print("加入频道:", channelId, "使用 token:", token, "uid:", uid)
        self.remoteView = remoteView
        engine?.setClientRole(.audience)
     
        
        engine?.joinChannel(byToken: token, channelId: channelId, info: nil, uid: uid) { channel, uid, elapsed in
            print("joinChannel 回调: channel=\(channel) uid=\(uid) elapsed=\(elapsed)")
        }
        
    }

    // MARK: - Leave
    func leaveChannel() {
        engine?.leaveChannel(nil)
        engine = nil
    }
}

// MARK: - Delegate
extension AgoraManager: AgoraRtcEngineDelegate {

    /// 主播进房 → 开始渲染
    func rtcEngine(
        _ engine: AgoraRtcEngineKit,
        didJoinedOfUid uid: UInt,
        elapsed: Int
    ) {
        print("远端用户加入：", uid)
        DispatchQueue.main.async {
            guard let view = self.remoteView else { return }

            let canvas = AgoraRtcVideoCanvas()
            canvas.uid = uid
            canvas.view = view
            canvas.renderMode = .fit
            engine.setupRemoteVideo(canvas)
        }
        
    }
    

    func rtcEngine(
        _ engine: AgoraRtcEngineKit,
        didOfflineOfUid uid: UInt,
        reason: AgoraUserOfflineReason
    ) {
        print("主播离开：\(uid)")
    }
}
