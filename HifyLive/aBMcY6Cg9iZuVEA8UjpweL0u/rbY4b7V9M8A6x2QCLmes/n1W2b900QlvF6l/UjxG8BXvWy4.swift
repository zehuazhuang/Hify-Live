

import Combine
import SwiftUI
import NIMSDK

//对话模型
class CachedRecentSession: Identifiable, ObservableObject {
    let id = UUID()
    let session: NIMSession
    let sessionId: String
    let sessionType: NIMSessionType
    @Published var lastMessageText: String
    @Published var timestamp: TimeInterval
    @Published var unreadCount: Int
    @Published var nickname: String
    @Published var avatarUrl: String
    @Published var isOnline: Bool

    init(session: NIMSession,
         sessionId: String,
         sessionType: NIMSessionType,
         lastMessageText: String,
         timestamp: TimeInterval,
         unreadCount: Int,
         nickname: String,
         avatarUrl: String,
         isOnline: Bool) {
        self.session = session
        self.sessionId = sessionId
        self.sessionType = sessionType
        self.lastMessageText = lastMessageText
        self.timestamp = timestamp
        self.unreadCount = unreadCount
        self.nickname = nickname
        self.avatarUrl = avatarUrl
        self.isOnline = isOnline
    }
}

//对话缓存存储
class RecentSessionStore: ObservableObject {
    static let shared = RecentSessionStore()
    // 统一使用 cache 作为数据源
    @Published var cache: [CachedRecentSession] = []

    private var cancellables = Set<AnyCancellable>()

    init() {

    }
    
    //已读friend
    func markFriendSessionsRead() {
        objectWillChange.send()
        
        // 关注 + 粉丝，自动去重
        let friendAccidSet = Set(
            IyfdHMdY.bTa3L6BoprG.gx0Y2M6W9 +
            IyfdHMdY.bTa3L6BoprG.fZ7W2C0YxML
        )
        
        for session in cache {
            // 只处理朋友会话
            if friendAccidSet.contains(session.sessionId) {
                let unread = session.unreadCount
                session.unreadCount = 0
                
                // 同步全局未读
                GlobalUnreadStore.shared.clearUnread(
                    for: session.sessionId,
                    count: unread
                )
                
                // 同步 SDK
                NIMSDK.shared().conversationManager.markAllMessagesRead(in: session.session)
            }
        }
    }
    
    func updateOnlineStatus(accid: String, isOnline: Bool) {
        DispatchQueue.main.async {
            for session in self.cache {
                // 只处理单聊
                if session.sessionType == .P2P && session.sessionId == accid {
                    session.isOnline = isOnline
                }
            }
        }
    }
    
    private func sortCache() {
        cache.sort { first, second in
            // video-sky-test 永远第一
            if first.sessionId == "video-sky-test" { return true }
            if second.sessionId == "video-sky-test" { return false }
            // 其他按时间戳降序排序
            return first.timestamp > second.timestamp
        }
    }
    
    // 拉取最近会话
    @MainActor
    func fetchRecentSessions() async {
        await withCheckedContinuation { continuation in
            RecentSessionManager.shared.fetchRecentSessions {
                // 更新本地缓存和排序
                self.cache = RecentSessionManager.shared.cache
                
                // 过滤黑名单
                          let blockedSet = TPb21z0U.eDNcFBMyyi.blockedAccidSet
                          self.cache.removeAll { session in
                              session.sessionType == .P2P && blockedSet.contains(session.sessionId)
                          }
                
                
                self.sortCache()
                self.syncGlobalUnread()
                
                
                for cachedSession in self.cache {
                    let accid = cachedSession.sessionId
                    NIMSDK.shared().userManager.fetchUserInfos([accid]) { users, _ in
                        guard let user = users?.first else { return }

                        Task { @MainActor in
                            if let extString = user.userInfo?.ext,
                               let data = extString.data(using: .utf8),
                               let ext = try? JSONDecoder().decode(UserExt.self, from: data) {
                                
                                let online = (ext.onlineStatus == 1)
                                
                                
                                cachedSession.isOnline = online

                                
                                RecentSessionStore.shared.updateOnlineStatus(accid: accid, isOnline: online)
                            }
                        }
                    }
                }
                
                continuation.resume()
            }
        }
    }
    
    func syncGlobalUnread() {
        Task { @MainActor in
            GlobalUnreadStore.shared.update(from: cache)
        }
    }

    // 删除某个会话
    func removeSession(withId id: UUID) {
        guard let index = cache.firstIndex(where: { $0.id == id }) else { return }
        let cached = cache[index]

        // 从 SDK 删除最近会话
        if let recent = NIMSDK.shared().conversationManager.recentSession(by: cached.session) {
            let option = NIMDeleteRecentSessionOption()
            NIMSDK.shared().conversationManager.delete(recent, option: option) { error in
                if let error = error {
                    print("error", error.localizedDescription)
                } else {
                    print("success")
                }
            }
        }

        // 删除本地缓存
        RecentSessionManager.shared.removeSession(withId: id)
        self.cache = RecentSessionManager.shared.cache
        sortCache()
    }
    
    // SDK delegate
       func onRecentSessionChanged(_ recentSession: NIMRecentSession) {
           guard let session = recentSession.session else { return }
           if let index = cache.firstIndex(where: { $0.sessionId == session.sessionId }) {
               let local = cache[index]
               local.unreadCount = recentSession.unreadCount
               local.lastMessageText = recentSession.lastMessage?.text ?? ""
               local.timestamp = recentSession.lastMessage?.timestamp ?? 0
               sortCache()
              // objectWillChange.send()
               // ✅ 全局未读同步
               GlobalUnreadStore.shared.update(from: cache)
           }
       }
    
    
    
}

extension RecentSessionStore {
    func markSessionRead(sessionId: String) {
           guard let index = cache.firstIndex(where: { $0.sessionId == sessionId }) else {
               return
           }
        objectWillChange.send()
           // 本地缓存标记已读
           let unreadCount = cache[index].unreadCount
           cache[index].unreadCount = 0

           // 同步全局未读
           GlobalUnreadStore.shared.clearUnread(for: cache[index].sessionId, count: unreadCount)

           // 同步给云信 SDK
           let session = cache[index].session
           NIMSDK.shared().conversationManager.markAllMessagesRead(in: session)
       }
    
  
    /// 将所有会话标记为已读
        func markAllSessionsRead() {
            // 通知 SwiftUI 即将更新
            objectWillChange.send()
            
            for session in cache {
                // 先把本地缓存标记为已读
                session.unreadCount = 0
                // 同步给云信 SDK
                NIMSDK.shared().conversationManager.markAllMessagesRead(in: session.session)
            }
        }
    
    
}

