
import SwiftUI
import UIKit
import SwiftfulRouting
// 2️⃣ SwiftUI 页面返回封装后的 UIKit
struct LE0xQZ6Y7WC8iv: View {
    @State private var channelName: String
    let localUid: UInt
    let zA9Y4W6LUid: UInt
    @Environment(\.router) var rM9Z8S7A1ql
    @State private var liveRoomData: [String: Any]? = nil
    
    @State private var showEndView: Bool = false//主播关播显示
    @State private var showY2E8Qsc: Bool = false//显示用户底部弹框
    @State private var uY0E4QZ9MLId: Int = -1 //显示弹框用户id
    @State private var gGs5OpWId: String = "" //显示弹框用户yxAccid
    @State private var rlUlyPhType: Int = 0 //userId 还是 yxAccid
    @State private var showx8Z9Q2M: Bool = false//显示关闭直播间弹框
    
    init(channelName: String, localUid: UInt, zA9Y4W6LUid: UInt) {
        _channelName = State(initialValue: channelName)
        self.localUid = localUid
        self.zA9Y4W6LUid = zA9Y4W6LUid
    }

    var body: some View {
        ZStack {
            LiveViewContainer(
                channelName: channelName,
                localUid: localUid
            )
            .ignoresSafeArea()

            VStack {
                    Spacer()
                ChatViewContainer(yxRoomId: (liveRoomData?["yxRoomId"] as? String) ?? "", userId: (liveRoomData?["userId"] as? Int) ?? 0,
                                  onMuteTappedCallback: { uid, mute in
                                      
                                        NotificationCenter.default.post(name: .muteRemoteAudio, object: nil, userInfo: ["uid": uid, "mute": mute])
                                    },
                                  onUserAvatarTapped: { yxAccid in
                                       
                    withAnimation{
                        rlUlyPhType = 1
                        showY2E8Qsc = true
                        gGs5OpWId = yxAccid
                    }
                                     }
                )
                }.edgesIgnoringSafeArea(.bottom)
            VStack{
                HStack(spacing:4){
                    HStack(spacing:0){
                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: ((liveRoomData?["icon"] as? String) ?? ""))
                                            .frame(width: 32,height: 32)
                                            .clipShape(Circle())
                                            .padding(.vertical,2)
                                            .padding(.leading,2)
                                            .padding(.trailing,4)
                                            .allowsHitTesting(false)
                        VStack(alignment:.leading){
                            Text((liveRoomData?["nickname"] as? String) ?? "")
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .medium
                                            )
                            let us8b4V9Y0d = (liveRoomData?["userId"] as? Int) ?? 0
                            Text("ID:" + String(us8b4V9Y0d))
                                            .g0LIIcoZQsOjyND9(
                                                size: 12,
                                                weight: .regular
                                            )
                        }
                            
                        if liveRoomData?["followFlag"] as? Int == 0 {
                            ZJ7h766mz(tMmEWWlfgUag: "d7daxM4M9A2")
                                               .frame(width: 28, height: 20)
                                               .onTapGesture {
                                                   Task {
                                                       do {
                                                         let is9MZC7A4 =  try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: (liveRoomData?["userId"] as? Int) ?? 0, iA6M7W9EYL0: 1)
                                                           if(is9MZC7A4){
                                                               
                                                               mpatentLoad()

                                                           }
                                                          
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
                                uY0E4QZ9MLId = (liveRoomData?["userId"] as? Int) ?? 0
                            }
                        }
                  
                    
//                    HStack(spacing:4){
//                        ForEach(0..<3) { index in
//                            let gradientColors: [Color] = {
//                                switch index {
//                                case 0:
//                                    return [Color(red: 232/255, green: 191/255, blue: 64/255).opacity(0.8),
//                                            Color(red: 232/255, green: 132/255, blue: 65/255).opacity(0.8),]
//                                case 1:
//                                    return [Color(red: 175/255, green: 181/255, blue: 210/255).opacity(0.8),
//                                            Color(red: 160/255, green: 167/255, blue: 217/255).opacity(0.8),]
//                                case 2:
//                                    return [Color(red: 180/255, green: 119/255, blue: 75/255).opacity(0.8),
//                                            Color(red: 180/255, green: 119/255, blue: 75/255).opacity(0.8),]
//                                default:
//                                    return [Color.black, Color.gray]
//                                }
//                            }()
//
//                            ZStack {
//                                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: //"https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
//                                    .frame(width: 32, height: 32)
//                                    .clipShape(Circle())
//                                    .padding(.bottom, 2)
//                                ZStack{
//                                    Text("1.1K")
//                                        .font(.system(size: 12, weight: .regular))
//                                }
//                                    .frame(width: 32,height: 14)
//                                    .background(
//                                        LinearGradient(
//                                            colors: gradientColors,
//                                            startPoint: .leading,
//                                            endPoint: .trailing
//                                        )
//
//                                    )
//                                    .cornerRadius(12)
//                                    .frame(maxHeight: .infinity,alignment: .bottom)
//                            }
//                            .frame(width: 32, height: 34)
//                        }
//                    }
                    Spacer()
                    Text("\((liveRoomData?["joinNum"] as? Int) ?? 0)")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular
                                    )
                                    .padding(.horizontal,5)
                                    .padding(.vertical,7)
                                    .background(.black.opacity(0.2))
                                    .cornerRadius(36)
                    
                    
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
            
            if showx8Z9Q2M {
                Z8q7S9A1C2tLClo(hllonneC8R2J: $showx8Z9Q2M, caentClo: {
                    rM9Z8S7A1ql.dismissScreen()
                },ourreeName:(liveRoomData?["nickname"] as? String) ?? "",dimpaseAvatar:(liveRoomData?["icon"] as? String) ?? "")
            }
            
            if showY2E8Qsc {
                QZ4A0M84C7WL9(sBb3SaType:rlUlyPhType,uZQx7MId: uY0E4QZ9MLId,hN9EY2BId:gGs5OpWId, isW9YQ6C8L: $showY2E8Qsc)
            }
            
            if showEndView || (liveRoomData?["liveRoomState"] as? Int) ?? -1 == 1 {
                MZ7S8q9A1C2tL43x(x0W6LivDate: liveRoomData)
            }
        }
        .onAppear{
            mpatentLoad()
            NotificationCenter.default.addObserver(forName: .liveEnded, object: nil, queue: .main) { _ in
                   showEndView = true
               }
        }.onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
    
    func mpatentLoad(){
        Task{
            do {
                let result = try await joinlive(pmpresoZUid: Int(zA9Y4W6LUid))
                liveRoomData = result
               
              
                if(channelName == ""){
                    channelName = (liveRoomData?["agoraChannelId"] as? String) ?? ""
                    
                }
                
            } catch {
                print(error)
            }
        }
     
    }
}


struct LiveViewContainer: UIViewControllerRepresentable {
    let channelName: String
    let localUid: UInt

    func makeUIViewController(context: Context) -> LiveViewController {
        LiveViewController(channelName: channelName, localUid: localUid)
    }

    func updateUIViewController(
        _ uiViewController: LiveViewController,
        context: Context
    ) {
        uiViewController.updateChannelIfNeeded(channelName)
    }
}
