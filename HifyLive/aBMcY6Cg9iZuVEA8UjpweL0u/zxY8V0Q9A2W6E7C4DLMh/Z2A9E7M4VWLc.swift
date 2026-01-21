//
//  Z2A9E7M4VWLc.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/20.
//

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

        for message in messages {
            guard let session = message.session else { continue }

            // 1️⃣ 更新最近会话缓存
            RecentSessionManager.shared.updateCache(
                with: message,
                session: session
            )
        }

        let sessions = RecentSessionManager.shared.cache

        // 2️⃣ 更新 Navbar 未读数
        GlobalUnreadStore.shared.update(from: sessions)

        // 3️⃣ 刷新聊天列表
        RecentSessionStore.shared.cache = sessions
    }
}
