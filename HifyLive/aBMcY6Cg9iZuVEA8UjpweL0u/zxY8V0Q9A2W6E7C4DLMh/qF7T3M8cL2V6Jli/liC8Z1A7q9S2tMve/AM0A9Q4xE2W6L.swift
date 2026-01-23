

import UIKit
import AgoraRtcKit

class ViewController: UIViewController {

   
    private var appId: String
        private var token: String
        private var channelName: String
        private var localUid: UInt

    private var agoraKit: AgoraRtcEngineKit!
    private let remoteVideoView = UIView()
    
    init(appId: String, token: String, channelName: String, localUid: UInt = 0) {
            self.appId = appId
            self.token = token
            self.channelName = channelName
            self.localUid = localUid
            super.init(nibName: nil, bundle: nil)
        self.modalPresentationCapturesStatusBarAppearance = true
        self.modalPresentationStyle = .fullScreen
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.frame = UIScreen.main.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        setupUI()
        setupAgora()
        joinChannel()
    }

    private func setupUI() {
            remoteVideoView.frame = view.bounds
            remoteVideoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            // 🔑 关键：移除安全区 Insets
            remoteVideoView.translatesAutoresizingMaskIntoConstraints = true
            view.addSubview(remoteVideoView)
        }
    
    private func setupAgora() {
            agoraKit = AgoraRtcEngineKit.sharedEngine(withAppId: appId, delegate: self)
            agoraKit.setChannelProfile(.liveBroadcasting)
            agoraKit.setClientRole(.audience)
            agoraKit.enableVideo()
        }

    private func joinChannel() {
            agoraKit.joinChannel(byToken: token, channelId: channelName, info: nil, uid: localUid) { channel, uid, elapsed in
                print("🎉 Join success", channel, uid)
            }
        }

    deinit {
        AgoraRtcEngineKit.destroy()
    }
}

// MARK: - AgoraRtcEngineDelegate
extension ViewController: AgoraRtcEngineDelegate {

    // 有远端主播进来（关键）
    func rtcEngine(
        _ engine: AgoraRtcEngineKit,
        didJoinedOfUid uid: UInt,
        elapsed: Int
    ) {
        print("👤 Remote user joined:", uid)

        let canvas = AgoraRtcVideoCanvas()
        canvas.uid = uid
        canvas.view = remoteVideoView
        canvas.renderMode = .hidden

        engine.setupRemoteVideo(canvas)
    }

    func rtcEngine(
        _ engine: AgoraRtcEngineKit,
        didOfflineOfUid uid: UInt,
        reason: AgoraUserOfflineReason
    ) {
        print("❌ Remote user left:", uid)
    }
}
