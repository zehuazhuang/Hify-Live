

import UIKit
import AgoraRtcKit

class LiveViewController: UIViewController {
    private var appId = TokenManager.appId
    private var token: String?
    private var channelName: String
    private var localUid: UInt

    private var agoraKit: AgoraRtcEngineKit?
    private let remoteVideoView = UIView()

    init(channelName: String, localUid: UInt) {
        self.channelName = channelName
        self.localUid = localUid
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()

        remoteVideoView.frame = view.bounds
        remoteVideoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(remoteVideoView)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task { @MainActor in
            await initializeAgora()
        }
    }

    @MainActor
    private func initializeAgora() async {
        // 获取 token
        guard let token = TokenManager.shared.rtcToken else {
            print("❌ token 不存在")
            return
        }
        self.token = token

        // 初始化 SDK（必须在主线程）
        let engine = AgoraRtcEngineKit.sharedEngine(withAppId: appId, delegate: self)
        engine.setChannelProfile(.liveBroadcasting)
        engine.setClientRole(.audience)
        engine.enableVideo()
        self.agoraKit = engine

        // 加入频道
        joinChannel()
    }

    private func joinChannel() {
        guard let token = self.token, let engine = self.agoraKit else { return }
        engine.joinChannel(byToken: token, channelId: channelName, info: nil, uid: localUid) { channel, uid, elapsed in
            print("🎉 Join success", channel, uid)
        }
    }

    deinit {
        AgoraRtcEngineKit.destroy()
    }
}

extension LiveViewController: AgoraRtcEngineDelegate {
    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
        let canvas = AgoraRtcVideoCanvas()
        canvas.uid = uid
        canvas.view = remoteVideoView
        canvas.renderMode = .hidden // 铺满
        engine.setupRemoteVideo(canvas)
    }

    func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {}
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOccurError errorCode: AgoraErrorCode) {
        print("🚨 Agora Error:", errorCode.rawValue)
    }
}
