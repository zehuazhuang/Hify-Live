import SwiftUI
import UIPilot
import NIMSDK
import Combine
//首页榜单排行榜
struct Gcx3oCl1wFkbw1: View {
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var h3HxHKT2xF: Bool = true // true Wealth false Charm
    @State private var o6a4AyPmo: Int = 1  //  1 today 2 week
    @State private var atFBCJ7aeWP: [[String: Any]] = [] //财富榜数据
    @State private var cwom50hBfhTc: Bool = false //底部用户弹框
    @State private var pQN3C5FxRi: Int = 0 //点击用户坐标
    @State private var chatSession: ChatSessionWrapper? //半屏私聊
    @State private var wYh4kyARQ: [String: Any] = [:] //当前用户的财富榜数据
    
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
                ZJ7h766mz(tMmEWWlfgUag: h3HxHKT2xF ? "cLR8Uxcsdzh" : "wCcIXLztG1E4")
                    .scaledToFill()
                    .frame(height: 370)
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                    .ignoresSafeArea()
            
            
            VStack(spacing:0){
                //hstack start

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
               
                
                //hstack end
                    //财富榜
                VStack(spacing:0){
                        //hstack start
                        HStack(spacing:8){
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
                        
                        
                        
                        
                        ScrollView(showsIndicators: false){
                            Spacer().frame(height: 20)
                            ZStack(alignment: .bottom){
                                HStack(alignment: .bottom, spacing: 0) {
                                    RankItemView(
                                        gDKv25ocXI: atFBCJ7aeWP.count > 1 ? atFBCJ7aeWP[1] : [:],
                                        colors: [
                                            Color(red: 167/255, green: 202/255, blue: 255/255),
                                            Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                        ],
                                        rO06IvkUE: "gIQ4nRP",
                                        a5MYGuUu: false,
                                        uF7VFlMQa: {
                                            withAnimation{
                                                pQN3C5FxRi = 1
                                                cwom50hBfhTc = true
                                            }
                                        }
                                    )
                                    .offset(y: 20)
                                    RankItemView(
                                        gDKv25ocXI: atFBCJ7aeWP.count > 0 ? atFBCJ7aeWP[0] : [:],
                                        colors: [
                                            Color(red: 255/255, green: 248/255, blue: 136/255),
                                            Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                        ],
                                        rO06IvkUE: "x1Tms9QGDc",
                                        a5MYGuUu: false,
                                        uF7VFlMQa: {
                                            withAnimation{
                                                pQN3C5FxRi = 0
                                                cwom50hBfhTc = true
                                            }
                                        }
                                    )
                                    RankItemView(
                                        gDKv25ocXI: atFBCJ7aeWP.count > 2 ? atFBCJ7aeWP[2] : [:],
                                        colors: [
                                            Color(red: 255/255, green: 216/255, blue: 204/255),
                                            Color(red: 13/255, green: 13/255, blue: 20/255).opacity(0)
                                        ],
                                        rO06IvkUE: "oxk8XBdCod",
                                        a5MYGuUu: false,
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
                                    OG8SPSFgtz0zns(cvqRWsK91e: item, pErJCVH3JV: offset + 4, ug5Hb1dC1: false,
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
                                        .init(color: .black, location: 0.02),
                                        .init(color: .black, location: 1)
                                    ]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                        //滑动 end
                    }
            }
            //排行list
          
                //ScrollView {
                    
                   
                    
//                }.padding(.horizontal,16)
//                .padding(.top,340)
//                .padding(.bottom,h3HxHKT2xF ? 60 :0)
           
           
            
            //底部自己
            if h3HxHKT2xF {
                let rankValue =  Int(wYh4kyARQ.string("rankValue")) ?? 0
                let sqSXyQKd =  wYh4kyARQ.int("rankIndex")
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
                    isW9YQ6C8L: $cwom50hBfhTc, yaXdI1QB7uP: {e570ZTkO2 in
                       
                    }
                )
            }
            
        }.onAppear{
            Task{
               await vdD89xwThuLoad()
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
            WUjfoptOKs8pZfhSAH0duplG(showGlobalNotice: false) {
                CgZU7mTgY46l(
                    session: wrapper.session,
                    opponentAvatarURL: wrapper.u1NCaZAWMA,
                    qOH29Z5X: true
                )
                .environmentObject(pilot)
            }
            .presentationDetents([.fraction(0.75)])
            .presentationBackground(.clear)
        }
    }
    
    func vdD89xwThuLoad() async {
        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
        var ainDhsn9iO = ""
        
        if o6a4AyPmo == 0 {
            ainDhsn9iO = "now"
        } else if o6a4AyPmo == 1 {
            ainDhsn9iO = "day"
        } else {
            ainDhsn9iO = "week"
        }
        
        do {
         
                //榜单
                if h3HxHKT2xF {
                    atFBCJ7aeWP = try await vFTFn8eFEdr(
                        wvh5z2I6H: ainDhsn9iO
                    )
                }else{
                    atFBCJ7aeWP = try await dB2EuHa3VY3u(
                        mXaJwcQS7e: ainDhsn9iO
                    )
                }
                
            
            
           
                wYh4kyARQ = atFBCJ7aeWP.first {
                   $0.string("userId") == String(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId"))
               } ?? [:]
           
            
            
            
            
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        } catch {
         
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        }
    }
}

//排行list子项
struct OG8SPSFgtz0zns: View {
    let cvqRWsK91e:[String: Any]
    var pErJCVH3JV :Int
    var ug5Hb1dC1:Bool //true 直播进 false 首页进
    let uF7VFlMQa:() -> Void
    var body: some View {
        let rankValue = ug5Hb1dC1 ? cvqRWsK91e.int("costNum") : Int(cvqRWsK91e.string("rankValue")) ?? 0
        let sqSXyQKd = ug5Hb1dC1 ? cvqRWsK91e.string("icon") : cvqRWsK91e.string("avatar")
        HStack(spacing:0){
            ZStack{
                HStack{
                    Text("\(pErJCVH3JV)")
                                    .g0LIIcoZQsOjyND9(
                                        size: 16,
                                        weight: .semibold
                                    )
                    Spacer()
                }
                HStack{
                    ZStack{
                        if sqSXyQKd == "" {
                            ZJ7h766mz(tMmEWWlfgUag: "gCZGrlvVVn1D")
                                .frame(width: 44,height: 44)
                                .clipShape(Circle())
                        }else{
                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: sqSXyQKd)
                                                .frame(width: 44,height: 44)
                                                .clipShape(Circle())
                                                .allowsHitTesting(false)
                        }
                        
                    }.frame(width: 48,height: 48)
                        .background(.white.opacity(0.19))
                        .clipShape(Circle())
                        .onTapGesture {
                            uF7VFlMQa()
                        }
                    Spacer().frame(width: 10)
                    Text("\(cvqRWsK91e.string("nickname"))")
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
            
            
            
        }
    }
}

//排行topview
struct RankItemView: View {
    var gDKv25ocXI: [String: Any]
    var colors: [Color]
    var rO06IvkUE: String //排名top图
    var a5MYGuUu:Bool //true 直播进 false 首页进
    let uF7VFlMQa:() -> Void
    
    var body: some View {
        let rankValue = a5MYGuUu ? gDKv25ocXI.int("costNum") : Int(gDKv25ocXI.string("rankValue")) ?? 0
        let sqSXyQKd = a5MYGuUu ? gDKv25ocXI.string("icon") : gDKv25ocXI.string("avatar")
        ZStack{
            VStack {
                Spacer()
                Text(gDKv25ocXI.string("nickname"))
                    .g0LIIcoZQsOjyND9(
                        size: 16,
                        weight: .semibold
                    ).padding(.bottom,10)
                    .lineLimit(1)
                    .truncationMode(.tail)
                HStack(spacing:8){
                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                        .frame(width: 16, height: 16)
                    Text("\(rankValue.shLK3lGBF())")
                        .g0LIIcoZQsOjyND9(
                            size: 14,
                            weight: .regular,
                            color: .white.opacity(0.8)
                        )
                }.padding(.bottom,35)
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
                    if sqSXyQKd == "" {
                        ZJ7h766mz(tMmEWWlfgUag: "gCZGrlvVVn1D")
                                            .frame(width: 72,height: 72)
                                            .clipShape(Circle())
                    }else{
                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: sqSXyQKd)
                                            .frame(width: 72,height: 72)
                                            .clipShape(Circle())
                                            .allowsHitTesting(false)
                    }
                    
                    ZJ7h766mz(tMmEWWlfgUag: rO06IvkUE)
                        .frame(width: 120, height: 120)
                        
                }.offset(y:-26)
                    .onTapGesture {
                        uF7VFlMQa()
                    }
                Spacer()
            }
        }.frame(height: 197)
    }
}
