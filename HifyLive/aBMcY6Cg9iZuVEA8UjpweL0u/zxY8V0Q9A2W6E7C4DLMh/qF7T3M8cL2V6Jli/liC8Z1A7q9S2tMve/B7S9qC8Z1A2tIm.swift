

import UIKit
import AgoraRtcKit

class LiveViewController: UIViewController {
    private var appId = JOGtDnYupP.zMVMMyTmNK
    private var token: String?//当前登录用户的rtctoken
    private var liveRoomData: [String: Any] //加入直播接口数据
    private var channelName: String //agoraChannelId
    private var localUid: UInt  //登录用户uid

    private var agoraKit: AgoraRtcEngineKit?
    private let remoteVideoView = UIView()
    
    private var hasJoinedChannel = false //用来更新channelName
    

    init(liveRoomData: [String: Any], localUid: UInt) {
        self.liveRoomData = liveRoomData
        self.localUid = localUid
        self.channelName = liveRoomData["agoraChannelId"] as? String ?? ""
        super.init(nibName: nil, bundle: nil)
    }
    
    private func leaveChannelIfNeeded() {
     

        if hasJoinedChannel {
            agoraKit?.leaveChannel(nil)
            hasJoinedChannel = false
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        leaveChannelIfNeeded()
    }

    required init?(coder: NSCoder) { fatalError() }
    
    private let loadingView: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    func updateIfNeeded(liveRoomData newData: [String: Any]) {
        let newChannel = newData["agoraChannelId"] as? String ?? ""

        // 更新缓存
        self.liveRoomData = newData

        guard !newChannel.isEmpty else { return }
        guard newChannel != channelName else { return }

        print("🔄 channel 更新:", newChannel)

        channelName = newChannel
        leaveChannelAndJoinAgainIfNeeded()
    }
    
    private func leaveChannelAndJoinAgainIfNeeded() {
        guard let engine = agoraKit else { return }

    

        if hasJoinedChannel {
            engine.leaveChannel { [weak self] _ in
                self?.hasJoinedChannel = false
                self?.joinChannel()
            }
        } else {
            joinChannel()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
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
        guard let token = TokenManager.shared.rtcToken else {
            print("❌ token 不存在")
            return
        }
        self.token = token

        let engine = AgoraEngineManager.shared.engine
            ?? AgoraRtcEngineKit.sharedEngine(
                withAppId: appId,
                delegate: self
            )

        engine.delegate = self
        engine.setClientRole(.audience)

        self.agoraKit = engine

        joinChannel()
    }
    
    private func joinChannel() {
        guard !channelName.isEmpty else {
            print("⚠️ channelName 为空，暂不 join")
            return
        }
        guard let token = token, let engine = agoraKit else { return }
        
        remoteVideoView.subviews.forEach { $0.removeFromSuperview() }

        print("🚀 Join channel:", channelName)

        engine.joinChannel(
            byToken: token,
            channelId: channelName,
            info: nil,
            uid: localUid
        ) { [weak self] channel, uid, elapsed in
            print("🎉 Join success:", channel)
            print(uid)
            self?.hasJoinedChannel = true
            
        }
    }
    
    deinit {
        LiveSessionManager.shared.currentChannelUserId = 0
       
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
        
        LiveSessionManager.shared.currentChannelUserId = UInt(uid)
    }
    func rtcEngine(
        _ engine: AgoraRtcEngineKit,
        firstRemoteVideoFrameOfUid uid: UInt,
        size: CGSize,
        elapsed: Int
    ) {
    

            print("🎬 主播开始推视频（首帧到达）")
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


