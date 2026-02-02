

//message模块
import SwiftUI
import NIMSDK
import SwiftfulRouting
import Combine

struct J9L2X1pF8D5ms: View {
    @ObservedObject var sessionStore = RecentSessionStore.shared
    @Environment(\.router) var rM9Z8S7A1ql
    @StateObject private var X9QpF3L0b7M8R2 = L3vM9X0aQ8yF4b.shared //直播数据
    @State private var openRowId: UUID? = nil
    let wzJqE7XWO : ()-> Void //回到home
    var body: some View {
        
            ScrollView(showsIndicators: false){
                VStack(spacing: 4) {
                // 顶部水平快捷消息栏
                    
                    if X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH.count > 0{
                        let items = X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH
                        ScrollView(.horizontal, showsIndicators: false) {
                               HStack(spacing: 16) {
                                   // 只循环最多 4 个元素
                                   ForEach(Array(items.prefix(4)).indices, id: \.self) { index in
                                       AqS7C1A2tLt(mdFf7YData: items[index])
                                           .onTapGesture {
                                               rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                                   WUjfoptOKs8pZfhSAH0duplG {
                                                       LE0xQZ6Y7WC8iv(channelName: items[index].string("agoraChannelId"), localUid: UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")),
                                                                      zA9Y4W6LUid: UInt(items[index].int("userId")))
                                                   }
                                               }
                                           }
                                   }
                                   Spacer()
                                   if items.count > 4 {
                                       VStack {
                                           ZJ7h766mz(tMmEWWlfgUag: "mM3S8q9A2Co")
                                               .frame(width: 56, height: 56)
                                           Text("More")
                                               .g0LIIcoZQsOjyND9(size: 14, weight: .regular, color: .white.opacity(0.6))
                                       }.onTapGesture {
                                           wzJqE7XWO()
                                       }
                                   }
                                 
                               }
                               .padding(.horizontal, 16)
                           }
                    }
      
                
                // 系统消息示例
//                VStack {
//                    HStack(spacing: 10) {
//                        ZJ7h766mz(tMmEWWlfgUag: "tLZ71tLM433")
//                            .frame(width: 48, height: 48)
//                        VStack(alignment: .leading, spacing: 3) {
//                            Text("Platform")
//                                .g0LIIcoZQsOjyND9(size: 14, weight: .regular)
//                            Text("Congratulations! Your VIP ...")
//                                .g0LIIcoZQsOjyND9(size: 14, weight: .regular, color: .white.opacity(0.6))
//                        }
//                        Spacer()
//                        VStack {
//                            Text("10-09")
//                                .g0LIIcoZQsOjyND9(size: 14, weight: .regular, color: .white.opacity(0.6))
//                            Spacer()
//                            ZJ7h766mz(tMmEWWlfgUag: "rX2M9V3aL8P")
//                                .frame(width: 28, height: 20)
//                        }
//                        .frame(width: 35, height: 48)
//                    }
//                    .frame(height: 76)
//                    .frame(maxWidth: .infinity)
//                    .padding(.horizontal, 16)
//                    .background(
//                        LinearGradient(
//                            colors: [
//                                Color(red: 120 / 255, green: 223 / 255, blue: 255 / 255, opacity: 0.1),
//                                Color(red: 84 / 255, green: 105 / 255, blue: 199 / 255, opacity: 0.15)
//                            ],
//                            startPoint: .leading,
//                            endPoint: .trailing
//                        )
//                    )
//                }
                    if sessionStore.cache.isEmpty {
                        LQ0Z4A6C9emp()
                    } else {
                        LazyVStack {
                            ForEach(sessionStore.cache) { rZq7S8A9 in
                                SwipeRow(id: rZq7S8A9.id, openRowId: $openRowId) {
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
                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                        CgZU7mTgY46l(session: r.session, opponentAvatarURL: r.avatarUrl)
                                                    }
                                                }
                                            },
                                         
                                        )
                                    } onDelete: {
                                        withAnimation {
                                            sessionStore.removeSession(withId: rZq7S8A9.id)
                                        }
                                    }
                                   
                                }
                    }
                    }
            }
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
        ).simultaneousGesture(
            TapGesture().onEnded {
                openRowId = nil
            }
        ) .onAppear {
            sessionStore.fetchRecentSessions()
            
        }
    }
}


