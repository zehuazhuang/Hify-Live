//
//  UjxG8BXvWy4.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/20.
//

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

    init(session: NIMSession,
         sessionId: String,
         sessionType: NIMSessionType,
         lastMessageText: String,
         timestamp: TimeInterval,
         unreadCount: Int,
         nickname: String,
         avatarUrl: String) {
        self.session = session
        self.sessionId = sessionId
        self.sessionType = sessionType
        self.lastMessageText = lastMessageText
        self.timestamp = timestamp
        self.unreadCount = unreadCount
        self.nickname = nickname
        self.avatarUrl = avatarUrl
    }
}

//对话缓存存储
class RecentSessionStore: ObservableObject {
    static let shared = RecentSessionStore()
    // 统一使用 cache 作为数据源
    @Published var cache: [CachedRecentSession] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        // 初次加载
        fetchRecentSessions()

        // 定时刷新或在 ChatViewModel 更新缓存后调用
        Timer.publish(every: 0.3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                self.cache = RecentSessionManager.shared.cache
            }
            .store(in: &cancellables)
    }
    
    // 拉取最近会话
    func fetchRecentSessions() {
        RecentSessionManager.shared.fetchRecentSessions {
            self.cache = RecentSessionManager.shared.cache
        }
    }

    // 删除某个会话
    func removeSession(withId id: UUID) {
        RecentSessionManager.shared.removeSession(withId: id)
        self.cache = RecentSessionManager.shared.cache
    }
}

extension RecentSessionStore {
    func markSessionRead(sessionId: String) {
        guard let index = cache.firstIndex(where: { $0.sessionId == sessionId }) else {
            return
        }

        cache[index].unreadCount = 0

        // 可选：同步给云信 SDK
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
