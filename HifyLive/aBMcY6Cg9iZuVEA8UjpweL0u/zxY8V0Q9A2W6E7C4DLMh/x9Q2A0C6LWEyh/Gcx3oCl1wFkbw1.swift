import SwiftUI
import UIPilot
//榜单排行榜
struct Gcx3oCl1wFkbw1: View {
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var h3HxHKT2xF: Bool = true // true Wealth false Charm
    @State private var o6a4AyPmo: Int = 0 // 0 this live 1 today 2 week
    @State private var atFBCJ7aeWP: [[String: Any]] = [] //财富榜数据
    let zCwukl6av48X : Bool //true 直播进 false 首页进
    let uNZ9IM5OK : [[String: Any]] //在线用户数据
    
    @State private var xB4BENFOp: Bool = true // true Contribute false Online Viewers
    init(
        zCwukl6av48X: Bool,
        uNZ9IM5OK: [[String: Any]] = []
    ) {
        self.zCwukl6av48X = zCwukl6av48X
        self.uNZ9IM5OK = uNZ9IM5OK
        
        print(uNZ9IM5OK)
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
                if zCwukl6av48X {
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
                }else{
                    HStack(alignment:.top){
                        Button {
                            pilot.pop()
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                                .frame(width: 24, height: 24)
                        }
                        Spacer()
                        HStack(spacing:23){
                            ZStack{
                                Text("Wealth")
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: h3HxHKT2xF ? .black : .semibold,
                                        color: h3HxHKT2xF ?  .white : .white.opacity(0.4)
                                    ).frame(maxHeight: .infinity,alignment:.top)
                                if h3HxHKT2xF {
                                    ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                        .frame(width: 28, height: 12)
                                        .frame(maxHeight: .infinity,alignment:.bottom)
                                }
                                
                            }
                            .frame(width: 59,height: 34)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    h3HxHKT2xF = true
                                }
                            }
                            ZStack{
                                Text("Charm")
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: !h3HxHKT2xF ? .black : .semibold,
                                        color: !h3HxHKT2xF ?  .white : .white.opacity(0.4)
                                    ).frame(maxHeight: .infinity,alignment:.top)
                                
                                if !h3HxHKT2xF {
                                    ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                        .frame(width: 28, height: 12)
                                        .frame(maxHeight: .infinity,alignment:.bottom)
                                }
                            }
                            .frame(width: 59,height: 34)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                withAnimation{
                                    h3HxHKT2xF = false
                                }
                            }
                        }
                        
                        Spacer()
                        Spacer().frame(width: 24)
                    }.padding(.bottom,8)
                        .padding(.horizontal,16)
                }
                
                //hstack end
                if xB4BENFOp {
                    //财富榜
                    VStack{
                        //hstack start
                        HStack(spacing:8){
                            
                            ZStack{
                                
                                if o6a4AyPmo == 0 {
                                    ZJ7h766mz(tMmEWWlfgUag: "qgM97bhM1")
                                                       .frame(width: 82, height: 32)
                                }
                                Text("This live")
                                                .g0LIIcoZQsOjyND9(
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
                                Text("Today")
                                                .g0LIIcoZQsOjyND9(
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
                                Text("Week")
                                                .g0LIIcoZQsOjyND9(
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
                        HStack(spacing:4){
                            ZJ7h766mz(tMmEWWlfgUag: "y0UwIUXSNa")
                                .frame(width: 9, height: 9)
                            Text("13h 20m 29s")
                                            .g0LIIcoZQsOjyND9(
                                                size: 12,
                                                weight: .regular,
                                                color: .white.opacity(0.8)
                                            )
                        }.padding(.top,6)
                            .padding(.bottom,40)
                        
                        HStack(alignment: .bottom, spacing: 28) {
                            
                            // 第二名
                            RankItemView(
                                name: "第二",
                                score: 80,
                                colors: [
                                    Color(red: 167/255, green: 202/255, blue: 255/255),
                                    Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                ],
                                rO06IvkUE: "gIQ4nRP"
                            )
                            .offset(y: 20) // 👈 往下压
                            
                            // 第一名（最高）
                            RankItemView(
                                name: "第一",
                                score: 100,
                                colors: [
                                    Color(red: 255/255, green: 248/255, blue: 136/255),
                                    Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                ],
                                rO06IvkUE: "x1Tms9QGDc"
                            )
                            
                            // 第三名
                            RankItemView(
                                name: "第三",
                                score: 60,
                                colors: [
                                    Color(red: 255/255, green: 216/255, blue: 204/255),
                                    Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                ],
                                rO06IvkUE: "oxk8XBdCod"
                            )
                            .offset(y: 30) // 👈 更低
                        }.padding(.horizontal,16)
                        
                        ZJ7h766mz(tMmEWWlfgUag: "xbEr5dtzc93v")
                                           .frame(height: 60)
                                           .frame(maxWidth: .infinity)
                                           .offset(y: -30)
                        ScrollView{
                            ForEach(0..<2){index in
                                OG8SPSFgtz0zns(pErJCVH3JV: index+4)
                            }
                        }.padding(.horizontal,16)
                        .offset(y: -40)
                        Spacer()
                        
                    }
                    
                }else{
                    //在线用户
                    ScrollView{
                        VStack{
                            ForEach(uNZ9IM5OK.indices,id: \.self){index in
                                HStack{
                                    ZStack{
                                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: uNZ9IM5OK[index].string("icon"))
                                                            .frame(width: 44,height: 44)
                                                            .clipShape(Circle())
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
                }
                
                
            }
            if xB4BENFOp {
                VStack(spacing:8){
                    Spacer()
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color.white.opacity(0.15))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                    OG8SPSFgtz0zns(pErJCVH3JV: 99)
                        .padding(.horizontal,16)
                
                }
            }
            
        }.onAppear{
            Task{
                atFBCJ7aeWP =  try await vFTFn8eFEdr()
            }
        }
    }
}

//排行list子项
struct OG8SPSFgtz0zns: View {
    var pErJCVH3JV :Int
    var body: some View {
        HStack(spacing:0){
            Text("\(pErJCVH3JV)")
                            .g0LIIcoZQsOjyND9(
                                size: 16,
                                weight: .semibold
                            )
            Spacer().frame(width: 23)
            ZStack{
                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
                                    .frame(width: 44,height: 44)
                                    .clipShape(Circle())
            }.frame(width: 48,height: 48)
                .background(.white.opacity(0.19))
                .clipShape(Circle())
            Spacer().frame(width: 10)
            Text("\(pErJCVH3JV)")
                            .g0LIIcoZQsOjyND9(
                                size: 14,
                                weight: .medium
                            )
            Spacer()
            HStack(spacing:8){
                ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                    .frame(width: 16, height: 16)
               
                Text("6999")
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular
                                )
            }
        }
    }
}

//排行topview
struct RankItemView: View {
    var name: String
    var score: Int
    var colors: [Color]
    var rO06IvkUE: String //排名top图
    
    var body: some View {
        ZStack{
            VStack {
                Spacer()
                Text(name)
                    .g0LIIcoZQsOjyND9(
                        size: 16,
                        weight: .semibold
                    ).padding(.bottom,12)
                HStack(spacing:8){
                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                        .frame(width: 16, height: 16)
                    Text("\(score)")
                        .g0LIIcoZQsOjyND9(
                            size: 14,
                            weight: .regular,
                            color: .white.opacity(0.8)
                        )
                }.padding(.bottom,38)
            }
            .frame(width: 84, height: 142)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: colors),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            VStack{
                ZStack{
                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
                                        .frame(width: 72,height: 72)
                                        .clipShape(Circle())
                    ZJ7h766mz(tMmEWWlfgUag: rO06IvkUE)
                        .frame(width: 100.93, height: 100.37)
                        
                }.offset(y:-26)
                Spacer()
            }
        }.frame(height: 197)
    }
}
