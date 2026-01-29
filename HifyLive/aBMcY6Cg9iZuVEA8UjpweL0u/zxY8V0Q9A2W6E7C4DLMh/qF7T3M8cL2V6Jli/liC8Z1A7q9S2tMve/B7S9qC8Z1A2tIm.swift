

import UIKit
import AgoraRtcKit

class LiveViewController: UIViewController {
    private var appId = TokenManager.appId
    private var token: String?//当前登录用户的rtctoken
    private var channelName: String  //agoraChannelId
    private var localUid: UInt  //登录用户uid

    private var agoraKit: AgoraRtcEngineKit?
    private let remoteVideoView = UIView()
    
    private var hasJoinedChannel = false //用来更新channelName
    private var hostHasStarted = false //是否开播
    private var waitHostTimer: DispatchWorkItem? //等待开播
    
    var currentChannelId: String {
        return channelName
    }

    init(channelName: String, localUid: UInt) {
        self.channelName = channelName
        self.localUid = localUid
        super.init(nibName: nil, bundle: nil)
        
       
    }
    
    private func leaveChannelIfNeeded() {
        waitHostTimer?.cancel()
        waitHostTimer = nil

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
    
    func updateChannelIfNeeded(_ newChannel: String) {
        guard !newChannel.isEmpty else { return }
        guard newChannel != channelName else { return }
        guard let _ = agoraKit else {
            // SDK 还没初始化，先存值
            channelName = newChannel
            return
        }

        print("🔄 channelName 更新:", newChannel)

        // 先更新 channelName
        channelName = newChannel

        // 异步离开旧频道，再 join 新频道
        leaveChannelAndJoinAgainIfNeeded()
    }
    
    private func leaveChannelAndJoinAgainIfNeeded() {
        guard let engine = agoraKit else { return }

        waitHostTimer?.cancel()
        waitHostTimer = nil

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
            
            //是否开播
            self?.startWaitHostTimer()
        }
    }
    
    private func startWaitHostTimer() {
        waitHostTimer?.cancel()

        let task = DispatchWorkItem { [weak self] in
            guard let self = self else { return }

            if self.hostHasStarted == false {
                print("⏰ 主播未开播 / 已关播")
                self.handleHostClosed()
            }
        }

        waitHostTimer = task
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: task)
    }
    
    deinit {
        
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
        hostHasStarted = true
            waitHostTimer?.cancel()
            waitHostTimer = nil

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


