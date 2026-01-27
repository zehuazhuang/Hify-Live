

import UIKit
import AgoraRtcKit

class LiveViewController: UIViewController {
    private var appId = TokenManager.appId
    private var token: String?
    private var channelName: String
    private var localUid: UInt  //主播id

    private var agoraKit: AgoraRtcEngineKit?
    private let remoteVideoView = UIView()
    
    

    init(channelName: String, localUid: UInt) {
        self.channelName = channelName
        self.localUid = localUid
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }
    
    private let loadingView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.hidesWhenStopped = true
        return indicator
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(handleMuteNotification(_:)), name: .muteRemoteAudio, object: nil)
        remoteVideoView.frame = view.bounds
        remoteVideoView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(remoteVideoView)
        
        // 添加 loading
            loadingView.center = view.center
            view.addSubview(loadingView)
            loadingView.startAnimating()
    }
    
    //静音回调
    @objc private func handleMuteNotification(_ notification: Notification) {
            guard let info = notification.userInfo,
                  let uid = info["uid"] as? UInt,
                  let mute = info["mute"] as? Bool else { return }
            muteRemoteUser(uid, mute: mute)
        }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        Task { @MainActor in
            await initializeAgora()
        }
    }
    
    //静音方法
    func muteRemoteUser(_ uid: UInt, mute: Bool) {
            agoraKit?.muteRemoteAudioStream(uid, mute: mute)
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
        
        // 停止 loading
            DispatchQueue.main.async {
                self.loadingView.stopAnimating()
                self.loadingView.removeFromSuperview()
            }
    }

    func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {
        switch reason {
        case .quit:
            print("主播主动退出直播")
            handleHostClosed()
        case .dropped:
            print("主播掉线或网络异常")
            handleHostClosed()
        default:
            print("主播离开（未知原因）: \(reason.rawValue)")
            handleHostClosed()
        }
    }


     func handleHostClosed() {
        NotificationCenter.default.post(name: .liveEnded, object: nil)
        
      
     //   present(alert, animated: true)
    }
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOccurError errorCode: AgoraErrorCode) {
        print("🚨 Agora Error:", errorCode.rawValue)
    }
}
extension Notification.Name {
    //静音通知
    static let muteRemoteAudio = Notification.Name("muteRemoteAudio")
    //主播离开、关播
    static let liveEnded = Notification.Name("liveEndedNotification")
}

