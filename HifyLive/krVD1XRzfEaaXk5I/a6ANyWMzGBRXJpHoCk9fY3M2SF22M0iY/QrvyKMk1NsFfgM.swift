import SwiftUI
import SwiftfulRouting
import NIMSDK
//通用方法

@MainActor
func openP2PChatScreen(
    userId: String,
    avatarUrl: String,
    using router: AnyRouter
) {
    let session = NIMSession(userId, type: .P2P)

    // 1️⃣ 检查缓存
    let hasCached = RecentSessionStore.shared.cache.first(where: { $0.sessionId == userId }) != nil

    // 2️⃣ 检查 SDK 本地是否已有会话
    let hasLocalSession = NIMSDK.shared().conversationManager.recentSession(by: session) != nil

    // 3️⃣ 如果没有会话就创建
    if !hasCached && !hasLocalSession {
        NIMSDK.shared().conversationManager.addEmptyRecentSession(by: session)
        RecentSessionStore.shared.fetchRecentSessions()
    } else if hasLocalSession {
        RecentSessionStore.shared.fetchRecentSessions()
    }

    // 4️⃣ 跳转到聊天界面
    router.showScreen(.fullScreenCover) { _ in
        WUjfoptOKs8pZfhSAH0duplG {
            CgZU7mTgY46l(session: session, opponentAvatarURL: avatarUrl)
        }
    }
}
