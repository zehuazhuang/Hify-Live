
import SwiftUI

struct ME9B8ZCwVQxn: View {
    enum NgcenieTab {
        case lonaranpeH
        case rongrandtM
        case eormakgnaM
    }
    @State private var crformanchSelect: NgcenieTab = .lonaranpeH
    
    @State private var s4V9Y0A2C6WEL = false //聊天页more底部弹框
    @State private var shR2D3nR8Q = false //清空消息二次弹窗
    @StateObject private var unreadStore = GlobalUnreadStore.shared //消息未读
    @State private var ecorjazyTypeInHome: Bool = true
    var body: some View {
        ZStack {
            Group {
                ZStack {
                    E2VxD0iC4bYyh(ecorjazyType: $ecorjazyTypeInHome)
                        .opacity(crformanchSelect == .lonaranpeH ? 1 : 0)
                        .allowsHitTesting(crformanchSelect == .lonaranpeH)

                    jQp7ZL9aM8Wtm(mo0LQ7DAi: {
                        s4V9Y0A2C6WEL = true
                    }, hGSH6kR: {
                        crformanchSelect = .lonaranpeH
                        ecorjazyTypeInHome = true
                        
                    })
                    .opacity(crformanchSelect == .rongrandtM ? 1 : 0)
                    .allowsHitTesting(crformanchSelect == .rongrandtM)

                    C8Z2x4M6YV9m()
                        .opacity(crformanchSelect == .eormakgnaM ? 1 : 0)
                        .allowsHitTesting(crformanchSelect == .eormakgnaM)
                }
            }
             .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Spacer()
                    ZStack(alignment:.top){
                        ZJ7h766mz(tMmEWWlfgUag: "gZ8A2C9S1MqtLnav")
                                           .frame(height: 90)
                                           .frame(maxWidth: .infinity)
                                           .scaleEffect(1.01)
                        HStack {
                            Spacer()
                            nS9Zq7L4A1(aenteckTab: .lonaranpeH, haiecenseImg: "a8ZC7S9M1Aq4tLh",battemeneSeleImg:"q1qC9Z7S2t8LMsh", semblrmdanTi: "HlSMLF3CyqbA10eJ++BMNw==".bFHEatcgE4zzU9TCfDonsu())
                            Spacer()
                            ZStack{
                                nS9Zq7L4A1(aenteckTab: .rongrandtM, haiecenseImg: "qw1q7Z9S4A2t8Lm",battemeneSeleImg:"ef9A7q8S2tCL134sm", semblrmdanTi: "jvt4DOrKwG4ULVh/g9AJFA==".bFHEatcgE4zzU9TCfDonsu())
                                
                                if  unreadStore.totalUnread > 0 {
                                    ZStack{
                                        Circle()
                                            .fill(.red)
                                            .frame(width: 20,height: 20)
                                        Text(unreadStore.totalUnread > 99 ? "99+" : "\(unreadStore.totalUnread)")
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 14,
                                                            weight: .regular
                                                        )
                                        }.offset(x: 16, y: -28)
                                    }
                            }
                            
                            Spacer()
                            nS9Zq7L4A1(aenteckTab: .eormakgnaM, haiecenseImg: "n2Z7S8M9q1tCL3m",battemeneSeleImg:"y9ZxM4C0Q8VY2L7Wsm", semblrmdanTi: "jjtFoJO8UHJSa1GFNwb9rA==".bFHEatcgE4zzU9TCfDonsu())
                            Spacer()
                        }.padding(.top,10)
                    }
                }
            if s4V9Y0A2C6WEL {
                ZV6K3W8qN5re(sE92F3V9XA: $s4V9Y0A2C6WEL, qkS5hN2V8: {
                    withAnimation{
                        shR2D3nR8Q = true
                    }
                    
                })
                 
            }
            
            if shR2D3nR8Q {
                CQ7E8ZC2A4Y0le(heS7pC8R2J: $shR2D3nR8Q)
                    
            }
            
                
            }
            .edgesIgnoringSafeArea(.bottom)
            
        }
    @ViewBuilder
       private func nS9Zq7L4A1(aenteckTab: NgcenieTab, haiecenseImg: String, battemeneSeleImg: String,semblrmdanTi: String) -> some View {
           Button(action: {
               crformanchSelect = aenteckTab
           }) {
               VStack(spacing: 3) {
                          ZJ7h766mz(tMmEWWlfgUag: crformanchSelect == aenteckTab ? battemeneSeleImg : haiecenseImg)
                              .frame(width: 30, height: 30)
                   Text(semblrmdanTi)
                                   .g0LIIcoZQsOjyND9(
                                       size:  14,
                                       weight: crformanchSelect == aenteckTab ? .black : .regular,
                                       color: crformanchSelect == aenteckTab ? .white : .white.opacity(0.4)
                                   )
                      }
           }.frame(width: 60,height: 47)
       }
}
