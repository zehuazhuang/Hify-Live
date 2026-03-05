//金币页面

import SwiftUI
import UIPilot



struct Afmox09Q1UKVfE: View {
    let qmLT3WCISX: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @StateObject private var pkeDEXpbkc4RXu = PkeDEXpbkc4RXu.shared
    let tSh7kxFecD: [GAg6zvKCMA] = PUiSN9Hnxm9ZJ.tSh7kxFecD
    @StateObject private var qVi2QJ0SeDluhZ9xoQ8V7 = IyfdHMdY.bTa3L6BoprG //用户信息
    @State private var mCbSNX6z2hzQ: [String: Any] = [:] //获取支付
    @State private var uSM1VTVKvc0WVI: [[String: Any]] = [] //钻石列表
    @EnvironmentObject var tqaYrFHScB4LNL: RZ5EA4IPxfI4x  //订单实例
    @State private var dZJ24OCh = false //初始化一次
    @State private var sQYNvOjd5v: Bool = false //显示挽留弹窗
    @State private var remainingSeconds: Int = 600
    @State private var timer: Timer?
    
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            ZJ7h766mz(tMmEWWlfgUag: "zqyH6H230kp")
                               .frame(height: 462)
                               .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                               .ignoresSafeArea()
            VStack(spacing:0){
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            pilot.pop()
                        }
                    Text("Diamonds")
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                    HStack(spacing:4){
                        ZJ7h766mz(tMmEWWlfgUag: "qkSFUsSC7izsB0")
                                           .frame(width: 24, height: 24)
                        Text("Record")
                            .g0LIIcoZQsOjyND9(
                                size: 14,
                                weight: .medium
                            )
                    }.onTapGesture {
                        pilot.push(.H7XMmrHFowMS7i)
                    }
                    //钻石icon
//                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
//                                       .frame(width: 24, height: 24)
                    
                }
                Spacer().frame(height: 20)
                ZStack{
                    ZJ7h766mz(tMmEWWlfgUag: "qrvEGTNjRu")
                                       .frame(height: 97)
                                       .frame(maxWidth: .infinity)
                    HStack{
                        VStack(alignment: .leading, spacing: 8) {
                           
                            Text("My Balance")
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .medium
                                            )
                            Text("\(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("diamondNum").shLK3lGBF())")
                                .g0LIIcoZQsOjyND9(
                                    size: 28,
                                    weight: .black
                                )
                        }
                        Spacer()
                    }
                    .padding(.leading,16)
                }
                Spacer().frame(height: 24)
                HStack{
                    Text("Select Recharge  Amount")
                        .g0LIIcoZQsOjyND9(
                            size: 16,
                            weight: .semibold
                        )
                    Spacer()
                }
                Spacer().frame(height: 10)
                ScrollView(showsIndicators:false){
                    VStack(spacing:8){
                        LazyVGrid(columns: qmLT3WCISX, spacing: 8) {
                          
                                
                            ForEach(Array(uSM1VTVKvc0WVI.enumerated()), id: \.offset) { index, info in
                                let nhIY70bF4 = info.int("boughtFlag") == 0 //是否首充
                                let vX3L1Q6kF = nhIY70bF4 ? info.int("firstChargeGive") : info.int("giveDiamondNum") //额外赠送钻石
                                ZStack{
                                  ZStack{
                                      LinearGradient(
                                          gradient: Gradient(colors: [
                                              Color(red: 27/255, green: 31/255, blue: 51/255),
                                              Color(red: 29/255, green: 25/255, blue: 36/255),
                                          ]),
                                          startPoint: .top,
                                          endPoint: .bottom
                                      ).frame(height:140)
                                          .frame(maxWidth: .infinity)
                                          .cornerRadius(8)
                                      if vX3L1Q6kF > 0 {
                                          RoundedRectangle(cornerRadius: 8)
                                              .fill(
                                                  LinearGradient(
                                                      gradient: Gradient(colors: [
                                                          Color(red: 49/255, green: 57/255, blue: 133/255),
                                                          Color(red: 29/255, green: 19/255, blue: 38/255),
                                                      ]),
                                                      startPoint: .top,
                                                      endPoint: .bottom
                                                  )
                                              )
                                              .overlay(
                                                  RoundedRectangle(cornerRadius: 8)
                                                      .strokeBorder(
                                                          LinearGradient(
                                                              colors: [
                                                                  Color(red: 191/255, green: 205/255, blue: 255/255).opacity(0.37),
                                                                  Color.white.opacity(0)
                                                              ],
                                                              startPoint: .top,
                                                              endPoint: .bottom
                                                          ),
                                                          lineWidth: 0.6
                                                      )
                                              )
                                              .frame(height: 140)
                                              .frame(maxWidth: .infinity)
                                      }
                                      
                                      
                                      
                                      
                                    VStack(spacing:0){
                                        Spacer()
                                        Spacer().frame(height: 18)
                                        
                                        VStack(spacing:0){
                                            Text("\(String(info.int("diamondNum")))")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16,
                                                    weight: .bold
                                                )
                                            if vX3L1Q6kF > 0 {
                                                Text("+\(String(vX3L1Q6kF))bonus")
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 12,
                                                        weight: .medium,
                                                        color:   Color(red: 255/255, green: 211/255, blue: 99/255)
                                                    )
                                            }
                                            
                                            Spacer()
                                        }.frame(height:32)
                                        Spacer().frame(height: 5)
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(
                                                    LinearGradient(
                                                        gradient: Gradient(colors: [
                                                            Color(red: 17/255, green: 226/255, blue: 255/255),
                                                            Color(red: 217/255, green: 28/255, blue: 255/255),
                                                            Color(red: 217/255, green: 28/255, blue: 255/255),
                                                        ]),
                                                        startPoint: .leading,
                                                        endPoint: .trailing
                                                    )
                                                )
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color(red: 59/255, green: 63/255, blue: 66/255), lineWidth: 1)
                                                )
                                                .frame(width: 91, height: 25)
                                            
                                            
                                            Text("$ \(String((info["convertPrice"] as? Double) ?? 0))")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 14,
                                                    weight: .medium
                                                )
                                        }
                                        Spacer().frame(height: 9)
                                    }.frame(height:140)
                                        .frame(maxWidth: .infinity)
                                       
                                }.padding(.top,3)
                                  
                                  
                                      
                                  
                                  //背景图
                                  ZJ7h766mz(tMmEWWlfgUag: "eJDSJ03kdl6\(index)")
                                      .frame(width: 109, height: 90)
                                      .frame(maxHeight: .infinity,alignment: .top)
                                      
                                    if vX3L1Q6kF > 0 {
                                        VStack{
                                            HStack(spacing:2){
                                                
                                                ZJ7h766mz(tMmEWWlfgUag: "cSuo9DCYRX")
                                                    .frame(width: 53, height: 18)
                                                    .padding(.leading,4)
                                                
                                                
                                                
                                                Spacer()
                                                HStack(spacing:2){
                                                    ZJ7h766mz(tMmEWWlfgUag: "y0UwIUXSNa")
                                                        .frame(width: 9, height: 9)
                                                    Text(timeString)
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 9,
                                                            weight: .medium
                                                        ).monospacedDigit()
                                                }.padding(.trailing,9)
                                                    .padding(.top,4)
                                            }
                                            Spacer()
                                        }
                                    }
                            }.frame(height:143)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        Task {
                                            EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                                            
                                            
                                            if let list = info["skuInfoList"] as? [[String: Any]] {
                                                
                                                let result = list.first { ($0["channelType"] as? String) == "7" } ?? [:]
                                                let skuInfoId = result.int("id")
                                                let templateId = mCbSNX6z2hzQ.int("id")
                                                let paymentMethodType = result.string("payMethodType")
                                                let productId = info.string("batchNo")
                                                let countryTypeId = result.int("payTypeId")
                                                let vipFlag = info.int("isVipFlag")
                                                let skuId = info.int("id")
                                                let showType = result.int("showType")
                                                
                                                pkeDEXpbkc4RXu.q8R2T9vC5MZ = productId
                                                
                                                let resu =  try await vaBBMmyXOh(
                                                    jYPvECldH: skuInfoId,
                                                    xsqZJWxTw: templateId,
                                                    vyLi1B0zU7: paymentMethodType,
                                                    nVsTUsf: productId,
                                                    x8TX0Ex45: "frontCallbackUrl",
                                                    eLhfV9aP: countryTypeId,
                                                    qXGyOYr2a: vipFlag,
                                                    vsbJYss443E: "",
                                                    qNZY7Dy4i: "",
                                                    tUdgDq4mC: skuId,
                                                    oCKpEiNR4O: "",
                                                    vFlR9vnX64: "",
                                                    s9Pxt3Yh9: showType)
                                                
                                                
                                                
                                                
                                                if let nDgOeiB = resu["diamondNum"] as? Int, nDgOeiB > 0 {
                                                  
                                                    pkeDEXpbkc4RXu.nN2B7Q5M9 = nDgOeiB
                                                    
                                                    await pkeDEXpbkc4RXu.mZ6DqgRigNqO(productId: productId)
                                                }
                                                
                                                
                                            }else{
                                                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                            }
                                        }
                                       

                                    }
                            
                            
                        }
                        }
                    }
                }
            }.padding(.horizontal,16)
            
            if sQYNvOjd5v {
                R7mL2X9B1qZ5vY(tP3QY4dC7W: $sQYNvOjd5v)
            }
        }.onAppear {
            Task {
                guard !dZJ24OCh else { return }
                dZJ24OCh = true
                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                
                await pkeDEXpbkc4RXu.r1roySzHMIN(
                    ids: tSh7kxFecD.map { $0.k0SBAq4pgTjj8 }
                )
                
                mCbSNX6z2hzQ = try await gtR8YJncg8Z()
               
                if let list = mCbSNX6z2hzQ["skuList"] as? [[String: Any]] {
                    
                    let sortedList = list.sorted {
                        ($0["diamondNum"] as? Int ?? 0) < ($1["diamondNum"] as? Int ?? 0)
                    }
                    
                    uSM1VTVKvc0WVI = sortedList
                   
                }

                
                nR2V8Yq1Mz()
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                
                
                // 设置支付成功回调
                pkeDEXpbkc4RXu.i03CT778BY = {
                   
                 
                    let info = try await ks5LJq4BIxOAX()
                   
                    
                    qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7["diamondNum"] = info.int("diamondNum")

                }
                
                // 设置取消支付回调
                pkeDEXpbkc4RXu.wBFfm9P58PJF = {
                    withAnimation{
                        sQYNvOjd5v = true
                    }
                }
            }
        } .onDisappear {
            xV1wL64FJ9()
        }
    }
}
extension Afmox09Q1UKVfE {
    
    var timeString: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    func nR2V8Yq1Mz() {
        xV1wL64FJ9()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            
            if remainingSeconds > 0 {
                remainingSeconds -= 1
            } else {
                xV1wL64FJ9()
            }
        }
    }
    
    func xV1wL64FJ9() {
        timer?.invalidate()
        timer = nil
    }
}
