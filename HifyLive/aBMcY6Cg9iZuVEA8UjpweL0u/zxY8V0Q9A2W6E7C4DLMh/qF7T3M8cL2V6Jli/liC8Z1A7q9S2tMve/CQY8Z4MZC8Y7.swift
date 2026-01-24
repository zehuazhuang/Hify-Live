
import SwiftUI
import UIKit
import SwiftfulRouting
// 2️⃣ SwiftUI 页面返回封装后的 UIKit
struct LE0xQZ6Y7WC8iv: View {
    let channelName: String
    let localUid: UInt
    let zA9Y4W6LUid: UInt
    @Environment(\.router) var rM9Z8S7A1ql
    @State private var liveRoomData: [String: Any]? = nil

    var body: some View {
        ZStack {
            LiveViewContainer(
                channelName: channelName,
                localUid: localUid
            )
            .ignoresSafeArea()

            VStack{
                HStack(spacing:4){
                    
                    HStack(spacing:0){
                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: ((liveRoomData?["icon"] as? String) ?? ""))
                                            .frame(width: 32,height: 32)
                                            .clipShape(Circle())
                                            .padding(.vertical,2)
                                            .padding(.leading,2)
                                            .padding(.trailing,4)
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
                        }.padding(.trailing,1)
                        
                        ZJ7h766mz(tMmEWWlfgUag: "d7daxM4M9A2")
                                           .frame(width: 28, height: 20)
                        
                    }.frame(width: 150,height: 36)
                        .background(.white.opacity(0.3))
                        .cornerRadius(325)
                    
                  
                    
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
//                                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
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
                    
                    Text("\((liveRoomData?["joinNum"] as? Int) ?? 0)")
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular
                                    )
                                    .padding(.horizontal,12)
                                    .padding(.vertical,7)
                                    .background(.black.opacity(0.2))
                                    .cornerRadius(36)
                    Spacer()
                    
                    ZJ7h766mz(tMmEWWlfgUag: "pD8K1Q5tB6R9Lh")
                                       .frame(width: 32, height: 32)
                                       .onTapGesture {
                                           rM9Z8S7A1ql.dismissScreen()
                                       }
                }
                Spacer()
            }.padding(.horizontal,16)
            ChatViewContainer(yxRoomId: "11297788134", userId: "1000007479")
                .edgesIgnoringSafeArea(.bottom)
        }.task {
            do {
                let result = try await joinlive(pmpresoZUid: Int(zA9Y4W6LUid))
//                print("---------------------")
//                print(result)
                liveRoomData = result
            } catch {
                print("joinlive failed:", error)
            }
        }
    }
}


struct LiveViewContainer: UIViewControllerRepresentable {
    let channelName: String
    let localUid: UInt

    func makeUIViewController(context: Context) -> LiveViewController {
        let vc = LiveViewController(channelName: channelName, localUid: localUid)
        vc.view.backgroundColor = .black
        return vc
    }

    func updateUIViewController(_ uiViewController: LiveViewController, context: Context) {}
}
