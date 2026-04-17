import SwiftUI
import UIPilot

import AgoraRtcKit
//首页
struct E2VxD0iC4bYyh: View {
 
    
    let evntemporaeCol: [GridItem] = [
        GridItem(.flexible(), spacing: 7),
        GridItem(.flexible(), spacing: 7)
    ]
    @StateObject private var X9QpF3L0b7M8R2 = L3vM9X0aQ8yF4b.shared //直播数据
    @Binding var ecorjazyType: Bool // true recommend false following
    @StateObject private var qVi2QJ0SeDluhZ9xoQ8V7 = IyfdHMdY.bTa3L6BoprG
    @State private var liveVC: UIViewController?
    @StateObject private var followingCache = FollowingCache.shared //关注数据
    @State private var isRefreshing = false
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    
    
   
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
                            Task{
                                await followingCache.loadFollowing()
                            }
                        }
                    }.padding(.top,8)
                    
                    
                    
                    
                    Spacer()
                    ZJ7h766mz(tMmEWWlfgUag: "Zq7S9M2C18L4A3t")
                        .frame(width: 36, height: 36)
                        .onTapGesture {
                            pilot.push(.QsS1CqA9M8tL2fs)
                        }
                    //排名
                    Spacer().frame(width: 16)
                    ZJ7h766mz(tMmEWWlfgUag: "S3Z1qM7L9C28At4")
                        .frame(width: 54, height: 36)
                        .onTapGesture {
                            pilot.push(.Gcx3oCl1wFkbw1)
                        }
                }
                
                ScrollView(showsIndicators: false){
                    ZStack{
                        VStack{
                            if isRefreshing {
                                ProgressView()
                                    .tint(.white)
                                    .scaleEffect(1.4)
                            }
                           
                            
                            if ecorjazyType {
                                if X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH.isEmpty {
                                    LQ0Z4A6C9emp(mCl1LLEjan: "No Data")
                                        .padding(.top,6)
                                }else{
                                    LazyVGrid(columns: evntemporaeCol, spacing: 7) {
                                        ForEach(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH.indices, id: \.self) { index in
                                            rL0X1V3LiveCell(bemindbeData: X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index], is7Nqdlvk: index == 0)
                                                .onTapGesture{
                                                    
                                                    if TPb21z0U.eDNcFBMyyi.isBlocked(accid: X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("yxAccid")) {
                                                         
                                                         
                                                         QlzJ4yJcxJXY2paN
                                                             .rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                                                             .m3nArFwdHhI82cPUmiqW8PtaaHz("You have reported \(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("nickname")), so you cannot enter this live room. Thank you for reporting.", type: 1,z2E1geUN5miQ95SpoCG: false)
                                                         
                                                         return
                                                     }
                                                    
                                                    
                                                    LiveSessionManager.shared.currentChannelUserId = UInt(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].int("userId"))
                                                    pilot.push(
                                                        .zhwyzs0gELive(
                                                          
                                                            localUid: UInt(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("userId")),
                                                            zA9Y4W6LUid: UInt(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].int("userId"))
                                                        )
                                                    )
                                                }
                                        }
                                    }
                                }
                            }else{
                                if followingCache.items.isEmpty {
                                    LQ0Z4A6C9emp(mCl1LLEjan: "No Data")
                                        .padding(.top,6)
                                    
                                }else{
                                    LazyVGrid(columns: evntemporaeCol, spacing: 7) {
                                        ForEach(followingCache.items.indices, id: \.self) { index in
                                            rL0X1V3LiveCell(bemindbeData: followingCache.items[index], is7Nqdlvk: index == 0)
                                                .onTapGesture{
                                                    if TPb21z0U.eDNcFBMyyi.isBlocked(accid: X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("yxAccid")) {
                                                         
                                                         
                                                         QlzJ4yJcxJXY2paN
                                                             .rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                                                             .m3nArFwdHhI82cPUmiqW8PtaaHz("You have reported \(X9QpF3L0b7M8R2.W8pT2K6qR1mD5vH[index].string("nickname")), so you cannot enter this live room. Thank you for reporting.", type: 1,z2E1geUN5miQ95SpoCG: false)
                                                         
                                                         return
                                                     }
                                                    
                                                    LiveSessionManager.shared.currentChannelUserId = UInt(followingCache.items[index].int("userId"))

                                                    
                                                    pilot.push(.zhwyzs0gELive(localUid: UInt(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("userId")), zA9Y4W6LUid: UInt(followingCache.items[index].int("userId"))))
                                                }
                                        }
                                    }
                                }
                            }
                        }.padding(.bottom,96)
                        
                    }
                }.simultaneousGesture(
                    DragGesture()
                        .onEnded { value in
                            let verticalDelta = value.translation.height
                            if verticalDelta > 120 && !isRefreshing {
                                isRefreshing = true
                                Task {
                                    await X9QpF3L0b7M8R2.R4kF1V9bQ7mL2xT(forceRefresh: true)
                                   
                                    await MainActor.run {
                                        withAnimation {
                                            isRefreshing = false
                                        }
                                    }
                                }
                            }
                        }
                )
                }.padding(.horizontal,16)
                
                
                

            
            }
        
        
        .task {
                await X9QpF3L0b7M8R2.R4kF1V9bQ7mL2xT()
                await followingCache.loadFollowing()
                
             
            }
        }
    }



    // 单个直播组件
    struct rL0X1V3LiveCell: View {
        let bemindbeData: [String: Any]
        let is7Nqdlvk : Bool //是否第一个
        let spacing: CGFloat = 7
        let horizontalPadding: CGFloat = 16 * 2
        var body: some View {
            let screenWidth = UIScreen.main.bounds.width
                    let columnWidth = (screenWidth - horizontalPadding - spacing) / 2

            ZStack {
                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: bemindbeData["backgroundImgUrl"])
                    .frame(width: columnWidth, height: 205)
                    .allowsHitTesting(false)
                HStack(alignment: .top) {
                    
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
                //加渐变蒙版
                LinearGradient(
                    colors: [Color(red: 27/255, green: 31/255, blue: 52/255).opacity(0),
                        Color(red: 13/255, green: 16/255, blue: 21/255).opacity(0.6),
                             ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: 65)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .allowsHitTesting(false)
                HStack(spacing: 8) {
                    Text((bemindbeData["nickname"] as? String) ?? "")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                
                    CountryFlagView(countryCode: bemindbeData.string("countryId"))
                    Spacer()
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .padding(8)

            }
            .frame(height: 205)
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
//            .overlay(
//                Group {
//                    if is7Nqdlvk {
//                        
//                        let angle = 116.57 * Double.pi / 180
//                        let dx = cos(angle)
//                        let dy = sin(angle)
//                        
//                        
//                        let startPoint = UnitPoint(
//                            x: 0.5 + dx / 2,
//                            y: 0.5 + dy / 2
//                        )
//                        let endPoint = UnitPoint(
//                            x: 0.5 - dx / 2,
//                            y: 0.5 - dy / 2
//                        )
//                        
//                        RoundedRectangle(cornerRadius: 7, style: .continuous)
//                            .stroke(
//                                LinearGradient(
//                                    stops: [
//                                        .init(color: Color(red: 217/255, green: 28/255, blue: 255/255), location: 0.0),
//                                        .init(color: Color(red: 217/255, green: 28/255, blue: 255/255), location: 0.85),
//                                        .init(color: Color(red: 0/255, green: 242/255, blue: 255/255), location: 1.0),
//                                    ],
//                                    startPoint: startPoint,
//                                    endPoint: endPoint
//                                ),
//                                lineWidth: 2
//                            )
//                            .padding(1)
//                    }
//                }
//            )
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


struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
