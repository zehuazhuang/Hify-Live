

import Combine
import NIMSDK

//未读消息
final class GlobalUnreadStore: ObservableObject {
    static let shared = GlobalUnreadStore()

    @Published var totalUnread: Int = 0

    private init() {}

    func update(from sessions: [CachedRecentSession]) {
        totalUnread = sessions.reduce(0) { $0 + $1.unreadCount }
    }

    // ✅ 只减去某一个会话的未读数
    func clearUnread(for sessionId: String, count: Int) {
        totalUnread = max(0, totalUnread - count)
    }
    
    // ✅ 清空所有未读数
        func clearAllUnread() {
            totalUnread = 0
        }
}

//监听消息数
@objc
final class IMMessageListener: NSObject, NIMChatManagerDelegate {

    static let shared = IMMessageListener()

    private override init() {
        super.init()
        NIMSDK.shared().chatManager.add(self)
    }

    deinit {
        NIMSDK.shared().chatManager.remove(self)
    }

    // ✅ Obj-C delegate：必须 nonisolated
    nonisolated func onRecvMessages(_ messages: [NIMMessage]) {
        Task { @MainActor in
          
            Self.handleIncomingOnMain(messages)
        }
    }

    // ✅ 只在 MainActor 执行
    @MainActor
    private static func handleIncomingOnMain(_ messages: [NIMMessage]) {

        let myAccount = NIMSDK.shared().loginManager.currentAccount()
        
        for message in messages {
            print("有人送礼物")
            print(message.messageObject)
            print("-------")
            print(message)
            //全服公告
            if message.messageType == .custom{
                guard let customObject = message.messageObject as? NIMCustomObject,
                      let attachment = customObject.attachment else {
                    continue
                }
                let jsonString = attachment.encode()
                
                guard let data = jsonString.data(using: .utf8) else {
                    continue
                }
                do {
                    guard let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                          let type = dict["attachType"] as? String, type == "SEND_GIFT" else {
                        continue
                    }
                  
                   
                  
//                    guard let giftId = dict["giftId"] as? Int,
//                          let giftNum = dict["giftNum"] as? Int,
//                          let giftPrice = dict["giftPrice"] as? Int,
//                          let giftIcon = dict["smallImg"] as? String,
//                          let giftImg = dict["giftIcon"] as? String else {
//                        continue
//                    }
                    
                } catch {
                    print("JSON 解析失败: \(error)")
                    continue
                }
            }
            
            guard
                let session = message.session,
                session.sessionType == .P2P,
              
                message.from != myAccount
            else {
                continue
            }

            RecentSessionManager.shared.updateCache(
                with: message,
                session: session
            )
            
        }

        let sessions = RecentSessionManager.shared.cache

        GlobalUnreadStore.shared.update(from: sessions)
        RecentSessionStore.shared.cache = sessions
    }
}
