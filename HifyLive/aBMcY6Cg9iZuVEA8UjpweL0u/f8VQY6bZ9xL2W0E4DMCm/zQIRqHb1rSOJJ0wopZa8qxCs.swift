import SwiftUI
import Photos
import Combine
import SwiftfulRouting

//个人、他人详情页面
struct zQIRqHb1rSOJJ0wopZa8qxCs: View {
    //背景图index
    @State private var fQAcgipdIEvxLs5OpaG0: Int = 0
    
    @Environment(\.router) var ftgPSmzMVe
    let areoloaUid : Int
    @State private var usQ8Y7Z6Inf: [String: Any] = [:] //用户数据
   // @StateObject private var m1nKfP0PAkzYaDvH15D4fsshmC = IyfdHMdY.bTa3L6BoprG
    
    //点击放大的图片
    @State private var pVzCUaYBcF5CZ1: String? = nil
    
    //是否登录用户
    @State private var istYGRYN4Q : Bool = false
    
    @State private var ncpingeRoom: [String: Any] = [:] //房间数据
    //显示举报
    @State private var isvk1OJMmL : Bool = false
    
    var  isFvNNQZQ : Bool {
        return  usQ8Y7Z6Inf.bool("followed")
    }
   
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            ScrollView (showsIndicators: false){
                LazyVStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        ZStack(alignment: .bottomTrailing,){
                            RoundedRectangle(cornerRadius: 0)
                                .fill(Color.clear)
                                .frame(height: 282)
                                .overlay {
                                        if usQ8Y7Z6Inf.isEmpty {
                                            ZJ7h766mz(tMmEWWlfgUag: "aahgbEc4eZP6p4gEMGcYjWv")
                                                
                                        } else {
                                            if let picList = usQ8Y7Z6Inf["picList"] as? [[String: Any]] {
                                                TabView(selection: $fQAcgipdIEvxLs5OpaG0) {
                                                    ForEach(picList.indices, id: \.self) { index in
                                                        let pic = picList[index]
                                                        let mediaUrl = pic["mediaUrl"] as? String ?? "" // 取出图片 URL

                                                        rP6kV1bS8qX3nT7(
                                                            pR9wQ2mL6hY5dF1: mediaUrl,
                                                            allPics: picList.compactMap { $0["mediaUrl"] as? String }
                                                                .filter { !$0.lowercased().hasSuffix(".mp4") }, // 传整个数组
                                                            V0QmF7P9ZL: true
                                                        ) {
                                                            ZJ7h766mz(tMmEWWlfgUag: "aahgbEc4eZP6p4gEMGcYjWv")
                                                        }
                                                        .tag(index)// TabView 的 selection 绑定
                                                    }
                                                }
                                                .tabViewStyle(.page(indexDisplayMode: .never)) // 可选：隐藏分页指示器
                                            }
                                        }
                                }
                                .clipped()
                            ZJ7h766mz(tMmEWWlfgUag: "jlvIw3ryygxHNI")
                                .frame(height: 119)
                        }
                        VStack(spacing: 0) {
                            Spacer().frame(height: 240)
                            VStack(spacing:8) {
                                HStack(spacing: 10) {
                                    Circle()
                                        .fill(Color.white.opacity(0.2))
                                        .frame(width: 88, height: 88)
                                        .overlay(alignment: .center) {
                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: usQ8Y7Z6Inf.string("icon"),V0QmF7P9ZL: true)
                                                .frame(width: 80,height: 80)
                                                .clipShape(Circle())
                                        }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 28){
                                        GeometryReader { j2ISkikaHFezqwHcZmm in
                                            HStack(spacing: 0){
                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack(spacing: 6){
                                                        if !istYGRYN4Q {
                                                            Button{
                                                                ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                                        o95HINW4DpHIAT(updplVCKiB4I: {
                                                                            pstjumLoad()
                                                                        })
                                                                    }
                                                                }
                                                            } label: {
                                                                RoundedRectangle(cornerRadius: 10)
                                                                    .fill(Color.white.opacity(0.32))
                                                                    .frame(width: 42,height: 32)
                                                                    .overlay(alignment: .center) {
                                                                        ZJ7h766mz(tMmEWWlfgUag: "yJv1l88NyCjeIR2yve6vkxIHscdO")
                                                                            .frame(width: 16,height: 16)
                                                                    }
                                                            }
                                                        }
                                                        
                                                        
                                                        if let picList = usQ8Y7Z6Inf["picList"] as? [[String: Any]] {

                                                            let imageList = picList.filter {
                                                                guard let url = $0["mediaUrl"] as? String else { return false }
                                                                return !url.lowercased().hasSuffix(".mp4")
                                                            }
                                                            ForEach(0..<imageList.count, id: \.self) { index in
                                                                let pic = picList[index]
                                                                let mediaUrl = pic["mediaUrl"] as? String ?? ""
                                                                
                                                                Button {
                                                                    fQAcgipdIEvxLs5OpaG0 = index // 绑定选中索引
                                                                } label: {
                                                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: mediaUrl)
                                                                        .frame(width: 42, height: 32)
                                                                        .clipShape(RoundedRectangle(cornerRadius: 4))
                                                                        .overlay(
                                                                            RoundedRectangle(cornerRadius: 4)
                                                                                .stroke(Color.white.opacity(fQAcgipdIEvxLs5OpaG0 == index ? 0.4 : 0), lineWidth: 2)
                                                                        )
                                                                        .allowsHitTesting(false)
                                                                }
                                                            }.frame(height:36)
                                                        }
                                                        
                                                    }.frame(minWidth: j2ISkikaHFezqwHcZmm.size.width, alignment: .trailing)
                                                }
                                            }
                                        }
                                        if !istYGRYN4Q {
                                            Button{
                                                ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                        lhOJY7byauJZOO6Kfr3SaKy6(updeUsttncmI: {
                                                            pstjumLoad()
                                                        })
                                                    }
                                                }
                                            } label: {
                                                RoundedRectangle(cornerRadius: 325)
                                                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                                    .frame(width: 92,height: 33)
                                                    .overlay(alignment: .center) {
                                                        HStack(spacing: 4) {
                                                            ZJ7h766mz(tMmEWWlfgUag: "yzujDXmvOUTLyKz")
                                                                .frame(width: 16,height: 16)
                                                            Text("Edit")
                                                                .g0LIIcoZQsOjyND9(
                                                                    weight: .medium
                                                                )
                                                        }
                                                    }
                                            }
                                        }
                                      
                                    }
                                }
                                .padding(.horizontal,16)
                                
                                VStack(spacing: 4){
                                    HStack(spacing: 0){
                                        Text(usQ8Y7Z6Inf.string("nickname"))
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .semibold
                                            )
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        Spacer()
                                    }
                                    HStack(spacing: 16){
                                        HStack(spacing: 4){
                                            let weCGKx4ftmOdrhQnvJeTrHKg = usQ8Y7Z6Inf.int("gender")
                                                ZJ7h766mz(tMmEWWlfgUag: weCGKx4ftmOdrhQnvJeTrHKg == 0 ? "vK1PV3wuy5o4JGId" : weCGKx4ftmOdrhQnvJeTrHKg == 1 ? "h8bx8HHiJD1BodEG8Zfzl" : "aSUqulEy")
                                                    .frame(width: 24,height: 24)
//                                            } else {
//                                                ZJ7h766mz(tMmEWWlfgUag: "vK1PV3wuy5o4JGId")
//                                                    .frame(width: 24,height: 24)
//                                            }
                                            Text(String(usQ8Y7Z6Inf.int("age",default: 22)))
                                                .g0LIIcoZQsOjyND9()
                                        }
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.4))
                                            .frame(width: 1, height: 13)
                                        CountryFlagView(countryCode: usQ8Y7Z6Inf.string("countryId"))
                                       
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.4))
                                            .frame(width: 1, height: 13)
                                        HStack(spacing: 4) {
                                            Text("zJ15CvylxUyAMrGGzo0H4Q==".bFHEatcgE4zzU9TCfDonsu()+String(usQ8Y7Z6Inf.int("userId")))
                                                .g0LIIcoZQsOjyND9()
                                            Button{
                                                let coaRRjVtVOXNbcGZNUa43 = String(
                                                    usQ8Y7Z6Inf.int(
                                                        "userId"
                                                    )
                                                )
                                                UIPasteboard.general.string = coaRRjVtVOXNbcGZNUa43
                                                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("REb1QH5U5jRdbMUtHMwvWQ==")
                                            } label: {
                                                ZJ7h766mz(tMmEWWlfgUag: "gnuwJqMH3sA8Hce5wxEX")
                                                    .frame(width: 16,height: 16)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal,16)
                                VStack(spacing: 16) {
                                    HStack(spacing: 83) {
                                      
                                            VStack(spacing: 4) {
                                                Text("\(usQ8Y7Z6Inf.int("upsNum"))")
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 18,
                                                        weight: .black
                                                    )
                                                Text("Following")
                                                    .g0LIIcoZQsOjyND9(
                                                        color: Color.white.opacity(0.4)
                                                    )
                                            }.onTapGesture{
                                                if !istYGRYN4Q{
                                                    ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                        WUjfoptOKs8pZfhSAH0duplG {
                                                            kaBpQbGjZ(c8WYppF6mHU: 3, )
                                                        }
                                                    }
                                                }
                                            }
                                        
                                      
                                            VStack(spacing: 4) {
                                                Text("\(usQ8Y7Z6Inf.int("fansNum"))")
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 18,
                                                        weight: .black
                                                    )
                                                Text("Followers")
                                                    .g0LIIcoZQsOjyND9(
                                                        color: Color.white.opacity(0.4)
                                                    )
                                            }.onTapGesture {
                                                if !istYGRYN4Q{
                                                    ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                        WUjfoptOKs8pZfhSAH0duplG {
                                                            kaBpQbGjZ(c8WYppF6mHU: 2, )
                                                        }
                                                    }
                                                }
                                           
                                            }
                                       
                                        Spacer()
                                    }
                                    .padding(.horizontal,16)
                                    RoundedRectangle(cornerRadius: 0)
                                        .fill(
                                            Gradient(colors: [Color(red: 34/255, green: 25/255, blue: 96/255),Color(red: 43/255, green: 38/255, blue: 29/255, opacity: 0.62)])
                                        )
                                        .frame(height: 2)
                                    //Room 标题
                                   
                                    //lisr room 布局
                                    if ncpingeRoom.int("privateCallOpen") == 1  {
                                        VStack(spacing:16){
                                            HStack(spacing: 0) {
                                                Text("C6fgnSMnCKhJZmWhV/8+GA==".bFHEatcgE4zzU9TCfDonsu())
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 16,
                                                        weight: .medium
                                                    )
                                                Spacer()
                                            }
                                            ZStack{
                                                ZJ7h766mz(tMmEWWlfgUag: "qs8Qx4YV7Z9brb")
                                                                   .frame(height: 95)
                                                                   .frame(maxWidth: .infinity)
                                                HStack(spacing:8){
                                                    ZStack{
                                                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: ncpingeRoom["icon"])
                                                                           .frame(width: 148, height: 87)
                                                                           .cornerRadius(8)
                                                                           .allowsHitTesting(false)
                  
                                                    }.frame(width: 148, height: 87)
                                                    VStack(alignment:.leading,spacing: 0){
                                                        Spacer().frame(height: 11)
                                                        Text(ncpingeRoom.string("nickname"))
                                                                        .g0LIIcoZQsOjyND9(
                                                                            size: 16,
                                                                            weight: .semibold
                                                                        )
                                                        
                                                        Spacer().frame(height: 8)
                                                            Text(ncpingeRoom.string("liveDescribe"))
                                                                            .g0LIIcoZQsOjyND9(
                                                                                size: 14,
                                                                                weight: .regular,
                                                                                color: .white.opacity(0.6)
                                                                            )
                                                        
                                                       Spacer()
                                                        HStack{
                                                            Spacer()
                                                            HStack(spacing:0){
                                                                
                                                                ZJ7h766mz(tMmEWWlfgUag: "2Z7A9LqS1tC8M34")
                                                                    .frame(width: 20, height: 20)
                                                                Text("\(ncpingeRoom["joinNum"] as? Int ?? 0)")
                                                                                .g0LIIcoZQsOjyND9(
                                                                                    size: 16,
                                                                                    weight: .regular,
                                                                                    color: .white.opacity(0.6)
                                                                                )
                                                            }.frame(width: 69,height: 25)
                                                            
                                                            .background(Color.white.opacity(0.15))
                                                            .clipShape(s7q2ZC1S9A4tM8L3(radius: 12, corners: [.topLeft,.bottomRight]))
                                                            .padding(.trailing,3)
                                                            .padding(.bottom,3)
                                                        }
                                                    }
                                                }.padding(.leading,4)
                                            }.frame(height: 95)
                                                .frame(maxWidth: .infinity)
                                                .onTapGesture {
                                                    if LiveSessionManager.shared.currentChannelUserId == areoloaUid {
                                                        ftgPSmzMVe.dismissScreen()
                                                        return
                                                    }
                                                    
                                                    ftgPSmzMVe.showScreen(.fullScreenCover) { _ in
                                                        WUjfoptOKs8pZfhSAH0duplG {
                                                            LE0xQZ6Y7WC8iv(channelName: "", localUid: UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")),
                                                                           zA9Y4W6LUid: UInt(areoloaUid))
                                                        }
                                                    }
                                                }
                                        }.padding(.horizontal,16)
                                    }
                                    //lisr room 布局 end
                                }
                                //folling vstack end
                            }
                        }
                    }
                }
            }.ignoresSafeArea()
            VStack{
                HStack(spacing: 0) {
                    Button{
                     
                        ftgPSmzMVe.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                            .padding(.horizontal,10)
                            .padding(.bottom,10)
                    }
                    .contentShape(Rectangle())
                        .padding(.leading,6)
                        
                                .zIndex(1)
                    Spacer()
                    // 右侧按钮
                    if istYGRYN4Q {
                        Button {
                         
                            withAnimation{
                                isvk1OJMmL = true
                            }
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "sJ6642gr1JlL1jH")
                                .frame(width: 24, height: 24)
                                .padding(.horizontal,10)
                                .padding(.bottom,10)
                        }.contentShape(Rectangle())
                            .padding(.trailing,6)
                            .zIndex(1)
                    }
             
                }
                Spacer()
            }
            //vstack 关注、聊天
            if istYGRYN4Q {
                VStack{
                    Spacer()
                    HStack(spacing:9){
                        
                        
                        Button(action: {
                           
                            Task{
                                
                                let isA2C6WEL =  try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: areoloaUid, iA6M7W9EYL0: isFvNNQZQ ? 2 : 1)
                                if(isA2C6WEL){
                                    pstjumLoad()
    
                                   
                                }
                            }
                        }) {
                            HStack(spacing:4){
                                if !isFvNNQZQ {
                                    ZJ7h766mz(tMmEWWlfgUag: "q0M9xW2C7AL")
                                        .frame(width: 16, height: 16)
                                }
                                
                                Text(isFvNNQZQ ? "Following" : "Follow").g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .medium,
                                    color: .white.opacity(0.8)
                                )
                        }
                        }.frame(maxWidth: .infinity, minHeight: 46)
                                        .background(
                                            LinearGradient(
                                                colors: [
                                                    !isFvNNQZQ ?
                                                    Color(red: 217 / 255,green: 28 / 255,blue: 255 / 255,opacity: 0.72) :
                                                        Color(red: 120 / 255,green: 223 / 255,blue: 255 / 255,opacity: 0.32)
                                                    ,!isFvNNQZQ ?
                                                    Color(red: 28 / 255,green: 215 / 255,blue: 255 / 255,opacity: 0.1) :
                                                        Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,opacity: 0.1)
                                                ], startPoint: .leading, endPoint: .trailing)
                                        )
                                        .cornerRadius(325)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 325)
                                                .stroke(
                                                    LinearGradient(
                                                        colors: [
                                                            Color(red: 187 / 255, green: 68 / 255, blue: 219 / 255),
                                                            Color(red: 43 / 255, green: 93 / 255, blue: 117 / 255)
                                                        ],
                                                        startPoint: .leading,
                                                        endPoint: .trailing
                                                    ),
                                                    lineWidth:!isFvNNQZQ ? 1 : 0
                                                )
                                        )
                        
                        ZStack{
                            ZJ7h766mz(tMmEWWlfgUag: "op2sjDLkevlIcN")
                                               .frame(width: 242, height: 46)
                            HStack(spacing:8){
                                ZJ7h766mz(tMmEWWlfgUag: "gdYHiAuKo6l")
                                                   .frame(width: 16, height: 16)
                                Text("Chat").g0LIIcoZQsOjyND9(size: 18,weight: .semibold)
                            }
                            ZJ7h766mz(tMmEWWlfgUag: "xfn63IIKmIhi")
                                               .frame(width: 50, height: 26)
                                               .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topTrailing)
                                               .offset(y: -28)
                        }.frame(width: 242, height: 46)
                            .onTapGesture {
                                openP2PChatScreen(userId: usQ8Y7Z6Inf.string("yxAccid"), avatarUrl: usQ8Y7Z6Inf.string("icon"), using: ftgPSmzMVe)
                            }
                    }.padding(.horizontal,16)
                }
            }
            //vstack 关注、聊天 end
            
            if isvk1OJMmL {
                QiRKOWGBnovrlh(ish1z8TllyFvb: $isvk1OJMmL, ihQ5ReMsh3Uid: areoloaUid,
                               szHHWP8Name:usQ8Y7Z6Inf.string("nickname"), wksgt0dUrl: usQ8Y7Z6Inf.string("icon"),
                )
            }
            
        }
        
        // 全屏显示被点击的图片
