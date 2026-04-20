
import SwiftUI
import UIKit
import UIPilot
import NIMSDK
//直播页
struct LE0xQZ6Y7WC8iv: View {
   
    let localUid: UInt
    let zA9Y4W6LUid: UInt
    @State private var liveRoomData: [String: Any] = [:] //数据
    @State private var showEndView: Bool = false//主播关播显示
    @State private var showY2E8Qsc: Bool = false//显示用户底部弹框
    @State private var uY0E4QZ9MLId: Int = -1 //显示弹框用户id
    @State private var gGs5OpWId: String = "" //显示弹框用户yxAccid
    @State private var rlUlyPhType: Int = 0 //userId 还是 yxAccid
    @State private var showx8Z9Q2M: Bool = false//显示关闭直播间弹框
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var retryTask: Task<Void, Never>?
    @State private var xHuEezXnuhxl: Bool = false//是否第一次加载
    @State private var qkUZGHPNnHgfhW: Bool = false//显示礼物弹框
    @State private var x7hEzzGUTAch0: Bool = false//显示充值商店
    @State private var iENw26wu7cQ: [[String: Any]] = [] //直播间大哥位数据
    @State private var onlineCountTask: Task<Void, Never>? //在线定时
    @State private var eLx8RIeCY: Int = 0 //直播间在线人数
    @StateObject private var giftManager = GiftQueueManager() //特效
    @State private var lastTopRefreshTime: Date? = nil
    @State private var scheduledTopRefreshTask: Task<Void, Never>? = nil
    @State private var showRankSheet: Bool = false //在线人数弹框
    @State private var chatSession: ChatSessionWrapper?
    @State private var xa75H58IWv: Bool = false //显示挽留弹窗
    init(localUid: UInt, zA9Y4W6LUid: UInt) {
       
        self.localUid = localUid
        self.zA9Y4W6LUid = zA9Y4W6LUid
        
     
        
    }
    
