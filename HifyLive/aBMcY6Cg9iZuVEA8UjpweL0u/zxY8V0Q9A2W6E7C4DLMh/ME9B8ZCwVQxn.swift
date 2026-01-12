
import SwiftUI

struct ME9B8ZCwVQxn: View {
    enum NgcenieTab {
        case lonaranpeH
        case rongrandtM
        case eormakgnaM
    }
    @State private var crformanchSelect: NgcenieTab = .lonaranpeH
    var body: some View {
        ZStack {
            Group {
                switch crformanchSelect {
                case .lonaranpeH:
                    E2VxD0iC4bYyh()
                case .rongrandtM:
                    jQp7ZL9aM8Wtm()
                case .eormakgnaM:
                    C8Z2x4M6YV9m()
                }
            }
             .frame(maxWidth: .infinity, maxHeight: .infinity)
                VStack {
                    Spacer()
                    ZStack{
                        ZJ7h766mz(tMmEWWlfgUag: "gZ8A2C9S1MqtLnav")
                                           .frame(height: 90)
                                           .frame(maxWidth: .infinity)
                        HStack {
                            Spacer()
                            nS9Zq7L4A1(aenteckTab: .lonaranpeH, haiecenseImg: "a8ZC7S9M1Aq4tLh",battemeneSeleImg:"q1qC9Z7S2t8LMsh", semblrmdanTi: "HlSMLF3CyqbA10eJ++BMNw==".bFHEatcgE4zzU9TCfDonsu())
                            Spacer()
                            nS9Zq7L4A1(aenteckTab: .rongrandtM, haiecenseImg: "qw1q7Z9S4A2t8Lm",battemeneSeleImg:"ef9A7q8S2tCL134sm", semblrmdanTi: "jvt4DOrKwG4ULVh/g9AJFA==".bFHEatcgE4zzU9TCfDonsu())
                            
                            Spacer()
                            nS9Zq7L4A1(aenteckTab: .eormakgnaM, haiecenseImg: "n2Z7S8M9q1tCL3m",battemeneSeleImg:"y9ZxM4C0Q8VY2L7Wsm", semblrmdanTi: "jjtFoJO8UHJSa1GFNwb9rA==".bFHEatcgE4zzU9TCfDonsu())
                            Spacer()
                        }
                    }
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
           }
       }
}
