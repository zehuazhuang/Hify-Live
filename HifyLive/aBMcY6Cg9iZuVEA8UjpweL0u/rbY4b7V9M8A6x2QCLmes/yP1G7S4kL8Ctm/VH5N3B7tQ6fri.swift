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
                    LQ0Z4A6C9emp(mCl1LLEjan: "No Data")
                    Spacer()
                }
            }else{
                ScrollView(showsIndicators: false) {
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
                                        
                                     
                                        pilot.push(.CgZU7mTgY46l(session: r.session, opponentAvatarURL: r.avatarUrl, qOH29Z5X: false))
                                        
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
            ZStack{
                ZJ7h766mz(tMmEWWlfgUag: isY0A2C6WEL ? "z85EQRE2f9H6SK" : "epWZzJO7eD860n")
                                   .frame(width: 88, height: 36)
                
                Text(ti9QZ7xM4bV)
                    .g0LIIcoZQsOjyND9(
                        size: 16,
                        weight: isY0A2C6WEL ? .semibold : .regular,
                        color: .white.opacity(isY0A2C6WEL ? 1 : 0.6)
                    )
            }
           
        }
        .frame(width: 88, height: 36)
   
        .cornerRadius(325)
        .gradientBorder(shQY7b9WEL: isY0A2C6WEL)
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

