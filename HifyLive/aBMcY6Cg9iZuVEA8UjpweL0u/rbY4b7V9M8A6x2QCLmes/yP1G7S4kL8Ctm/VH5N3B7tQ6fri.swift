// freiend 模块
import SwiftUI
import UIPilot

struct VH5N3B7tQ6fri: View {
    @State private var seB51QK82J: Int = 0
    @State private var indices = Array(0..<4)
    @StateObject private var qVi2QJ0SeDluhZ9xoQ8V7 = IyfdHMdY.bTa3L6BoprG
    @ObservedObject var sessionStore = RecentSessionStore.shared
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var openRowId: UUID? = nil
    
    var filteredAccids: [String] {
        seB51QK82J == 0
            ? qVi2QJ0SeDluhZ9xoQ8V7.gx0Y2M6W9 // Following
            : qVi2QJ0SeDluhZ9xoQ8V7.fZ7W2C0YxML // Follower
    }
    

    var filteredAccidSet: Set<String> {
        Set(filteredAccids)
    }

    var filteredSessions: [CachedRecentSession] {
        sessionStore.cache.filter {
            filteredAccidSet.contains($0.sessionId)
        }
    }
    
    //是否空数据
    var x2E7Y8Z: Bool {
        filteredSessions.isEmpty
    }
    
    var body: some View {
        VStack(spacing:20) {
            HStack(spacing: 16) {
                QP8XkW3ZButton(
                    ti9QZ7xM4bV: "Following",
                    isY0A2C6WEL: seB51QK82J == 0
                   
                ) {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        seB51QK82J = 0
                    }
                }
                QP8XkW3ZButton(
                    ti9QZ7xM4bV: "Follower",
                    isY0A2C6WEL: seB51QK82J == 1
                ) {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        seB51QK82J = 1
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            
            if x2E7Y8Z {
                VStack{
                    ZJ7h766mz(tMmEWWlfgUag: "npIyAxb6vfM073130T9MwCJY8")
                                       .frame(width: 343, height: 248)
                    Spacer()
                }
            }else{
                ScrollView {
                    LazyVStack(spacing: 8) {
                        ForEach(filteredSessions, id: \.id) { session in
                            SwipeRow(id: session.id, openRowId: $openRowId) {
                                tD4C1N7pR6Sli(
                                    rN1Z8mR: session,
                                    onTap: { r in
                                        // 1️⃣ 清当前会话未读（UI）
                                            GlobalUnreadStore.shared.clearUnread(
                                                for: r.sessionId,
                                                count: r.unreadCount
                                            )

                                            // 2️⃣ 本地缓存同步
                                        sessionStore.markSessionRead(sessionId: r.sessionId)
                                        
                                     
                                        pilot.push(.CgZU7mTgY46l(session: r.session, opponentAvatarURL: r.avatarUrl))
                                        
                                    }
                                )
                            } onDelete: {
                                withAnimation {
                                    sessionStore.removeSession(withId: session.id)
                                }
                            }
                        }
                    }.padding(.bottom,96)
                }.simultaneousGesture(
                    DragGesture(minimumDistance: 5)
                        .onChanged { value in
                            // 🔥 只要是明显纵向滚动
                            if abs(value.translation.height) > abs(value.translation.width) {
                                if openRowId != nil {
                                    openRowId = nil
                                }
                            }
                        }
                )
            }

            
        }.simultaneousGesture(
            TapGesture().onEnded {
                openRowId = nil
            }
        )
    }
}
//


struct QP8XkW3ZButton: View {

    let ti9QZ7xM4bV: String
    let isY0A2C6WEL: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(ti9QZ7xM4bV)
                .g0LIIcoZQsOjyND9(
                    size: 16,
                    weight: .regular,
                    color: .white.opacity(isY0A2C6WEL ? 1 : 0.6)
                )
        }
        .frame(width: 92, height: 33)
        .background(backgroundGradient)
        .cornerRadius(325)
        .gradientBorder(shQY7b9WEL: isY0A2C6WEL)
    }

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: isY0A2C6WEL
            ? [
                Color(red: 120 / 255, green: 233 / 255, blue: 255 / 255, opacity: 0.32),
                Color(red: 84 / 255, green: 105 / 255, blue: 199 / 255, opacity: 0.25)
            ]
            : [
                Color.white.opacity(0.05),
                Color.white.opacity(0.05)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
extension View {

    @ViewBuilder
    func gradientBorder(
        shQY7b9WEL: Bool,
        corC7Q9WEL: CGFloat = 325
    ) -> some View {
        if shQY7b9WEL {
            self.overlay(
                RoundedRectangle(cornerRadius: corC7Q9WEL)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color(red: 187 / 255, green: 68 / 255, blue: 219 / 255),
                                Color(red: 43 / 255, green: 93 / 255, blue: 117 / 255)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 1
                    )
            )
        } else {
            self
        }
    }
}

