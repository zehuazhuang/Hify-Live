

//message模块
import SwiftUI
import NIMSDK
import SwiftfulRouting
import Combine

struct J9L2X1pF8D5ms: View {
    @ObservedObject var sessionStore = RecentSessionStore.shared
    @Environment(\.router) var rM9Z8S7A1ql
   
    var body: some View {
        VStack(spacing: 4) {

            // 顶部水平快捷消息栏
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<4, id: \.self) { index in
                        AqS7C1A2tLt()
                    }
                    Spacer()
                    VStack {
                        ZJ7h766mz(tMmEWWlfgUag: "mM3S8q9A2Co")
                            .frame(width: 56, height: 56)
                        Text("More")
                            .g0LIIcoZQsOjyND9(size: 14, weight: .regular, color: .white.opacity(0.6))
                    }
                }
                .padding(.horizontal, 16)
            }

            // 系统消息示例
            VStack {
                HStack(spacing: 10) {
                    ZJ7h766mz(tMmEWWlfgUag: "tLZ71tLM433")
                        .frame(width: 48, height: 48)
                    VStack(alignment: .leading, spacing: 3) {
                        Text("Platform")
                            .g0LIIcoZQsOjyND9(size: 14, weight: .regular)
                        Text("Congratulations! Your VIP ...")
                            .g0LIIcoZQsOjyND9(size: 14, weight: .regular, color: .white.opacity(0.6))
                    }
                    Spacer()
                    VStack {
                        Text("10-09")
                            .g0LIIcoZQsOjyND9(size: 14, weight: .regular, color: .white.opacity(0.6))
                        Spacer()
                        ZJ7h766mz(tMmEWWlfgUag: "rX2M9V3aL8P")
                            .frame(width: 28, height: 20)
                    }
                    .frame(width: 35, height: 48)
                }
                .frame(height: 76)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .background(
                    LinearGradient(
                        colors: [
                            Color(red: 120 / 255, green: 223 / 255, blue: 255 / 255, opacity: 0.1),
                            Color(red: 84 / 255, green: 105 / 255, blue: 199 / 255, opacity: 0.15)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            }

            // 最近消息列表
            List {
                ForEach(sessionStore.cache) { rZq7S8A9 in
                    tD4C1N7pR6Sli(
                        rN1Z8mR: rZq7S8A9,
                        onTap: { r in
                            // 1️⃣ 清当前会话未读（UI）
                                GlobalUnreadStore.shared.clearUnread(
                                    for: r.sessionId,
                                    count: r.unreadCount
                                )

                                // 2️⃣ 本地缓存同步
                            sessionStore.markSessionRead(sessionId: r.sessionId)
                            
                            rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                CgZU7mTgY46l(session: r.session)
                            }
                        },
                        onDelete: { r in
                            sessionStore.removeSession(withId: r.id)
                        }
                    )
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
            .background(Color.clear)
        }.onAppear {
            sessionStore.fetchRecentSessions()
        }
    }
}


