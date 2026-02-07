
//缓存聊天对话
import NIMSDK
import Combine

class RecentSessionManager: ObservableObject {
    static let shared = RecentSessionManager()
    private init() {}

    // SwiftUI 可绑定的缓存
    @Published private(set) var cache: [CachedRecentSession] = []

    /// 拉取 SDK 最近会话并转换为自定义缓存
    func fetchRecentSessions(forceRefresh: Bool = false, completion: (() -> Void)? = nil) {
        let sessions = NIMManager.shared.fetchRecentSessions()
        var tempCache: [CachedRecentSession] = []
        
       
        

        for r in sessions {
            guard let s = r.session,
                  !s.sessionId.isEmpty else { continue }

            let info = UserManager.shared.getCachedUserInfo(accid: s.sessionId)

            // ✅ 判断消息类型，统一设置 lastMessageText
            let lastMessageText: String
            if let lastMsg = r.lastMessage {
                switch lastMsg.messageType {
                case .text: // 0
                    lastMessageText = lastMsg.text ?? ""
                case .image: // 1
                    lastMessageText = "[Picture]"
                default:
                    lastMessageText = ""
                }
            } else {
                lastMessageText = ""
            }

           

            let cached = CachedRecentSession(
                session: s,
                sessionId: s.sessionId,
                sessionType: s.sessionType,
                lastMessageText: lastMessageText,
                timestamp: r.lastMessage?.timestamp ?? 0,
                unreadCount: r.unreadCount,
                nickname: info?.nickname ?? s.sessionId, // 先用ID占位
                avatarUrl: info?.avatarUrl ?? ""
            )

            tempCache.append(cached)

            // 异步更新昵称和头像
            UserManager.shared.getUserInfo(accid: s.sessionId) { nickname, avatarUrl in
                DispatchQueue.main.async {
                    cached.nickname = nickname
                    cached.avatarUrl = avatarUrl
                }
            }
        }

        cache = tempCache.sorted { $0.timestamp > $1.timestamp }
        completion?()
    }


    /// 更新本地缓存（发送或接收消息）
    func updateCache(with message: NIMMessage, session: NIMSession) {
        let accid = session.sessionId
        let type = session.sessionType
        
      

        let lastMessageText: String

            switch message.messageType {
            case .text: // 0
                lastMessageText = message.text ?? ""

            case .image: // 1
                lastMessageText = "[Picture]"



            default:
                lastMessageText = ""
            }
        
     

        if let index = cache.firstIndex(where: { $0.sessionId == accid }) {
            // 更新已有缓存
            cache[index].lastMessageText = lastMessageText
            cache[index].timestamp = message.timestamp
            if !message.isOutgoingMsg {
                cache[index].unreadCount += 1
            }
            let userInfo = UserManager.shared.getCachedUserInfo(accid: accid)
            cache[index].nickname = userInfo?.nickname ?? accid
            cache[index].avatarUrl = userInfo?.avatarUrl ?? ""
        } else {
            // 新增缓存
            let userInfo = UserManager.shared.getCachedUserInfo(accid: accid)
            let newCache = CachedRecentSession(
                session: session,
                sessionId: accid,
                sessionType: type,
                lastMessageText: lastMessageText,
                timestamp: message.timestamp,
                unreadCount: message.isOutgoingMsg ? 0 : 1,
                nickname: userInfo?.nickname ?? accid,
                avatarUrl: userInfo?.avatarUrl ?? ""
            )
            cache.append(newCache)
        }
    }

    /// 删除某个会话
    func removeSession(withId id: UUID) {
        cache.removeAll { $0.id == id }
    }

    /// 清空缓存
    func clearCache() {
        cache.removeAll()
    }
    
    func clearAllSessions() {
        let option = NIMDeleteRecentSessionOption()
        
        // 1️⃣ 删除 SDK 中的所有最近会话
        for cached in cache {
            if let recent = NIMSDK.shared().conversationManager.recentSession(by: cached.session) {
                NIMSDK.shared().conversationManager.delete(recent, option: option) { error in
                    if let error = error {
                        print("删除最近会话失败：", error.localizedDescription)
                    }
                }
            }
        }
        
        // 2️⃣ 只清空 store 的缓存
        self.cache.removeAll() // ⚡不要改 RecentSessionManager.shared.cache
    }
}
//extension RecentSessionManager {
//
//    /// ⚡ 本地消息更新最近会话（不依赖云信）
//    func updateCacheLocal(
//        session: NIMSession,
//        lastMessageText: String,
//        timestamp: TimeInterval,
//        isOutgoing: Bool
//    ) {
//        let accid = session.sessionId
//        let type = session.sessionType
//
//        if let index = cache.firstIndex(where: { $0.sessionId == accid }) {
//            cache[index].lastMessageText = lastMessageText
//            cache[index].timestamp = timestamp
//
//            // ⚠️ 本地消息：绝不增加未读
//            // unreadCount 不变
//        } else {
//            let userInfo = UserManager.shared.getCachedUserInfo(accid: accid)
//
//            let newCache = CachedRecentSession(
//                session: session,
//                sessionId: accid,
//                sessionType: type,
//                lastMessageText: lastMessageText,
//                timestamp: timestamp,
//                unreadCount: 0, // ⚡ 本地消息默认 0
//                nickname: userInfo?.nickname ?? accid,
//                avatarUrl: userInfo?.avatarUrl ?? ""
//            )
//
//            cache.append(newCache)
//        }
//
//        // 排序
//        cache.sort { $0.timestamp > $1.timestamp }
//    }
//}
