import Foundation
struct TokenManager {
    static let rtcTokenKey = "RTC_TOKEN_KEY"
    static let rtmTokenKey = "RTM_TOKEN_KEY"

    // 保存 Token
    static func save(rtcToken: String, rtmToken: String) {
        UserDefaults.standard.set(rtcToken, forKey: rtcTokenKey)
        UserDefaults.standard.set(rtmToken, forKey: rtmTokenKey)
    }
    
    // 获取 Token
    static func getRTCToken() -> String? {
        UserDefaults.standard.string(forKey: rtcTokenKey)
    }
    
    static func getRTMToken() -> String? {
        UserDefaults.standard.string(forKey: rtmTokenKey)
    }
}

struct TokenResponse: Codable {
    let channelId: String
    let rtcToken: String
    let rtcTokenChannel: String?
    let rtmToken: String
}

func fetchToken() async throws -> TokenResponse {
    let dict = try await getRtctoken() // 返回 [AnyHashable: Any]
    print("token -------")
    
    

    let channelId = dict.string("channelId")
    let rtcToken = dict.string("rtcToken")
    let rtmToken = dict.string("rtmToken")
    let rtcTokenChannel = dict.string("rtcTokenChannel") // Optional
    
    print(channelId)
    print(rtcToken)
    print(rtmToken)
    print(rtcTokenChannel)

    return TokenResponse(channelId: channelId,
                         rtcToken: rtcToken,
                         rtcTokenChannel: rtcTokenChannel,
                         rtmToken: rtmToken)
}


func saveToken(_ token: TokenResponse) {
    UserDefaults.standard.set(token.rtcToken, forKey: "RTC_TOKEN")
    UserDefaults.standard.set(token.rtmToken, forKey: "RTM_TOKEN")
    UserDefaults.standard.set(token.channelId, forKey: "CHANNEL_ID")
}
