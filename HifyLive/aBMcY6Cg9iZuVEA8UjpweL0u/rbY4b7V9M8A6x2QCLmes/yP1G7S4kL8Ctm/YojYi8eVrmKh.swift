
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
                  !s.sessionId.isEmpty
                //  ,s.sessionId != LiveSessionManager.shared.oep8RDxW //屏蔽全局聊天室
               //   s.sessionId != "video-sky-test" //屏蔽系统通知 充值钻石通知
            else { continue }
            
            if s.sessionType == .P2P,
                    TPb21z0U.eDNcFBMyyi.isBlocked(accid: s.sessionId) {
                     continue
                 }
            

            let info = UserManager.shared.getCachedUserInfo(accid: s.sessionId)

            // ✅ 判断消息类型，统一设置 lastMessageText
            let lastMessageText: String
            if let lastMsg = r.lastMessage {
                switch lastMsg.messageType {
                case .text: // 0
                    lastMessageText = lastMsg.text ?? ""
                case .image: // 1
                    lastMessageText = "[Picture]"
                case .custom: // 2
                    lastMessageText = "[Gift messages]"
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
                avatarUrl: info?.avatarUrl ?? "",
                isOnline: false
            )

            tempCache.append(cached)

            // 异步更新昵称和头像
            UserManager.shared.getUserInfo(accid: s.sessionId) { nickname, avatarUrl,isOnline in
                DispatchQueue.main.async {
                    cached.nickname = nickname
                    cached.avatarUrl = avatarUrl
                    cached.isOnline = isOnline
                }
            }
        }
        
        tempCache.sort { first, second in
            if first.sessionId == "video-sky-test" { return true }
            if second.sessionId == "video-sky-test" { return false }
            return first.timestamp > second.timestamp
        }

        cache = tempCache
        filterBlockedSessions()
       
        
        
        completion?()
    }
    //清空朋友会话
    func clearFriendSessions() {
        objectWillChange.send()
        
        // 关注 + 粉丝，自动去重
        let friendAccidSet = Set(
            IyfdHMdY.bTa3L6BoprG.gx0Y2M6W9 +
            IyfdHMdY.bTa3L6BoprG.fZ7W2C0YxML
        )
        
        let sessionsToDelete = cache.filter { session in
            friendAccidSet.contains(session.sessionId)
        }
        
        // 先删 SDK 最近会话
        for item in sessionsToDelete {
            if let recent = NIMSDK.shared().conversationManager.recentSession(by: item.session) {
                let option = NIMDeleteRecentSessionOption()
                NIMSDK.shared().conversationManager.delete(recent, option: option) { error in
                    if let error = error {
                        print("删除朋友会话失败：\(error.localizedDescription)")
                    } else {
                        print("删除朋友会话成功")
                    }
                }
            }
        }
        
        // 再删本地 cache
        cache.removeAll { session in
            friendAccidSet.contains(session.sessionId)
        }
        
        GlobalUnreadStore.shared.update(from: cache)
    }
    
    //过滤拉黑
    private func filterBlockedSessions() {
        let blockedSet = TPb21z0U.eDNcFBMyyi.blockedAccidSet
        cache.removeAll {
            $0.sessionType == .P2P && blockedSet.contains($0.sessionId)
        }
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
            case .custom: // 2
                lastMessageText = "[Gift messages]"


            default:
                lastMessageText = ""
            }
        
     
        let userInfo = UserManager.shared.getCachedUserInfo(accid: accid)
        if let index = cache.firstIndex(where: { $0.sessionId == accid }) {
            // 更新已有缓存
            cache[index].lastMessageText = lastMessageText
            cache[index].timestamp = message.timestamp
            if !message.isOutgoingMsg {
                cache[index].unreadCount += 1
            }
            
            cache[index].nickname = userInfo?.nickname ?? accid
            cache[index].avatarUrl = userInfo?.avatarUrl ?? ""
        } else {
            // 新增缓存
            
            let newCache = CachedRecentSession(
                session: session,
                sessionId: accid,
                sessionType: type,
                lastMessageText: lastMessageText,
                timestamp: message.timestamp,
                unreadCount: message.isOutgoingMsg ? 0 : 1,
                nickname: userInfo?.nickname ?? accid,
                avatarUrl: userInfo?.avatarUrl ?? "",
                isOnline: false
            )
            cache.append(newCache)
        }
        
        if  accid == "video-sky-test" {

            
            print(userInfo?.avatarUrl ?? "")
            XQAQvuU6cZLbgE.shared.vEnu5pS9V(
                text: "Top-up successful! \(lastMessageText) Diamonds has been credited to your account. ",
                name: "Eivo Team",
                avatar: "system",
                isSystem: false,
                sessionId: accid,
                timestamp: Date()
            )
        }else{
            XQAQvuU6cZLbgE.shared.vEnu5pS9V(
                text: lastMessageText,
                name: userInfo?.nickname ?? accid,
                avatar: userInfo?.avatarUrl ?? "",
                isSystem: false,
                sessionId: accid,
                timestamp: Date()
            )
        }
        
        filterBlockedSessions()
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
    
 
    

    
    func logoutAndClearAll() {
        
        // 1️⃣ 清空内存缓存
        cache.removeAll()
        
        // 2️⃣ 删除 SDK 所有最近会话
        let option = NIMDeleteRecentSessionOption()
        if let recents = NIMSDK.shared().conversationManager.allRecentSessions() {
            for recent in recents {
                NIMSDK.shared().conversationManager.delete(recent, option: option) { error in
                    if let error = error {
                        print("删除 SDK 最近会话失败:", error.localizedDescription)
                    }
                }
            }
        }
        
       
       
    }
    
    
    
}


