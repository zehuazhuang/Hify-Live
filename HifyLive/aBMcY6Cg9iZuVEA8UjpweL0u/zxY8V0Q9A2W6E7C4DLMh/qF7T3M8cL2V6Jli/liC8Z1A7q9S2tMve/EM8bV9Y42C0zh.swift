import Foundation
import AgoraRtmKit

final class TokenManager: NSObject {
    static let shared = TokenManager()
    private override init() {} // 防止外部初始化
    
    static let appId = "4af61c7a92f447d3a582308b5817dbd2"
    
    private let rtcTokenKey = "RTC_TOKEN_KEY"
    private let rtmTokenKey = "RTM_TOKEN_KEY"
    private let channelIdKey = "CHANNEL_ID"
    
    // MARK: - RTM 相关
    private var rtmKit: AgoraRtmKit?
    private var rtmChannel: AgoraRtmChannel?
    private var rtmDelegate: AgoraRtmDelegate?
    
    // MARK: - 保存 Token
    func save(rtcToken: String, rtmToken: String, channelId: String) {
        UserDefaults.standard.set(rtcToken, forKey: rtcTokenKey)
        UserDefaults.standard.set(rtmToken, forKey: rtmTokenKey)
        UserDefaults.standard.set(channelId, forKey: channelIdKey)
    }
    
    func save(tokenResponse: TokenResponse) {
        save(rtcToken: tokenResponse.rtcToken,
             rtmToken: tokenResponse.rtmToken,
             channelId: tokenResponse.channelId)
    }
    
    // MARK: - 获取 Token
    var rtcToken: String? {
        UserDefaults.standard.string(forKey: rtcTokenKey)
    }
    
    var rtmToken: String? {
        UserDefaults.standard.string(forKey: rtmTokenKey)
    }
    
    var channelId: String? {
        UserDefaults.standard.string(forKey: channelIdKey)
    }
    
    // MARK: - 清除 Token
    func clear() {
        UserDefaults.standard.removeObject(forKey: rtcTokenKey)
        UserDefaults.standard.removeObject(forKey: rtmTokenKey)
        UserDefaults.standard.removeObject(forKey: channelIdKey)
    }
    
    // MARK: - RTM 初始化
    func setupRTM(delegate: AgoraRtmDelegate) {
        self.rtmDelegate = delegate
        rtmKit = AgoraRtmKit(appId: TokenManager.appId, delegate: delegate)
    }
    
    // MARK: - 登录 RTM
    func loginRTM(userId: String, completion: @escaping (Bool) -> Void) {
        guard let token = rtmToken else {
            completion(false)
            return
        }
        rtmKit?.login(byToken: token, user: userId) { errorCode in
            completion(errorCode == .ok)
        }
    }
    
    // MARK: - 加入频道
    func joinRTMChannel(channelId: String, delegate: AgoraRtmChannelDelegate, completion: @escaping (Bool) -> Void) {
        guard let rtmKit = rtmKit else {
            completion(false)
            return
        }
        let channel = rtmKit.createChannel(withId: channelId, delegate: delegate)
        rtmChannel = channel
        channel.join { errorCode in
            completion(errorCode == .channelErrorOk)
        }
    }
    
    // MARK: - 发送消息
    func sendRTMMessage(_ text: String) {
        let message = AgoraRtmMessage(text: text)
        rtmChannel?.send(message) { errorCode in
            if errorCode != .ok {
                print("❌ RTM send error:", errorCode.rawValue)
            }
        }
    }
    
    // MARK: - 退出 RTM
    func leaveRTMChannel() {
        rtmChannel?.leave { _ in }
        rtmChannel = nil
    }
    
    func logoutRTM() {
        rtmKit?.logout { _ in }
        rtmKit = nil
    }
}

// MARK: - TokenResponse 结构体
struct TokenResponse: Codable {
    let channelId: String
    let rtcToken: String
    let rtcTokenChannel: String?
    let rtmToken: String
}

// MARK: - 异步获取 Token 示例
func fetchToken() async throws -> TokenResponse {
    let dict = try await getRtctoken() // 返回 [AnyHashable: Any]

    let channelId = dict.string("channelId")
    let rtcToken = dict.string("rtcToken")
    let rtmToken = dict.string("rtmToken")
    let rtcTokenChannel = dict.string("rtcTokenChannel") // Optional

    return TokenResponse(channelId: channelId,
                         rtcToken: rtcToken,
                         rtcTokenChannel: rtcTokenChannel,
                         rtmToken: rtmToken)
}
