//
//  YojYi8eVrmKh.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/19.
//
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
            guard let s = r.session else { continue }

            let info = UserManager.shared.getCachedUserInfo(accid: s.sessionId)

            // ✅ 判断消息类型，统一设置 lastMessageText
            let lastMessageText: String
            if let lastMsg = r.lastMessage {
                switch lastMsg.messageType {
                case .text: // 0
                    lastMessageText = lastMsg.text ?? ""
                case .image: // 1
                    lastMessageText = "[Picture]"
//                case .audio: // 2
//                    lastMessageText = "[Voice]"
//                case .video: // 3
//                    lastMessageText = "[Video]"
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
}
