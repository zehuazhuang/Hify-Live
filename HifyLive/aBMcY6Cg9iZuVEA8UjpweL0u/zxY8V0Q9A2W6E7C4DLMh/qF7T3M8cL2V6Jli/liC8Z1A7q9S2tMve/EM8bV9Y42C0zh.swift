import Foundation
import AgoraRtmKit

final class TokenManager: NSObject, AgoraRtmDelegate {
    static let shared = TokenManager()
    private override init() {} // 防止外部初始化
    
    static let appId = "124f689baed25c488e1330bc42e528af"//JOGtDnYupP.zMVMMyTmNK
    
    private let rtcTokenKey = "RTC_TOKEN_KEY"
    private let rtmTokenKey = "RTM_TOKEN_KEY"
    private let channelIdKey = "CHANNEL_ID"
    
    // MARK: - RTM 相关
    private var rtmKit: AgoraRtmKit?
    private var rtmChannel: AgoraRtmChannel?
    private var rtmDelegate: AgoraRtmDelegate?
    
    // ✅ 添加公开访问属性
        var currentRtmChannel: AgoraRtmChannel? {
            return rtmChannel
        }
    
    
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
    
    func setupRTM() {
            rtmKit = AgoraRtmKit(appId: TokenManager.appId, delegate: self) // self 现在可以
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
    

    // MARK: - AgoraRtmDelegate: token 过期自动刷新
    func rtmKitTokenDidExpire(_ kit: AgoraRtmKit) {
        print("⚠️ RTM token 即将过期，开始刷新 Token")
        
        Task {
            let newTokenResponse = try await fetchToken()
            save(tokenResponse: newTokenResponse)
            
            // 异步 renewToken
            let (_, errorCode) = await rtmKit!.renewToken(newTokenResponse.rtmToken)
            
            if errorCode == .ok {
                print("✅ RTM token 已成功刷新")
            } else {
                print("❌ RTM token 刷新失败，errorCode:", errorCode.rawValue)
            }
        }
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
