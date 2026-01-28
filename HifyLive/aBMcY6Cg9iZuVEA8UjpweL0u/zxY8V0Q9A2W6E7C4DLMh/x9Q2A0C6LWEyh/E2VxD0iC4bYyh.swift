import SwiftUI
import SwiftfulRouting
import AgoraRtcKit
//首页
struct E2VxD0iC4bYyh: View {
 
    
    let evntemporaeCol: [GridItem] = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7)
    ]
    @StateObject private var X9QpF3L0b7M8R2 = L3vM9X0aQ8yF4b.shared //直播数据
    @State private var ecorjazyType: Bool = true // true recommend false following
    @State private var isLoading: Bool = false
    @Environment(\.router) var rM9Z8S7A1ql
    @StateObject private var qVi2QJ0SeDluhZ9xoQ8V7 = IyfdHMdY.bTa3L6BoprG
    @State private var liveVC: UIViewController?
    
    @StateObject private var followingCache = FollowingCache.shared //关注数据
   
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            ZJ7h766mz(tMmEWWlfgUag: "A8cS2Z7L1M9qC3t4")
                .scaledToFill()
                .frame(height: 375)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                .ignoresSafeArea()
            
            VStack(spacing:14){
                HStack(spacing:0){
                    HStack(spacing:20){
                        ZStack{
                            Text("aenXYlIxRVDJsfY9UGDdwQ==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: ecorjazyType ? .black : .semibold,
                                    color: ecorjazyType ?  .white : .white.opacity(0.4)
                                ).frame(maxHeight: .infinity,alignment:.top)
                            if ecorjazyType {
                                ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                    .frame(width: 28, height: 12)
                                    .frame(maxHeight: .infinity,alignment:.bottom)
                            }
                            
                        }
                        .frame(width: 102,height: 34)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation{
                                ecorjazyType = true
                            }
                        }
                        ZStack{
                            Text("upaJ9DE+S7JQIlcEJCYVIg==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: !ecorjazyType ? .black : .semibold,
                                    color: !ecorjazyType ?  .white : .white.opacity(0.4)
                                ).frame(maxHeight: .infinity,alignment:.top)
                            
                            if !ecorjazyType {
                                ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                    .frame(width: 28, height: 12)
                                    .frame(maxHeight: .infinity,alignment:.bottom)
                            }
                        }
                        .frame(width: 102,height: 34)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation{
                                ecorjazyType = false
                            }
                        }
                    }.padding(.top,8)
                    
                    
                    
                    
                    Spacer()
                    ZJ7h766mz(tMmEWWlfgUag: "Zq7S9M2C18L4A3t")
                        .frame(width: 36, height: 36)
                        .onTapGesture {
                            rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                WUjfoptOKs8pZfhSAH0duplG {
                                    QsS1CqA9M8tL2fs()
                                }
                            }
                        }
                    Spacer().frame(width: 16)
                    ZJ7h766mz(tMmEWWlfgUag: "S3Z1qM7L9C28At4")
                        .frame(width: 54, height: 36)
                        .onTapGesture {
                            
                        }
                }
                
                ScrollView{
                    VStack{
                        
                            
                            if ecorjazyType {
                                if X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH.isEmpty {
                                    LQ0Z4A6C9emp()
                                    
                                }else{
                                    LazyVGrid(columns: evntemporaeCol, spacing: 7) {
                                        ForEach(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH.indices, id: \.self) { index in
                                            rL0X1V3LiveCell(bemindbeData: X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index])
                                                .onTapGesture{
                                                    
                                                    rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                                        WUjfoptOKs8pZfhSAH0duplG {
                                                            LE0xQZ6Y7WC8iv(channelName: X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("agoraChannelId"), localUid: UInt(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("userId")),
                                                                           zA9Y4W6LUid: UInt(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].int("userId")))
                                                        }
                                                    }
                                                }
                                        }
                                    }
                                }
                                   
                                
                                
                            }else{
                                if followingCache.items.isEmpty {
                                    LQ0Z4A6C9emp()
                                    
                                }else{
                                    LazyVGrid(columns: evntemporaeCol, spacing: 7) {
                                    ForEach(followingCache.items.indices, id: \.self) { index in
                                        rL0X1V3LiveCell(bemindbeData: followingCache.items[index])
                                            .onTapGesture{
                                                
                                                rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                        LE0xQZ6Y7WC8iv(channelName: followingCache.items[index].string("agoraChannelId"), localUid: UInt(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("userId")),
                                                                       zA9Y4W6LUid: UInt(followingCache.items[index].int("userId")))
                                                    }
                                                }
                                            }
                                    }
                                }
                                }
                     
                        }
                    }
                }
                }.padding(.horizontal,16)
            
            ZStack {
                ZJ7h766mz(tMmEWWlfgUag: "L9ZqA8C7S2M1t34")
                HStack(spacing: 2) {
                    ZJ7h766mz(tMmEWWlfgUag: "C7M2Z8A1L9tqS34")
                        .frame(width: 24, height: 24)
                    Text("146UaT+ePLcQEToZue3EtQ==".bFHEatcgE4zzU9TCfDonsu())
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                }
            }
            .frame(width: 79, height: 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.bottom, 122)
            .padding(.trailing,16)
            }.task {
                await X9QpF3L0b7M8R2.R4kF1V9bQ7mL2xT()
                await followingCache.loadFollowing()
                
                print("---直播数据-----")
                print(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH)
            }
        }
    }
    
    // 单个直播组件
    struct rL0X1V3LiveCell: View {
        let bemindbeData: [String: Any]
        var body: some View {
            ZStack {
                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: bemindbeData["backgroundImgUrl"])
                    .frame(width: 168, height: 205)
                HStack(alignment: .top) {
//                    HStack {
//                        ZJ7h766mz(tMmEWWlfgUag: "M7C9q1Z4A8tL2S3")
//                            .frame(width: 16, height: 16)
//                        Text("Make Friends")
//                                        .g0LIIcoZQsOjyND9(
//                                            size: 12,
//                                            weight: .regular
//                                        )
//                    }
//                    .padding(4)
//                    .background(Color.black.opacity(0.6))
//                    .clipShape(s7q2ZC1S9A4tM8L3(radius: 8, corners: [.bottomRight]))
                    Spacer()
                    HStack(spacing: 1) {
                        ZJ7h766mz(tMmEWWlfgUag: "2Z7A9LqS1tC8M34")
                            .frame(width: 16, height: 16)
                        Text("\(bemindbeData.int("joinNum"))")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular
                                        )
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .background(
                        RoundedRectangle(cornerRadius: 35, style: .continuous)
                            .fill(Color.black.opacity(0.15))
                    )
                    .padding(8)
                }
                .frame(maxHeight: .infinity, alignment: .topLeading)
                HStack(spacing: 8) {
                    Text((bemindbeData["nickname"] as? String) ?? "")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                    ZJ7h766mz(tMmEWWlfgUag: "M7C9q1Z4A8tL2S3")
                        .frame(width: 16, height: 16)
                    Spacer()
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(8)

            }
            .frame(height: 205)
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
            

        }
    }

extension UIApplication {
    var currentWindow: UIWindow? {
        // 获取当前活动的 windowScene
        connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .first?
            .windows
            .first { $0.isKeyWindow }
    }
}