//        .fullScreenCover(isPresented: Binding(
//            get: { pVzCUaYBcF5CZ1 != nil },
//            set: { if !$0 { pVzCUaYBcF5CZ1 = nil } }
//        )) {
//            if let nolocnCeMJw14L = pVzCUaYBcF5CZ1 {
//                rfVAcKuWDyI1Ig3cm2bMxplImn70D(eOzSTDS: nolocnCeMJw14L) {
//                    pVzCUaYBcF5CZ1 = nil
//                }
//            }
//        }
        .onAppear{
            
            Task {
                istYGRYN4Q =  areoloaUid != IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")
                async let room = lyrijivecSearch(surlibateUid: areoloaUid)
                    

                    do {
                        ncpingeRoom = try await room
                        
                        pstjumLoad()
                    } catch {
                        print(error)
                    }

                   
            }
            
          
        }
    }
    func pstjumLoad(){
        Task{
            async let info = T0viKk.wSremNeLspPkPRHBJnlVCs5w
                .ngI7E4C9A0xWML6xL(wTEEJpZz0iGVK: areoloaUid)
            usQ8Y7Z6Inf = await info
               
              
              
           
        }
     
    }
}

//点击放大图片、支持长按保存
struct rfVAcKuWDyI1Ig3cm2bMxplImn70D: View {
    let eOzSTDS: String
    let vjzAERk78sLuW96: () -> Void
    
