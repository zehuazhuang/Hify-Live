import SwiftUI
import UIPilot
//榜单排行榜
struct Gcx3oCl1wFkbw1: View {
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var h3HxHKT2xF: Bool = true // true Wealth false Charm
    @State private var o6a4AyPmo: Int = 0 // 0 this live 1 today 2 week
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
                //hstack end
                
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
                 ).padding(.bottom,9)
                //hstack end
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
                }
                
                Spacer()
                
            }.padding(.horizontal,16)
        }
    }
}

struct RankItemView: View {
    var name: String
    var score: Int
    var colors: [Color]
    var rO06IvkUE: String //x1Tms9QGDc
    
    var body: some View {
        ZStack{
          
            VStack {
                Text(name)
                    .g0LIIcoZQsOjyND9(
                        size: 16,
                        weight: .semibold
                    )
                
                Spacer()
                
                Text("\(score)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
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
