import UIKit
import AgoraRtcKit

class LiveViewController: UIViewController {
    
    var role: AgoraRtcKit.AgoraClientRole = .audience
    var roomId: String = ""
    var uid: UInt = 0
    
    private var agoraKit: AgoraRtcEngineKit!
    private var localVideoView: UIView!
    private var remoteVideoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupUI()
        initAgoraEngine()
        joinChannel()
    }
    
    func setupUI() {
        // 本地视频
        localVideoView = UIView()
        localVideoView.frame = CGRect(x: 20, y: 50, width: 120, height: 160)
        localVideoView.backgroundColor = .gray
        view.addSubview(localVideoView)
        
        // 远程视频
        remoteVideoView = UIView()
        remoteVideoView.frame = view.bounds
        view.addSubview(remoteVideoView)
        view.sendSubviewToBack(remoteVideoView)
    }
    
    func initAgoraEngine() {
        let config = AgoraRtcEngineConfig()
        config.appId = "4af61c7a92f447d3a582308b5817dbd2"
        config.channelProfile = .liveBroadcasting
        agoraKit = AgoraRtcEngineKit.sharedEngine(with: config, delegate: self)
        
        // 设置角色
        agoraKit.setClientRole(role)
        
        // 开启视频
        agoraKit.enableVideo()
    }
    
    func joinChannel() {
        guard let token = UserDefaults.standard.string(forKey: "RTC_TOKEN"),
              let channelId = UserDefaults.standard.string(forKey: "CHANNEL_ID") else {
            print("RTC Token 或 ChannelID 不存在")
            return
        }
        
        let options = AgoraRtcChannelMediaOptions()
        options.publishMicrophoneTrack = (role == .broadcaster)
        options.publishCameraTrack = (role == .broadcaster)
        
        agoraKit.joinChannel(
            byToken: token,
            channelId: channelId,
            uid: uid,
            mediaOptions: options,
            joinSuccess: { [weak self] channel, uid, elapsed in
                print("加入房间成功: \(channel), uid: \(uid)")
                if self?.role == .broadcaster {
                    self?.setupLocalVideo()
                }
            }
        )
    }
    
    func setupLocalVideo() {
        let videoCanvas = AgoraRtcVideoCanvas()
        videoCanvas.uid = uid
        videoCanvas.view = localVideoView
        videoCanvas.renderMode = .hidden
        agoraKit.setupLocalVideo(videoCanvas)
        agoraKit.startPreview()
    }
    
    func setupRemoteVideo(uid: UInt) {
        let videoCanvas = AgoraRtcVideoCanvas()
        videoCanvas.uid = uid
        videoCanvas.view = remoteVideoView
        videoCanvas.renderMode = .hidden
        agoraKit.setupRemoteVideo(videoCanvas)
    }
    
    func leaveChannel() {
        agoraKit.leaveChannel(nil)
        AgoraRtcEngineKit.destroy()
    }
    
    deinit {
        leaveChannel()
    }
}

// MARK: - AgoraRtcEngineDelegate
extension LiveViewController: AgoraRtcEngineDelegate {
    func rtcEngine(_ engine: AgoraRtcEngineKit, didJoinedOfUid uid: UInt, elapsed: Int) {
        print("远程用户加入: \(uid)")
        setupRemoteVideo(uid: uid)
    }
    
    func rtcEngine(_ engine: AgoraRtcEngineKit, didOfflineOfUid uid: UInt, reason: AgoraUserOfflineReason) {
        print("远程用户离开: \(uid)")
    }
}
