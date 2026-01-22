import AgoraRtcKit
import UIKit

final class AgoraManager: NSObject {

    static let shared = AgoraManager()
    private override init() {}

    var engine: AgoraRtcEngineKit?
    
    /// 远端用户加入回调
    var onRemoteVideoJoined: ((UInt) -> UIView?)?

    // MARK: - Setup
    func setup() {
        guard engine == nil else { return }

        let config = AgoraRtcEngineConfig()
        config.appId = "4af61c7a92f447d3a582308b5817dbd2"
        config.channelProfile = .liveBroadcasting

        engine = AgoraRtcEngineKit.sharedEngine(with: config, delegate: self)
        engine?.enableVideo()
    }

    // MARK: - Join
    func joinChannel(channelId: String, token: String, uid: UInt) {
        guard let engine = engine else { return }
        engine.setClientRole(.audience)

        engine.joinChannel(byToken: token, channelId: channelId, info: nil, uid: uid) { channel, uid, elapsed in
            print("✅ joinChannel 回调: channel=\(channel) uid=\(uid) elapsed=\(elapsed)")
        }
    }

    func leaveChannel() {
        engine?.leaveChannel(nil)
        engine = nil
    }
}

// MARK: - AgoraRtcEngineDelegate
extension AgoraManager: AgoraRtcEngineDelegate {

    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
        print("远端用户加入 uid=\(uid)")

        DispatchQueue.main.async {
            guard let remoteView = self.onRemoteVideoJoined?(uid) else { return }

            let canvas = AgoraRtcVideoCanvas()
            canvas.uid = uid
            canvas.view = remoteView
            canvas.renderMode = .fit
            engine.setupRemoteVideo(canvas)
        }
    }

    func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {
        print("远端用户离开 uid=\(uid), reason=\(reason.rawValue)")
    }

    func rtcEngine(_ engine: AgoraRtcEngineKit, firstRemoteVideoFrameOfUid uid: UInt, size: CGSize, elapsed: Int) {
        print("首帧远端视频收到 uid=\(uid), size=\(size), elapsed=\(elapsed)ms")
    }
}
