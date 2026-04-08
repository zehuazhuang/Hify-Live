

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

    
    @MainActor
    private static func handleIncomingOnMain(_ messages: [NIMMessage]) {

        let myAccount = NIMSDK.shared().loginManager.currentAccount()
        
        var hasValidMessage = false
        
        for message in messages {

            if let session = message.session,
               session.sessionType == .chatroom,
               message.messageType == .custom,
               let remoteExt = message.remoteExt,
               let attachType = remoteExt["attachType"] as? Int,
               attachType == 66 {

                // 这里只会在满足所有条件时进入（礼物消息）
                
            
                guard let data = remoteExt["data"] as? [String: Any] else {
                    return
                }
                print("大额礼物")
                print(remoteExt)

                GlobalNoticeManager.shared.show(
                    GiftNoticeModel(
                        senderName: data.string("sendUserNickName"),
                        receiverName: data.string("receiveUserNickName"),
                        giftName: data.string("giftName"),
                        giftCount: data.int("giftNum"),
                        giftImage: data.string("smallImg"),
                        roomId: data.int("userId")
                    ),
                    stay: Double(data.string("showTime")) ?? 0
                )
            }
            
            
            
            guard
                let session = message.session,
                session.sessionType == .P2P,
              
                message.from != myAccount
            else {
                continue
            }
            
            hasValidMessage = true

            RecentSessionManager.shared.updateCache(
                with: message,
                session: session
            )
            
        }
        
        // 👇 没有有效消息，直接不更新
        guard hasValidMessage else { return }

        let sessions = RecentSessionManager.shared.cache

        GlobalUnreadStore.shared.update(from: sessions)
        RecentSessionStore.shared.cache = sessions
    }
}
