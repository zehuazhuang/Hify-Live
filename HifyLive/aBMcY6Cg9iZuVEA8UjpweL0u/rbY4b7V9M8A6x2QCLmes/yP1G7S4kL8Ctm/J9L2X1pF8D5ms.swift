

//message模块
import SwiftUI
import NIMSDK
import Combine
import UIPilot

struct J9L2X1pF8D5ms: View {
    @ObservedObject var sessionStore = RecentSessionStore.shared
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @StateObject private var X9QpF3L0b7M8R2 = L3vM9X0aQ8yF4b.shared //直播数据
    @State private var openRowId: UUID? = nil
    let wzJqE7XWO : ()-> Void //回到home
    var body: some View {
        
            ScrollView(showsIndicators: false){
                VStack(spacing: 4) {
                // 顶部水平快捷消息栏
                    
                    if X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH.count > 0{
                        let items = X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH
                        VStack(spacing:0){
                            HStack{
                                Text("Live Streaming")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16,
                                                    weight: .medium
                                                )
                                Spacer()
                                if items.count > 5 {
                                    HStack(spacing:0){
                                        Text("More")
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 14,
                                                            weight: .regular,
                                                            color: .white.opacity(0.6)
                                                        )
                                        
                                        ZJ7h766mz(tMmEWWlfgUag: "th0Ut3j5AeDfnIFS")
                                                           .frame(width: 24, height: 24)
                                    }.onTapGesture {
                                        wzJqE7XWO()
                                    }
                                }
                                
                            }.padding(.horizontal, 16)
                             .padding(.top,12)
                            HStack(spacing:16) {
                                       let displayedItems = Array(items.prefix(5))
                                       ForEach(displayedItems.indices, id: \.self) { index in
                                           AqS7C1A2tLt(mdFf7YData: displayedItems[index])
                                               .onTapGesture {
                                                   pilot.push(.zhwyzs0gELive(localUid: UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")), zA9Y4W6LUid: UInt(displayedItems[index].int("userId"))))
                                               }
                                           if displayedItems.count == 5 {
                                               if index != displayedItems.indices.last {
                                                   Spacer()
                                               }
                                           }else if index == displayedItems.indices.last {
                                               Spacer()
                                           }
                                       }
                                   }.padding(.top,20)
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
                    Spacer().frame(height: 16)
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

                                           
                                                
                                                pilot.push(.CgZU7mTgY46l(session: r.session, opponentAvatarURL: r.avatarUrl, qOH29Z5X: false))
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
        ).simultaneousGesture(
            TapGesture().onEnded {
                openRowId = nil
            }
        ) .onAppear {
            sessionStore.fetchRecentSessions()
            
        }
    }
}


