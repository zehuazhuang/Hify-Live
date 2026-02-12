import SwiftUI
import UIPilot
import NIMSDK
//通用方法

@MainActor
func openP2PChatScreen(
    userId: String,
    avatarUrl: String,
    pilot: UIPilot<APPTJuHVkDYORXa>
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

    
    
    // 4️⃣ 判断栈中是否已经存在该聊天页面
    if let existing = pilot.routes.first(where: { route in
        if case let .CgZU7mTgY46l(existingSession, _) = route {
            return existingSession.sessionId == session.sessionId
        }
        return false
    }) {
        
        pilot.popTo(existing)
    } else {
        
        pilot.push(
            .CgZU7mTgY46l(
                session: session,
                opponentAvatarURL: avatarUrl
            )
        )
    }
}
