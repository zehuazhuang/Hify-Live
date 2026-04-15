

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
    @State private var eHHmfq7UeU = false //是否第一次进入
    @State private var antAWyLAMipD = false //刷新
    let wzJqE7XWO : ()-> Void //回到home
    @State private var pulse: CGFloat = 0.9
    
    @ObservedObject var blacklist = TPb21z0U.eDNcFBMyyi
    var body: some View {
        
            ScrollView(showsIndicators: false){
                VStack(spacing: 4) {
                // 顶部水平快捷消息栏
                    if antAWyLAMipD {
                        ProgressView()
                            .tint(.white)
                            .scaleEffect(1.4)
                    }
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
                                            AqS7C1A2tLt(mdFf7YData: displayedItems[index], sQAaUsT619o: $pulse)
                                                .onAppear {
                                                               withAnimation(.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
                                                                   pulse = 1.15
                                                               }
                                                           }
                                               .onTapGesture {
                                                   
                                                   if TPb21z0U.eDNcFBMyyi.isBlocked(accid: X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("yxAccid")) {
                                                        
                                                        
                                                        QlzJ4yJcxJXY2paN
                                                            .rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                                                            .m3nArFwdHhI82cPUmiqW8PtaaHz("You have reported \(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("nickname")), so you cannot enter this live room. Thank you for reporting.", type: 1,z2E1geUN5miQ95SpoCG: false)
                                                        
                                                        return
                                                    }
                                                   
                                                   LiveSessionManager.shared.currentChannelUserId = UInt(displayedItems[index].int("userId"))
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
                    }else{
                        Spacer().frame(height: 16)
                    }
      
                

                    
                    if sessionStore.cache.isEmpty {
                        LQ0Z4A6C9emp(mCl1LLEjan: "No Data")
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

                                                
                                                
                                                if (r.sessionId == "video-sky-test") {
                                                    //进入系统页面
                                                    pilot.push(.R9Avd3G1i846xe(session: r.session))
                                                }else{
                                                    pilot.push(.CgZU7mTgY46l(session: r.session, opponentAvatarURL: r.avatarUrl, qOH29Z5X: false))
                                                    
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
            }.padding(.bottom,96)
        }.simultaneousGesture(
            DragGesture(minimumDistance: 5)
                .onChanged { value in
                    if abs(value.translation.height) > abs(value.translation.width) {
                        if openRowId != nil {
                            openRowId = nil
                        }
                    }
                }
                .onEnded { value in
                            let dy = value.translation.height
                            if dy > 120 && !antAWyLAMipD {
                                Task {
                                    antAWyLAMipD = true
                                    print("刷新")
                                    await sessionStore.fetchRecentSessions()
                                    try? await Task.sleep(nanoseconds: 800_000_000)
                                    await MainActor.run {
                                        withAnimation {
                                            antAWyLAMipD = false
                                        }
                                    }
                                }
                            }
                        }
        ).simultaneousGesture(
            TapGesture().onEnded {
                openRowId = nil
            }
        )
        .onAppear {
            guard !eHHmfq7UeU else { return }
            eHHmfq7UeU = true
            Task{
               await sessionStore.fetchRecentSessions()
            }
            
            let blacklist = TPb21z0U.eDNcFBMyyi
            print("黑名单")
            print(blacklist.lLPppWtfV5O6YMV5wl9nsA4nt)
        }
    }
}


