//
//  Eu1xbwzA1AwXn4.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/25.
//

import SwiftUI
import UIPilot
import NIMSDK
import Combine
//直播榜单排行榜
struct Eu1xbwzA1AwXn4: View {
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var h3HxHKT2xF: Bool = true // true Wealth false Charm
    @State private var o6a4AyPmo: Int = 0  // 0 this live 1 today 2 week
    @State private var atFBCJ7aeWP: [[String: Any]] = [] //财富榜数据
    let vGC3obKy3jw : Int //直播用户id
    let gD5nKIXUMI: Int //直播间id
    @State private var xB4BENFOp: Bool = true // true Contribute false Online Viewers
    @State private var cwom50hBfhTc: Bool = false //底部用户弹框
    @State private var pQN3C5FxRi: Int = 0 //点击用户坐标
    @State private var chatSession: ChatSessionWrapper? //半屏私聊
    @State private var wYh4kyARQ: [String: Any] = [:] //当前用户的财富榜数据
    @State private var now: Date = Date()
    @State private var todayEndDate: Date = Date()
    @State private var weekEndDate: Date = Date()
    
    @State private var uNZ9IM5OK: [[String: Any]] = [] //直播间在线数据
    
    
    init(
        vGC3obKy3jw: Int,
        gD5nKIXUMI:Int
    ) {
        self.vGC3obKy3jw = vGC3obKy3jw
        self.gD5nKIXUMI = gD5nKIXUMI
    }
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            if xB4BENFOp {
                ZJ7h766mz(tMmEWWlfgUag: h3HxHKT2xF ? "cLR8Uxcsdzh" : "wCcIXLztG1E4")
                    .scaledToFill()
                    .frame(height: 370)
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                    .ignoresSafeArea()
            }else{
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 17/255, green: 29/255, blue: 46/255),
                        Color(red: 21/255, green: 12/255, blue: 38/255),
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                ).ignoresSafeArea()
            }
            
            VStack(spacing:0){
                //hstack start
                
                    HStack(alignment:.top){
                        
                        HStack(spacing:18){
                            ZStack{
                                Text("Contribute")
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: xB4BENFOp ? .black : .semibold,
                                        color: xB4BENFOp ?  .white : .white.opacity(0.4)
                                    ).frame(maxHeight: .infinity,alignment:.top)
                                if xB4BENFOp {
                                    ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                        .frame(width: 28, height: 12)
                                        .frame(maxHeight: .infinity,alignment:.bottom)
                                }
                                
                            }
                            .frame(width: 89,height: 34)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    xB4BENFOp = true
                                }
                            }
                            
                            ZStack{
                                Text("Online Viewers(\(uNZ9IM5OK.count))")
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: !xB4BENFOp ? .black : .semibold,
                                        color: !xB4BENFOp ?  .white : .white.opacity(0.4)
                                    ).frame(maxHeight: .infinity,alignment:.top)
                                if !xB4BENFOp {
                                    ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                        .frame(width: 28, height: 12)
                                        .frame(maxHeight: .infinity,alignment:.bottom)
                                }
                                
                            }
                            .frame(width: 149,height: 34)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    xB4BENFOp = false
                                }
                            }
                        }
                        
                        
                    }.padding(.top,20)
                        .padding(.horizontal,16)
                
                
                //hstack end
                if xB4BENFOp {
                    //财富榜
                    VStack(spacing:0){
                        //hstack start
                        HStack(spacing:8){
                            
                                ZStack{
                                    if o6a4AyPmo == 0 {
                                        ZJ7h766mz(tMmEWWlfgUag: "qgM97bhM1")
                                                           .frame(width: 82, height: 32)
                                    }
                                    Text("This live").g0LIIcoZQsOjyND9(
                                                        size: 16,
                                                        weight: .semibold,
                                                        color: o6a4AyPmo == 0 ? .white : .white.opacity(0.6)
                                                    )
                                }.frame(width: 88,height: 36)
                                    .onTapGesture {
                                        withAnimation{
                                            o6a4AyPmo = 0
                                        }
                                    }
                            
                            ZStack{
                                if o6a4AyPmo == 1 {
                                    ZJ7h766mz(tMmEWWlfgUag: "qgM97bhM1")
                                                       .frame(width: 82, height: 32)
                                }
                                Text("Today").g0LIIcoZQsOjyND9(
                                                    size: 16,
                                                    weight: .semibold,
                                                    color: o6a4AyPmo == 1 ? .white : .white.opacity(0.6)
                                                )
                            }.frame(width: 88,height: 36)
                                .onTapGesture {
                                    withAnimation{
                                        o6a4AyPmo = 1
                                    }
                                }
                            ZStack{
                                if o6a4AyPmo == 2 {
                                    ZJ7h766mz(tMmEWWlfgUag: "qgM97bhM1")
                                                       .frame(width: 82, height: 32)
                                }
                                Text("Week").g0LIIcoZQsOjyND9(
                                                    size: 16,
                                                    weight: .regular,
                                                    color: o6a4AyPmo == 2 ? .white : .white.opacity(0.6)
                                                )
                            }.frame(width: 88,height: 36)
                                .onTapGesture {
                                    withAnimation{
                                        o6a4AyPmo = 2
                                    }
                                }
                        }.frame(height: 36)
                         .background(
                            Color(red: 34/255, green: 34/255, blue: 38/255).opacity(0.6),
                         )
                         .cornerRadius(325)
                         .overlay(
                            RoundedRectangle(cornerRadius: 325)
                                .stroke(Color.white.opacity(0.4), lineWidth: 1)
                         )
                            .padding(.horizontal,16)
                            .padding(.top,9)
                        
                        
                        //hstack end
                            
                        if o6a4AyPmo != 0 {
                            HStack(spacing:4){
                                ZJ7h766mz(tMmEWWlfgUag: "y0UwIUXSNa")
                                    .frame(width: 9, height: 9)
                                    
                                
                                TimelineView(.periodic(from: .now, by: 1)) { context in
                                    CountdownLabel(
                                        date: context.date,
                                        mode: o6a4AyPmo,
                                        todayEnd: todayEndDate,
                                        weekEnd: weekEndDate
                                    )
                                }
                                .frame(height: 20)
                            }.padding(.top,12)
                        }else{
                            Spacer().frame(height: 5)
                        }
                            
                           
                            
                       
                        
                        ScrollView(showsIndicators: false){
                            Spacer().frame(height: o6a4AyPmo == 0 ? 57 : 30)
                            ZStack(alignment: .bottom){
                                HStack(alignment: .bottom, spacing: 0) {

                                    // 第二名
                                    RankItemView(
                                        gDKv25ocXI: atFBCJ7aeWP.count > 1 ? atFBCJ7aeWP[1] : [:],
                                        colors: [
                                            Color(red: 167/255, green: 202/255, blue: 255/255),
                                            Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                        ],
                                        rO06IvkUE: "gIQ4nRP",
                                        a5MYGuUu: true,
                                        uF7VFlMQa: {
                                            withAnimation{
                                                pQN3C5FxRi = 1
                                                cwom50hBfhTc = true
                                            }
                                        }
                                    )
                                    .offset(y: 20)

                                    // 第一名（最高）
                                    RankItemView(
                                        gDKv25ocXI: atFBCJ7aeWP.count > 0 ? atFBCJ7aeWP[0] : [:],
                                        colors: [
                                            Color(red: 255/255, green: 248/255, blue: 136/255),
                                            Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                        ],
                                        rO06IvkUE: "x1Tms9QGDc",
                                        a5MYGuUu: true,
                                        uF7VFlMQa: {
                                            withAnimation{
                                                pQN3C5FxRi = 0
                                                cwom50hBfhTc = true
                                            }
                                        }
                                    )

                                    // 第三名
                                    RankItemView(
                                        gDKv25ocXI: atFBCJ7aeWP.count > 2 ? atFBCJ7aeWP[2] : [:],
                                        colors: [
                                            Color(red: 255/255, green: 216/255, blue: 204/255),
                                            Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                        ],
                                        rO06IvkUE: "oxk8XBdCod",
                                        a5MYGuUu: true,
                                        uF7VFlMQa: {
                                            withAnimation{
                                                pQN3C5FxRi = 2
                                                cwom50hBfhTc = true
                                            }
                                        }
                                    )
                                    .offset(y: 30)
                                }
                                .padding(.horizontal, 16)
                                ZJ7h766mz(tMmEWWlfgUag: "xbEr5dtzc93v")
                                    .frame(height: 35.9)
                                                   .frame(maxWidth: .infinity)
                            }
                            LazyVStack(spacing:12){
                                ForEach(Array(atFBCJ7aeWP.dropFirst(3).enumerated()), id: \.offset) { offset, item in
                                    OG8SPSFgtz0zns(cvqRWsK91e: item, pErJCVH3JV: offset + 4, ug5Hb1dC1: true,
                                                   uF7VFlMQa: {
                                        withAnimation{
                                            pQN3C5FxRi = offset + 3
                                            cwom50hBfhTc = true
                                        }
                                    })
                                }
                            }.padding(.horizontal,16)
                        }.padding(.bottom,h3HxHKT2xF ? 60 :0)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: .clear, location: 0),
                                    .init(color: .black, location: 0.05),
                                    .init(color: .black, location: 1)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        //滑动 end
                        
                     
                       
                      
                        
                    }
                    
                }else{
                    //在线用户
                    ScrollView(showsIndicators: false){
                        VStack(spacing:16){
                            ForEach(uNZ9IM5OK.indices,id: \.self){index in
                                HStack{
                                    ZStack{
                                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: uNZ9IM5OK[index].string("icon"))
                                                            .frame(width: 44,height: 44)
                                                            .clipShape(Circle())
                                                            .allowsHitTesting(false)
                                    }.frame(width: 48,height: 48)
                                        .background(.white.opacity(0.19))
                                        .clipShape(Circle())
                                        
                                    Spacer().frame(width: 12)
                                    Text(uNZ9IM5OK[index].string("nickname"))
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 14,
                                                        weight: .medium
                                                    )
                                    Spacer()
                                }
                            }
                        }
                    }.padding(.horizontal,16)
                        .padding(.top,24)
                }
                
                
            }

           
            
            //底部自己
            if xB4BENFOp && h3HxHKT2xF {
                let rankValue =  wYh4kyARQ.int("costNum")
                let sqSXyQKd =  wYh4kyARQ.int("rank")
                
                
                VStack(spacing:8){
                    Spacer()
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.white.opacity(0.15))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                    HStack(spacing:0){
                        ZStack{
                            HStack{
                                Text(sqSXyQKd == 0 ? "50+" : "\(sqSXyQKd)")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16,
                                                    weight: .semibold
                                                )
                                Spacer()
                            }
                            
                            HStack{
                                ZStack{
                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.string("icon"))
                                                        .frame(width: 44,height: 44)
                                                        .clipShape(Circle())
                                                        .allowsHitTesting(false)
                                }.frame(width: 48,height: 48)
                                    .background(.white.opacity(0.19))
                                    .clipShape(Circle())
                                    
                                Spacer().frame(width: 10)
                                Text(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.string("nickname"))
                                                .g0LIIcoZQsOjyND9(
                                                    size: 14,
                                                    weight: .medium
                                                )
                                Spacer()
                                HStack(spacing:8){
                                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                        .frame(width: 16, height: 16)
                                   
                                    Text("\(rankValue.shLK3lGBF())")
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 14,
                                                        weight: .regular
                                                    )
                                }
                            }.padding(.leading,36)
                        }
                        
                        
                        
                    }.padding(.horizontal,16)
                        
                }
            }
            
            
            //底部用户弹框

            if cwom50hBfhTc, atFBCJ7aeWP.indices.contains(pQN3C5FxRi) {
                QZ4A0M84C7WL9(
                    sBb3SaType: 1,
                    uZQx7MId: atFBCJ7aeWP[pQN3C5FxRi].int("userId"),
                    hN9EY2BId: atFBCJ7aeWP[pQN3C5FxRi].string("yxAccid"),
                    nIq2dmKcGA0: { t6FBqjXlaJ,djMiejuudZ in
                        //私聊半屏
                        let session = NIMSession(t6FBqjXlaJ, type: .P2P)
                        chatSession = ChatSessionWrapper(session: session, u1NCaZAWMA: djMiejuudZ)
                    },
                    isW9YQ6C8L: $cwom50hBfhTc
                )
            }
            
        }.onAppear{
            let calendar = Calendar.current
               todayEndDate = calendar.date(bySettingHour: 23, minute: 59, second: 59, of: Date())!
               weekEndDate = calendar.nextDate(
                   after: Date(),
                   matching: DateComponents(hour: 23, minute: 59, second: 59, weekday: 7),
                   matchingPolicy: .nextTime
               )!
            Task{

               await vdD89xwThuLoad()
                
                uNZ9IM5OK =   try await d34SzmkHKFl(mcIOzuQURD: vGC3obKy3jw, phqabUmw: 1)
                
                
            }
        }.onChange(of: o6a4AyPmo) { _ in
            Task {
                await vdD89xwThuLoad()
            }
        }.onChange(of: h3HxHKT2xF) { _ in
            Task {
                await vdD89xwThuLoad()
            }
        }

        .sheet(item: $chatSession) { wrapper in
            CgZU7mTgY46l(
                session: wrapper.session,
                opponentAvatarURL: wrapper.u1NCaZAWMA,
                qOH29Z5X: true
            )
            .environmentObject(pilot)
            .presentationDetents([.fraction(0.75)])
            .presentationBackground(.clear)
        }
    }
    

    
 
    
    func vdD89xwThuLoad() async {
        var ainDhsn9iO = ""
        
        if o6a4AyPmo == 0 {
            ainDhsn9iO = "now"
        } else if o6a4AyPmo == 1 {
            ainDhsn9iO = "today"
        } else {
            ainDhsn9iO = "week"
        }
        
        do {
           
            //财富榜数据
            atFBCJ7aeWP = try await qYJEUV2QGq6U(
                qAloWEox0: ainDhsn9iO,
                jSaWDcnOS: gD5nKIXUMI
            )
            
            atFBCJ7aeWP = atFBCJ7aeWP.filter {
                    ($0["costNum"] as? Int ?? 0) > 0
                }

            print("财富榜数据")
            print(atFBCJ7aeWP)

            // 取最后一个
            wYh4kyARQ = atFBCJ7aeWP.last ?? [:]

            // 移除最后一个
            if !atFBCJ7aeWP.isEmpty {
                atFBCJ7aeWP.removeLast()
            }
            
            
            
            
            
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        } catch {
            print(error)
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        }
    }
}

struct CountdownLabel: View {
    let date: Date
    let mode: Int
    let todayEnd: Date
    let weekEnd: Date

    var body: some View {
        Text(formattedRemaining(for: date))
            .g0LIIcoZQsOjyND9(
                size: 12,
                weight: .regular,
                color: .white.opacity(0.8)
            ).monospacedDigit()
    }

    private func formattedRemaining(for now: Date) -> String {
        if mode == 2 {
            return remainingWeek(from: now)
        } else {
            return remainingToday(from: now)
        }
    }
    func remainingToday(from current: Date) -> String {
        let diff = Int(todayEnd.timeIntervalSince(current))
        if diff <= 0 { return "00h 00m 00s" }
        let h = diff / 3600
        let m = (diff % 3600) / 60
        let s = diff % 60
        return String(format: "%02dh %02dm %02ds", h, m, s)
    }

    func remainingWeek(from current: Date) -> String {
        let diff = Int(weekEnd.timeIntervalSince(current))
        if diff <= 0 { return "0d 00h 00m 00s" }
        let d = diff / 86400
        let h = (diff % 86400) / 3600
        let m = (diff % 3600) / 60
        let s = diff % 60
        return String(format: "%dd %02dh %02dm %02ds", d, h, m, s)
    }
}
