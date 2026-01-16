//
//  C1q7S9A8tM4Ago.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//

import AgoraRtcKit
import UIKit

final class AgoraManager: NSObject {

    static let shared = AgoraManager()
    private var engine: AgoraRtcEngineKit?

    // 保存远端用户 UID 对应的 UIView
    private var remoteViews: [UInt: UIView] = [:]

    func setup() {
        let config = AgoraRtcEngineConfig()
        config.appId = "你的声网AppId"
        config.channelProfile = .liveBroadcasting

        engine = AgoraRtcEngineKit.sharedEngine(with: config, delegate: self)
    }

    func joinChannel(
        roomId: String,
        token: String,
        isBroadcaster: Bool,
        preview: UIView?
    ) {
        engine?.setClientRole(isBroadcaster ? .broadcaster : .audience)

        if isBroadcaster {
            engine?.enableVideo()
            engine?.startPreview()

            let canvas = AgoraRtcVideoCanvas()
            canvas.uid = 0
            canvas.view = preview
            canvas.renderMode = .hidden
            engine?.setupLocalVideo(canvas)
        }

        engine?.joinChannel(byToken: token, channelId: roomId, info: nil, uid: 0)
    }

    func leaveChannel() {
        engine?.leaveChannel(nil)
        remoteViews.removeAll()
    }
    
    // 给外部提供方法，绑定远端视图
    func bindRemoteView(_ view: UIView, for uid: UInt) {
        remoteViews[uid] = view
    }
}


extension AgoraManager: AgoraRtcEngineDelegate {

    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
        guard let remoteView = remoteViews[uid] else {
            print("未绑定远端视图 UID: \(uid)")
            return
        }

        let canvas = AgoraRtcVideoCanvas()
        canvas.uid = uid
        canvas.view = remoteView
        canvas.renderMode = .hidden
        engine.setupRemoteVideo(canvas)
    }

    func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {
        remoteViews[uid] = nil
    }
}
