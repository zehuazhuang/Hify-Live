//
//  QX10IFCuguXvQa.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/9.
//
//礼物弹框

import SwiftUI
struct QX10IFCuguXvQa: View {
    @Binding var dyzmBppNrJ: Bool
    @State private var jR6X0INMmiZ = false
    let jhqguQVC07 :() -> Void //显示直播钻石商店
    let wlXWcyaNuj : Int? //主播id
    let mCrenfA3xJE : String //直播间、私聊页
    let jEhg1fS1G8 :Int //直播间id
    let tGT2R2amV :String //主播云信id
    let vTubwwYkiq :String //主播名字
    @State private var e7JsX9Y1iP: [[String: Any]] = [] //礼物数据
    let columns = [
           GridItem(.flexible(), spacing: 8),
           GridItem(.flexible(), spacing: 8),
           GridItem(.flexible(), spacing: 8),
           GridItem(.flexible(), spacing: 8)
       ]
    @State private var glGGB7QJo0: Int = -1 //当前选中
    let pJDa77Y8TY: [String] = ["Customize", "99", "66", "52", "25", "10"]
    @State private var ez2WiY381cir = false //上拉数量弹框
    @State private var isCustomize = false //显示输入框
    @State private var bvcTMXNxVXv = "1" //礼物数量
    @FocusState private var focusInput: Bool
    @StateObject private var jbPyc3Dneh = IyfdHMdY.bTa3L6BoprG //登录用户信息
    @State private var isAtBottom: Bool = false
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    if focusInput {
                        isCustomize = false
                        focusInput = false
                    }else{
                        glGGB7QJo0 = -1
                        cW2kJ7C1e()
                    }
                    
                }
            VStack{
                Spacer()
                if glGGB7QJo0 != -1 {
                    if e7JsX9Y1iP[glGGB7QJo0].string("batchBannerUrl") != "" {
                        VStack{
                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: e7JsX9Y1iP[glGGB7QJo0].string("batchBannerUrl"))
                                                .frame(height: 58)
                                                .frame(maxWidth: .infinity)
                        }.frame(height: 90)
                            .padding(.horizontal,16)
                    }
                }
            ZStack{
                
               
                
                VStack(spacing:0){
                    HStack(spacing:31){
                        Text("Popular")
                            .g0LIIcoZQsOjyND9(
                                size: 16,
                                weight: .semibold
                            )
                        
                        Spacer()
                    }
                    .padding(.bottom,16)
                    .padding(.top,10)
                    
                    //礼物滑动区域
                    ZStack{
                        ScrollView(showsIndicators:false) {
                            
                            
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(e7JsX9Y1iP.indices, id: \.self) { index in
                                    
                                    let item = e7JsX9Y1iP[index]
                                    
                                    VStack(spacing: 0) {
                                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: item.string("giftSmallImg"))
                                            .frame(width: 48,height: 48)
                                        MarqueeText(
                                            text: item.string("name"),
                                            size: 14,
                                            weight: .regular
                                        )
                                        .padding(.bottom, 8)
                                        HStack(spacing:4){
                                            ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                                .frame(width: 14, height: 14)
                                            Text("\(item.int("giftPrice"))")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 12,
                                                    weight: .regular
                                                )
                                        }
                                    }
                                    .frame(height: 104)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        ZStack {
                                            GeometryReader { geo in
                                                Color.clear
                                                    .onAppear {
                                                        if index == e7JsX9Y1iP.count - 1 {
                                                            isAtBottom = true
                                                        }
                                                    }
                                                    .onDisappear {
                                                        if index == e7JsX9Y1iP.count - 1 {
                                                            isAtBottom = false
                                                        }
                                                    }
                                            }
                                            
                                            if glGGB7QJo0 == index {
                                                RoundedRectangle(cornerRadius: 14)
                                                    .fill(
                                                        LinearGradient(
                                                            gradient: Gradient(colors: [
                                                                Color(red: 54/255, green: 74/255, blue: 115/255),
                                                                Color(red: 67/255, green: 62/255, blue: 118/255).opacity(0.88),
                                                                Color(red: 60/255, green: 15/255, blue: 128/255).opacity(0.31),
                                                                Color(red: 91/255, green: 58/255, blue: 138/255).opacity(0.21),
                                                            ]),
                                                            startPoint: .top,
                                                            endPoint: .bottom
                                                        )
                                                    )
                                            }
                                        }
                                        
                                    )
                                    .overlay(
                                        Group {
                                            if glGGB7QJo0 == index {
                                                RoundedRectangle(cornerRadius: 14)
                                                    .strokeBorder(
                                                        LinearGradient(
                                                            colors: [
                                                                Color(red: 16/255, green: 227/255, blue: 255/255).opacity(0.5),
                                                                Color(red: 217/255, green: 28/255, blue: 255/255).opacity(0.5),
                                                            ],
                                                            startPoint: .top,
                                                            endPoint: .bottom
                                                        ),
                                                        lineWidth: 1
                                                    )
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .highPriorityGesture(
                                        TapGesture()
                                            .onEnded {
                                                withAnimation {
                                                    glGGB7QJo0 = index
                                                }
                                            }
                                    )
                                }
                            }
                        }
                        if !isAtBottom {
                            LinearGradient(
                                colors: [
                                    Color(red: 19/255, green: 19/255, blue: 41/255).opacity(0),
                                    Color(red: 20/255, green: 17/255, blue: 40/255),
                                    
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            ).frame(height:48)
                                .frame(maxHeight: .infinity,alignment: .bottom)
                                .offset(y:1)
                        }
                    }
                    
                    //end
                    
                    HStack(spacing:12){
                        HStack{
                            ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                .frame(width: 24, height: 24)
                            Text("\(jbPyc3Dneh.iBmPfFGfxu5JV7Aii7.int("diamondNum").shLK3lGBF())")
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .regular
                                ).padding(.trailing,4)
                            ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
                                .frame(width: 24,height: 24)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            jhqguQVC07()
                        }
                        
                        Spacer()
                        HStack(spacing:0){
                            HStack(spacing:0){
                                
                                Text("\(bvcTMXNxVXv)")
                                    .g0LIIcoZQsOjyND9(
                                        size: 16,
                                        weight: .semibold
                                    )
                                    .padding(.leading,16)
                                
                                Spacer()
                                ZJ7h766mz(tMmEWWlfgUag: "hjUYyuQRpd")
                                    .frame(width: 24,height: 24)
                                    .padding(.trailing,6)
                            }.onTapGesture {
                                //弹出选项
                                withAnimation(.easeOut(duration: 0.25)) {
                                    ez2WiY381cir.toggle()
                                }
                            }
                            ZStack{
                                
                                ZJ7h766mz(tMmEWWlfgUag: "mWqJSUcVC")
                                                   .frame(width: 66, height: 36)
                                Text("Send")
                                    .g0LIIcoZQsOjyND9(
                                        size: 16,
                                        weight: .regular
                                    )
                            }.frame(width: 66,height: 34)
                                
                                .clipShape(s7q2ZC1S9A4tM8L3(radius: 325, corners: [.topRight,.bottomRight]))
                                .padding(.trailing,1)
                                .onTapGesture {
                                    //发送礼物
                                    //数量大于0
                                    guard let uSBdiKP = Int(bvcTMXNxVXv), uSBdiKP > 0 else {
                                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("RUOh49AWR0RjFkNtC2YUXsEddWZAr3Fr9ZNFPfgly5o=",type: 1)
                                        return
                                    }
                                    //是否选中一个礼物
                                    if glGGB7QJo0 == -1 {
                                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("DkpWUYKz2svgO1b+xc56SwMPRozxepB1YcLOnZKULFg=",type: 1)
                                        return
                                    }
                                    
                                    
                                    let item = e7JsX9Y1iP[glGGB7QJo0]
                                    
                                    //总钻石
                                    let ow7lnTNA = item.int("giftPrice") * (Int(bvcTMXNxVXv) ?? 0)
                                    
                                    
                                    if jbPyc3Dneh.iBmPfFGfxu5JV7Aii7.int("diamondNum") >= ow7lnTNA {
                                        //请求发送礼物接口
                                        Task {
                                            EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt() // 显示 loading
                                            do {
                                                let pQWBOM = try await zIOvUXp0PFIa(
                                                    nA9jTgkiq: tGT2R2amV,
                                                    xD0brNNV4C: item.int("id"),
                                                    gdmasRe0BC: uSBdiKP,
                                                    xLZR0tX7pimL: mCrenfA3xJE,
                                                    uAcDaiEtw: String(jEhg1fS1G8),
                                                    vxDqzCuq: "",
                                                    jKcu69C: "",
                                                    c7LgmQQhS: 0,
                                                    pE5bbtQ8Hb: 0
                                                )
                                                
                                                if pQWBOM > 0 {
                                                    jbPyc3Dneh.iBmPfFGfxu5JV7Aii7["diamondNum"] = pQWBOM
                                                    
                                                     QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q
                                                       .m3nArFwdHhI82cPUmiqW8PtaaHz(
                                                        "hxoNlqzSCI1zcQXENty8Hg==",
                                                        subFontText: "Your gift has been delivered to \(vTubwwYkiq)"
                                                                                                            )
                                                }
                                            } catch {
                                                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                print("\(error)")
                                            }
                                            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                        }
                                    }else{
                                        jhqguQVC07()
                                    }
                                    
                                    
                                }
                        }.frame(width: 140,height: 36)
                            .overlay(
                                RoundedRectangle(cornerRadius: 325)
                                    .strokeBorder(
                                        LinearGradient(
                                            colors: [
                                                Color(red: 49/255, green: 198/255, blue: 232/255).opacity(0.38),
                                                Color(red: 217/255, green: 28/255, blue: 255/255).opacity(0.72),
                                            ],
                                            startPoint: .leading,
                                            endPoint: .trailing
                                        ),
                                        lineWidth: 1
                                    )
                            )
                    }.padding(.bottom,15)
                        .padding(.top,20)
                }
                .padding(.top,10)
                .padding(.horizontal,16)
                .padding(.bottom,35)
                .background(
                    ZJ7h766mz(tMmEWWlfgUag: "d1SPKVSkFLB")
                        .ignoresSafeArea(edges: .bottom)
                )
                
                
                //上拉选择
                if ez2WiY381cir {
                    VStack(spacing:0){
                        ForEach(pJDa77Y8TY.indices,id:\.self){index in
                            Text(pJDa77Y8TY[index])
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .regular
                                )
                                .padding(.vertical,6)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    print("选择了\(pJDa77Y8TY[index])")
                                    
                                    if index != 0 {
                                        isCustomize = false
                                        withAnimation{
                                            bvcTMXNxVXv = pJDa77Y8TY[index]
                                        }
                                    }else{
                                        isCustomize = true
                                        focusInput = true
                                    }
                                    
                                    
                                    withAnimation{
                                        ez2WiY381cir.toggle()
                                    }
                                }
                            if index != 5 {
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color.white.opacity(0.4))
                                    .frame(width: 65, height: 1)
                                    .padding(.vertical,2)
                            }
                        }
                    }.frame(width: 98,height: 236)
                        .background(
                            Color(red: 71/255, green: 71/255, blue: 89/255).opacity(0.9)
                        )
                        .cornerRadius(8)
                        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment:.bottomTrailing)
                        .padding(.bottom,95)
                        .padding(.trailing,70)
                        .offset(y: ez2WiY381cir ? 0 : 260)
                }
                
            }
            .frame(height: 408)
            .frame(maxWidth: .infinity)
            .offset(y: jR6X0INMmiZ ? 0 : 408)
            
            .scaleEffect(x: 1.01, y: 1.02, anchor: .center)
            
        }.ignoresSafeArea()
                .onAppear {
                    jR6X0INMmiZ = false
                    DispatchQueue.main.async {
                        withAnimation(.easeOut(duration: 0.25)) {
                            jR6X0INMmiZ = true
                        }
                    }
                    
                    //加载礼物
                    Task{
                        let mRw8NWOy = try await cTiuphrpj0WxFn(pX8YxxAkBf: mCrenfA3xJE, bDXCgArl3: wlXWcyaNuj)
                        
                        guard let popular = mRw8NWOy["Popular"] as? [[String: Any]] else {
                            return
                        }
                        e7JsX9Y1iP = popular
                        
                    }
                }
            
            if isCustomize {
                VStack{
                    Spacer()
                    ZStack{
                        Color(red: 35/255, green: 39/255, blue: 61/255)
                        HStack{
                            ZStack(alignment: .leading) {
                                if bvcTMXNxVXv.isEmpty {
                                    Text("Please enter the gift quantity")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .semibold,
                                            color: .white.opacity(0.4)
                                        )
                                }
                                
                                TextField("", text: $bvcTMXNxVXv)
                                    .font(.custom("gz4QHFqRS4dH1OeOv3Zirg==".bFHEatcgE4zzU9TCfDonsu(), size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .keyboardType(.numberPad)
                                    .focused($focusInput)
                                    .onChange(of: bvcTMXNxVXv) { newValue in
                                        // 只保留数字
                                        let filtered = newValue.filter { $0.isNumber }
                                        
                                        // 限制范围
                                        if let number = Int(filtered) {
                                            let clamped = min(max(number, 1), 99)
                                            bvcTMXNxVXv = String(clamped)
                                        } else {
                                            // 允许空字符串，不影响键盘
                                            bvcTMXNxVXv = filtered
                                        }
                                    }
                            }
                            Spacer()
                            ZJ7h766mz(tMmEWWlfgUag: bvcTMXNxVXv == "" ? "uRdGSr4Ov" : "eGEQnR5LzA")
                                               .frame(width: 60, height: 34)
                                               .onTapGesture {
                                                   if bvcTMXNxVXv != "" {
                                                       isCustomize = false
                                                       focusInput = false
                                                   }
                                               }
                            
                        }.padding(.horizontal,16)
                        .frame(height: 46)
                        .background(
                            ZJ7h766mz(tMmEWWlfgUag: "mP5nA7LuUkPA82")
                        )
                    }.frame(height: 46)
                    
                }
            }
        }
    }
    func cW2kJ7C1e(){
        withAnimation(.easeOut(duration: 0.25)) {
            jR6X0INMmiZ = false
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            dyzmBppNrJ = false
        }
    }
}
//跑马灯字体
struct MarqueeText: View {
    let text: String
    let size: Int
    let weight: Font.Weight
    