    @State private var gmmOONihfuH0vjheHiqm9Prv872HI: CGFloat = 1.0
    @State private var pzxxrsR6esxySYadQAv2LlYlH5 = false
    @State private var kznmaN03f3hYXK8LgB02R3 = false
    @State private var xW19zC4gQsqvkXilNJmg = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: eOzSTDS)
                .scaledToFit()
                .scaleEffect(gmmOONihfuH0vjheHiqm9Prv872HI)
                // 同时支持缩放和长按
                .gesture(
                    MagnificationGesture()
                        .onChanged { phcCmKzVelvGgSHdmwexFw924qY in
                            gmmOONihfuH0vjheHiqm9Prv872HI = phcCmKzVelvGgSHdmwexFw924qY
                        }
                        .simultaneously(
                            with: LongPressGesture(minimumDuration: 0.2)
                                .onEnded { _ in
                                    // 长按达到阈值立即弹框
                                    pzxxrsR6esxySYadQAv2LlYlH5 = true
                                }
                        )
                )
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    vjzAERk78sLuW96()
                }
        )
       
    }
    
    private func af2DH(i49bp3YNTEyesczfgOJii3zbqjeXApt: String) {
        let nFV03vDFM9If = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        switch nFV03vDFM9If {
        case .authorized, .limited:
            i2oZywRv3fhPcBlvM8ml4dz5(ni14a: i49bp3YNTEyesczfgOJii3zbqjeXApt)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { nYkd6xuUHzijDAdP in
                if nYkd6xuUHzijDAdP == .authorized || nYkd6xuUHzijDAdP == .limited {
                    i2oZywRv3fhPcBlvM8ml4dz5(ni14a: i49bp3YNTEyesczfgOJii3zbqjeXApt)
                } else {
                    vWus4E3fwNIVpJGZbcB()
                }
            }
        default:
            vWus4E3fwNIVpJGZbcB()
        }
    }
    
    private func i2oZywRv3fhPcBlvM8ml4dz5(ni14a: String) {
        guard let c2oREmYI7DkXdnqfurb1U4 = URL(string: ni14a) else { return }
        URLSession.shared.dataTask(with: c2oREmYI7DkXdnqfurb1U4) { oFTNH0CP7k, _, _ in
            if let oFTNH0CP7k, let uHBvCQzy982wg9hSHzpBjY8lunavC = UIImage(data: oFTNH0CP7k) {
                DispatchQueue.main.async {
                    UIImageWriteToSavedPhotosAlbum(uHBvCQzy982wg9hSHzpBjY8lunavC, nil, nil, nil)
                    xW19zC4gQsqvkXilNJmg = "EBn6aBwfE17pqlwkPFNQZaLxZLCQGt/XOqRSs3uEZPs=".bFHEatcgE4zzU9TCfDonsu()
                    kznmaN03f3hYXK8LgB02R3 = true
                }
            } else {
                DispatchQueue.main.async {
                    xW19zC4gQsqvkXilNJmg = "v6rFdwNBJ9KWYSiBoV1IDg==".bFHEatcgE4zzU9TCfDonsu()
                    kznmaN03f3hYXK8LgB02R3 = true
                }
            }
        }.resume()
    }
    
    private func vWus4E3fwNIVpJGZbcB() {
        DispatchQueue.main.async {
            xW19zC4gQsqvkXilNJmg = "C5uVA0twhOLqb5a0pzEegd38MZJvkWFLCAacQhAD3xt2/Vk4FvCNYgVcDE4n3e45YPI2u/TUVhewOrHJlyE/mw==".bFHEatcgE4zzU9TCfDonsu()
            kznmaN03f3hYXK8LgB02R3 = true
        }
    }
}

