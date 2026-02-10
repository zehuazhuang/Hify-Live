import Foundation

final class TokenManager: NSObject {
    static let shared = TokenManager()
    private override init() {} // 防止外部初始化
    
    static let appId = "4af61c7a92f447d3a582308b5817dbd2" //JOGtDnYupP.zMVMMyTmNK
    
    private let rtcTokenKey = "RTC_TOKEN_KEY"
    private let rtmTokenKey = "RTM_TOKEN_KEY"
    private let channelIdKey = "CHANNEL_ID"
    

    

    
    
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