    let speed: Double = 30
    private let containerWidth: CGFloat = (UIScreen.main.bounds.width - 32 - 24) / 4
    
    @State private var offset: CGFloat = 0
    @State private var textWidth: CGFloat = 0
    @State private var shouldScroll: Bool = false
    @State private var animationStarted: Bool = false
    
    var body: some View {
        ZStack {
            if !shouldScroll {
                Text(text)
                    .g0LIIcoZQsOjyND9(size: size, weight: weight)
                    .frame(width: containerWidth)
            } else {
                HStack(spacing: 40) {
                    Text(text)
                        .g0LIIcoZQsOjyND9(size: size, weight: weight)
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                    Text(text)
                        .g0LIIcoZQsOjyND9(size: size, weight: weight)
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                }
                .offset(x: offset)
                .frame(width: containerWidth, alignment: .leading)
                .onAppear {
                    startAnimationIfNeeded()
                }
            }
        }
        .background(
            Text(text)
                .g0LIIcoZQsOjyND9(size: size, weight: weight)
                .fixedSize()
                .background(
                    GeometryReader { geo in
                        Color.clear
                            .onAppear {
                                textWidth = geo.size.width
                                shouldScroll = textWidth > containerWidth
                            }
                    }
                )
                .hidden()
        )
        .frame(width: containerWidth, height: 20)
        .clipped()
    }
    
    private func startAnimationIfNeeded() {
        guard shouldScroll, !animationStarted else { return }
        animationStarted = true
        let distance = textWidth + 40
        let duration = distance / speed
        offset = 0
        
        withAnimation(
            Animation.linear(duration: duration)
                .repeatForever(autoreverses: false)
        ) {
            offset = -distance
        }
    }
}