    var body: some View {
        ZStack {
            LiveViewContainer(
                liveRoomData: liveRoomData,
                localUid: localUid
            )
            .ignoresSafeArea()

            VStack {
                    Spacer()
                ChatViewContainer(yxRoomId:liveRoomData.string("yxRoomId") , userId:liveRoomData.int("userId"), hostYxAccid: liveRoomData.string("yxAccid") ,
                                  onMuteTappedCallback: { uid, mute in
                    
                    
                    //静音功能
                    NotificationCenter.default.post(
                            name: .muteRemoteAudio,
                            object: nil,
                            userInfo: [
                                "uid": uid,
                                "mute": mute
                            ]
                        )
                    
                                      
                                    
                    },
                    onUserAvatarTapped: { yxAccid in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    withAnimation{
                        rlUlyPhType = 1
                        showY2E8Qsc = true
                        gGs5OpWId = yxAccid
                    }
                                     },
                    ong4Gu8Ogiska: {
                                         
                    withAnimation{
                        qkUZGHPNnHgfhW = true
                    }
                    },
                    w8esoH7cO33: {
                    
                  
                    let session = NIMSession(liveRoomData.string("yxAccid"), type: .P2P)
                    chatSession = ChatSessionWrapper(session: session, u1NCaZAWMA: liveRoomData.string("icon"))
                    
                   
                                     },
                                  onReceiveGift: { giftImg, giftNum, giftId in
                    guard let url = URL(string: giftImg) else { return }

                    let giftItem = GiftAnimationItem(
                        giftId: "\(giftId)",
                        url: url,
                        count: giftNum
                    )
                    self.giftManager.enqueueGift(giftItem)
                    
                    
                    // 节流刷新top
                   
                                        let now = Date()
                                        let throttleInterval: TimeInterval = 3
                                        
                                       
                                        if let lastTime = lastTopRefreshTime, now.timeIntervalSince(lastTime) >= throttleInterval {
                                            Task {
                                                await uNyOEJGn3o(seUMbDSk: liveRoomData.int("id"))
                                            }
                                            lastTopRefreshTime = now
                                            
                                            
                                            scheduledTopRefreshTask?.cancel()
                                            scheduledTopRefreshTask = nil
                                            
                                        } else if lastTopRefreshTime == nil {
                                            
                                            Task {
                                                await uNyOEJGn3o(seUMbDSk: liveRoomData.int("id"))
                                            }
                                            lastTopRefreshTime = now
                                            
                                        } else {
                                            
                                            scheduledTopRefreshTask?.cancel()
                                            let delay = throttleInterval - now.timeIntervalSince(lastTopRefreshTime!)
                                            
                                            scheduledTopRefreshTask = Task {
                                                try? await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
                                                await uNyOEJGn3o(seUMbDSk: liveRoomData.int("id"))
                                                lastTopRefreshTime = Date()
                                                scheduledTopRefreshTask = nil
                                            }
                                        }
                                    
                    
                    
                    
                }, nd8XGgxX9b: {rfvgzQ4 in
                   
                    if rfvgzQ4 {
                        eLx8RIeCY += 1
                    }else{
                        eLx8RIeCY -= 1
                    }
                }
                )
                }.edgesIgnoringSafeArea(.bottom)
            VStack{
                HStack(spacing:4){
                    HStack(spacing:0){
                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: liveRoomData.string("icon") )
                                            .frame(width: 32,height: 32)
                                            .clipShape(Circle())
                                            .padding(.vertical,2)
                                            .padding(.leading,2)
                                            .padding(.trailing,4)
                                            .allowsHitTesting(false)
                        VStack(alignment:.leading){
                            Text(liveRoomData.string("nickname"))
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .medium
                                            )
                            let us8b4V9Y0d = liveRoomData.int("userId")
                            Text("ID:" + String(us8b4V9Y0d))
                                            .g0LIIcoZQsOjyND9(
                                                size: 12,
                                                weight: .regular
                                            )
                        }
                            
                        if liveRoomData.int("followFlag") == 0 {
                            
                            
                            
                            
                            ZJ7h766mz(tMmEWWlfgUag: "d7daxM4M9A2")
                                               .frame(width: 28, height: 20)
                                               .onTapGesture {
                                                   Task {
                                                       EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                                                       do {
                                                           let is9MZC7A4 =  try await fol6W9ZQ4xC2(uY2M8A4E7C0xL:liveRoomData.int("userId") , iA6M7W9EYL0: 1)
                                                           if(is9MZC7A4){
                                                               
                                                               liveRoomData["followFlag"] = 1

                                                           }
                                                           EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                       } catch {
                                                           print(error)
                                                       }
                                                   }
                                               }
                        }else{
                            Spacer().frame(width: 6)
                        }
                    }
                    .padding(.horizontal,2)
                   
                    .frame(height: 36)
                        .background(.white.opacity(0.3))
                        .cornerRadius(325)
                        .onTapGesture {
                            withAnimation{
                                rlUlyPhType = 0
                                showY2E8Qsc = true
                                uY0E4QZ9MLId = liveRoomData.int("userId")
                            }
                        }
                  
                    Spacer()
                    HStack(spacing:4){
                        
                        ForEach(Array(iENw26wu7cQ.prefix(3)).indices, id: \.self) { index in
                            let gradientColors: [Color] = {
                                switch index {
                                case 0:
                                    return [Color(red: 232/255, green: 191/255, blue: 64/255).opacity(0.8),
                                            Color(red: 232/255, green: 132/255, blue: 65/255).opacity(0.8),]
                                case 1:
                                    return [Color(red: 175/255, green: 181/255, blue: 210/255).opacity(0.8),
                                            Color(red: 160/255, green: 167/255, blue: 217/255).opacity(0.8),]
                                case 2:
                                    return [Color(red: 180/255, green: 119/255, blue: 75/255).opacity(0.8),
                                            Color(red: 180/255, green: 119/255, blue: 75/255).opacity(0.8),]
                                default:
                                    return [Color.black, Color.gray]
                                }
                            }()

                            ZStack {
                                if(iENw26wu7cQ[index].string("icon") == ""){
                                    ZJ7h766mz(tMmEWWlfgUag: "gCZGrlvVVn1D")
                                        .frame(width: 32, height: 32)
                                        .clipShape(Circle())
                                        .padding(.bottom, 2)
                                        .allowsHitTesting(false)
                                }else{
                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: iENw26wu7cQ[index].string("icon"))
                                        .frame(width: 32, height: 32)
                                        .clipShape(Circle())
                                        .padding(.bottom, 2)
                                        .allowsHitTesting(false)
                                }
                                
                                ZStack{
                                    Text("\(iENw26wu7cQ[index].int("totalGiftValue").xN98uRxq())")
                                        .g0LIIcoZQsOjyND9(
                                                            size: 12,
                                                            weight: .regular
                                                        )
                                }
                                    .frame(width: 32,height: 14)
                                    .background(
                                        LinearGradient(
                                            colors: gradientColors,
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        )

                                    )
                                    .cornerRadius(12)
                                    .frame(maxHeight: .infinity,alignment: .bottom)
                            }
                            .frame(width: 32, height: 34)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    rlUlyPhType = 0
                                    showY2E8Qsc = true
                                    uY0E4QZ9MLId = iENw26wu7cQ[index].int("userId")
                                }
                            }
                        }
                    }
                    
                    Text("\(eLx8RIeCY)")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular
                                    )
                                    .padding(.horizontal,12)
                                    .padding(.vertical,7.5)
                                    .background(.black.opacity(0.2))
                                    .cornerRadius(36)
                                    .onTapGesture {
                                            showRankSheet = true
                                        }
                    
                    
                    ZJ7h766mz(tMmEWWlfgUag: "pD8K1Q5tB6R9Lh")
                                       .frame(width: 32, height: 32)
                                       .onTapGesture {
                                           withAnimation{
                                               showx8Z9Q2M = true
                                           }
                                       }
                }
                Spacer()
            }.padding(.horizontal,16)
               
            //关播直播间弹框
            if showx8Z9Q2M {
                Z8q7S9A1C2tLClo(hllonneC8R2J: $showx8Z9Q2M, caentClo: {
                    pilot.pop()
                },ourreeName: liveRoomData.string("nickname") ,dimpaseAvatar: liveRoomData.string("icon") )
            }
            
            //底部用户弹框
            if showY2E8Qsc {
                QZ4A0M84C7WL9(sBb3SaType:rlUlyPhType,uZQx7MId: uY0E4QZ9MLId,hN9EY2BId:gGs5OpWId, nIq2dmKcGA0: {t6FBqjXlaJ,djMiejuudZ in
                    //私聊半屏
                    
                
                    let session = NIMSession(t6FBqjXlaJ, type: .P2P)
                    chatSession = ChatSessionWrapper(session: session, u1NCaZAWMA: djMiejuudZ)
                    
                }, isW9YQ6C8L: $showY2E8Qsc, yaXdI1QB7uP: {e570ZTkO2 in
                    
                    liveRoomData["followFlag"] = e570ZTkO2
                })
            }
            
            //礼物弹框
            if qkUZGHPNnHgfhW {
                //礼物view
                QX10IFCuguXvQa(dyzmBppNrJ: $qkUZGHPNnHgfhW, jhqguQVC07: {
                    withAnimation{
                        x7hEzzGUTAch0 = true
                    }
                }, wlXWcyaNuj: liveRoomData.int("userId"), mCrenfA3xJE: "NEW_LIVE", jEhg1fS1G8: liveRoomData.int("id"), tGT2R2amV: liveRoomData.string("yxAccid"), vTubwwYkiq: liveRoomData.string("nickname"))
            }
            //商店弹框
            if x7hEzzGUTAch0 {
                ZStack{
                    // 半透明背景
                    Color.black.opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            if LiveSessionManager.shared.o45JZp9AD1sB {
                                withAnimation {
                                    x7hEzzGUTAch0 = false
                                    LiveSessionManager.shared.o45JZp9AD1sB = false
                                }
                            }else{
                                withAnimation{
                                    xa75H58IWv = true
                                }
                                LiveSessionManager.shared.o45JZp9AD1sB = true
                            }
                            
                        }
                    // 弹窗本体
                    Afmox09Q1UKVfE(daPQCKaHi: true)
                        .frame(height: 580)
                        .frame(maxHeight: .infinity,alignment:.bottom)
                }
            }
            
            //挽留弹窗
            if xa75H58IWv {
                R7mL2X9B1qZ5vY(tP3QY4dC7W: $xa75H58IWv)
            }
            
            if liveRoomData.int("agoraChannelId") != 0 {
                GiftAnimationPlayer(
                    manager: LiveGiftManager.manager(
                        for: UInt(liveRoomData.int("agoraChannelId"))
                    )
                )
            }
            //特效动画
            GiftAnimationPlayer(manager: giftManager)
            
            //关播页面
            if showEndView || liveRoomData.int("liveRoomState")  == 1 {
                MZ7S8q9A1C2tL43x(x0W6LivDate: liveRoomData)
            }
        }.sheet(isPresented: $showRankSheet) {
            Eu1xbwzA1AwXn4(
                vGC3obKy3jw: liveRoomData.int("userId"),
                gD5nKIXUMI: liveRoomData.int("id"),
                
            )
            .environmentObject(pilot)
            .presentationDetents([.fraction(0.75)])
        }.sheet(item: $chatSession) { wrapper in
            WUjfoptOKs8pZfhSAH0duplG(showGlobalNotice: false) {
                CgZU7mTgY46l(
                    session: wrapper.session,
                    opponentAvatarURL: wrapper.u1NCaZAWMA,
                    qOH29Z5X: true
                )
                .environmentObject(pilot)
            }.presentationDetents([.fraction(0.75)])
            .presentationBackground(.clear)
        }
        .onAppear{
            if (!xHuEezXnuhxl){
                mpatentLoad()
                
                NotificationCenter.default.addObserver(forName: .liveEnded, object: nil, queue: .main) { _ in
                       showEndView = true
                   }
                xHuEezXnuhxl = true
                
                startOnlineCountLoop()
            }
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }.onDisappear {
            stopOnlineCountLoop()
            retryTask?.cancel()
            retryTask = nil
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    func mpatentLoad() {
        retryTask = Task {
            await retryJoinLive()
        }
    }
    //获取在线人数
    func startOnlineCountLoop() {
        onlineCountTask = Task {
            while !Task.isCancelled {
                do {
                    
                    iENw26wu7cQ = try await luJfveDVkRb(pQO2dnNxqK: liveRoomData.int("id"))
                    
                    
                } catch {
                    print("error:", error)
                }
                try? await Task.sleep(nanoseconds: 3_000_000_000) // 3秒
            }
        }
    }
    //结束定时
    func stopOnlineCountLoop() {
        onlineCountTask?.cancel()
        onlineCountTask = nil
    }
    
    // 查大哥位
    func uNyOEJGn3o(seUMbDSk:Int) async {
        do{
            iENw26wu7cQ = try await luJfveDVkRb(pQO2dnNxqK: seUMbDSk)
        }catch{
            print(error)
        }
    }
    
    //加入直播
    func retryJoinLive() async {
        var retryDelay: UInt64 = 2_000_000_000
        
        while !Task.isCancelled {
            
            do {
                let result = try await joinlive(pmpresoZUid: Int(zA9Y4W6LUid))
                
                if !result.isEmpty {
                    //直播间top3
                    
                    await uNyOEJGn3o(seUMbDSk: result.int("id"))
                    
                    liveRoomData = result
                    //获取在线人数
                    eLx8RIeCY = try await d34SzmkHKFl(mcIOzuQURD: liveRoomData.int("userId"), phqabUmw: 1).count
                    
                    
                    break
                }
                
            } catch {
                print(error)
            }
            
            try? await Task.sleep(nanoseconds: retryDelay)
            retryDelay = min(retryDelay * 2, 10_000_000_000)
        }
        
       
    }
}


struct LiveViewContainer: UIViewControllerRepresentable {
    let liveRoomData: [String: Any]
    let localUid: UInt

    func makeUIViewController(context: Context) -> LiveViewController {
        LiveViewController(
            liveRoomData: liveRoomData,
            localUid: localUid
        )
    }

    func updateUIViewController(
        _ uiViewController: LiveViewController,
        context: Context
    ) {
        uiViewController.updateIfNeeded(liveRoomData: liveRoomData)
    }
}

struct ChatSessionWrapper: Identifiable {
    let session: NIMSession
    let u1NCaZAWMA: String   // 对方头像
    
    var id: String {
        session.sessionId
    }
}