//左上角&&右下角圆角
struct CustomCorners: Shape {
    var radius: CGFloat = 10
    var corners: UIRectCorner = []
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}



//yxAccid
struct gStC2A9Z6Y8Qx0E7W4ML: Codable {
    
    
    let sGOM5LYyLVsTQ1mHEFJD1CJtq: String //yxAccid
    
    func encode(to encoder: Encoder) throws {
        var iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1 = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        
        
        try iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1.encode(
            sGOM5LYyLVsTQ1mHEFJD1CJtq,
            forKey: bonDyqD2YnaVJW(
                "HKd/L3NovhrAFZdHjyoJDg==".bFHEatcgE4zzU9TCfDonsu()//yxAccid
            )
        )
    }
}

//userId
struct g8C6xW7A2userId: Codable {
    
    
    let uC8Z4Y7WxELId: Int
    
    func encode(to encoder: Encoder) throws {
        var iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1 = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        
        
        try iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1.encode(
            uC8Z4Y7WxELId,
            forKey: bonDyqD2YnaVJW(
                "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()//userId
            )
        )
    }
}

//获取用户信息（userId、yxAccid）

@MainActor
class T0viKk: ObservableObject {
    static let wSremNeLspPkPRHBJnlVCs5w = T0viKk()
    
    // 获取用户信息（yxAccid）
    func ngI7Y2A8C4E0ZQ9W6xL( wTEEJpZz0iGVK: String) async -> [String:Any] {
        do {
            let bSn9YS: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6pl/MNKQk2tbd1jWycWL1eQ=".bFHEatcgE4zzU9TCfDonsu(), ///api/user/newLive/getUserDetail
                tD5tEJZTT0NlaIX7eMREG92BhO3n: gStC2A9Z6Y8Qx0E7W4ML( sGOM5LYyLVsTQ1mHEFJD1CJtq: wTEEJpZz0iGVK)
            )
            
            
           
           
            if bSn9YS.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                // 成功
                guard
                    let wvhfld = bSn9YS.result,
                    !wvhfld.isEmpty
                else {
                    return [:]
                }
                let atXeZc0tWzWWpIN8DRa5DB = wvhfld.hL9dV3bQ2fK6sJ8p()
                print("----json")
                print(atXeZc0tWzWWpIN8DRa5DB)
             
                if let nQ4WzLmrneR1qX8c9nRwkH = atXeZc0tWzWWpIN8DRa5DB.kPOR9FHwcEZJv9YDf4W01D() {
                    return nQ4WzLmrneR1qX8c9nRwkH
                } else {
                    return [:]
                }
            } else {
                return [:]
            }
        } catch {
            print("Sph7QjtQ9wyBx41H5XhztLHkavBN9bomvy8v5zW0vxk=".bFHEatcgE4zzU9TCfDonsu(), error)
            return [:]
        }
    }
    
    // 获取用户信息（userId）
    func ngI7E4C9A0xWML6xL( wTEEJpZz0iGVK: Int) async -> [String:Any] {
        do {
            let bSn9YS: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6pl/MNKQk2tbd1jWycWL1eQ=".bFHEatcgE4zzU9TCfDonsu(),
                tD5tEJZTT0NlaIX7eMREG92BhO3n: g8C6xW7A2userId( uC8Z4Y7WxELId: wTEEJpZz0iGVK)
            )
          
            if bSn9YS.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                // 成功
                guard
                    let wvhfld = bSn9YS.result,
                    !wvhfld.isEmpty
                else {
                    return [:]
                }
                let atXeZc0tWzWWpIN8DRa5DB = wvhfld.hL9dV3bQ2fK6sJ8p()
                print("-----------数据")
                print(atXeZc0tWzWWpIN8DRa5DB)
               
                if let nQ4WzLmrneR1qX8c9nRwkH = atXeZc0tWzWWpIN8DRa5DB.kPOR9FHwcEZJv9YDf4W01D() {
                    return nQ4WzLmrneR1qX8c9nRwkH
                } else {
                    return [:]
                }
            } else {
                return [:]
            }
        } catch {
            print("Sph7QjtQ9wyBx41H5XhztLHkavBN9bomvy8v5zW0vxk=".bFHEatcgE4zzU9TCfDonsu(), error)
            return [:]
        }
    }
}

