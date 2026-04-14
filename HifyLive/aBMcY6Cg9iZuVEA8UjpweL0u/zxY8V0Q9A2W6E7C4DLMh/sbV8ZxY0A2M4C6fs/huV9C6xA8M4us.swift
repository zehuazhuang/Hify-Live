//用户组件

import SwiftUI
struct huV9C6xA8M4us: View {
    let lsegaUs: [String: Any]
    let gpiemeSele : String
    let cF8eDIYj : () -> Void //关注、取关操作
    let v6Er31I62R: Bool

    
 
    var body: some View {
        
        HStack{
            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: lsegaUs["icon"])
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .allowsHitTesting(false)
            VStack{
                HStack(spacing:0){
                    A6WsC0Ww6ELqEL(l4K9bX2q: (lsegaUs["nickname"] as? String) ?? "", k7NmFz1p: gpiemeSele, t3QvD8j: "1")

                    Spacer().frame(width: 4)
                    ZJ7h766mz(tMmEWWlfgUag: lsegaUs.int("gender") == 2 ? "aSUqulEy" : "h8bx8HHiJD1BodEG8Zfzl")
                                       .frame(width: 24, height: 24)
                    Spacer()
                }
                HStack(spacing:2){
                    Text("ID：").g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                        color: .white.opacity(0.6))
                    A6WsC0Ww6ELqEL(l4K9bX2q: String((lsegaUs["userId"] as? Int) ?? 0), k7NmFz1p: gpiemeSele, t3QvD8j: "2")
                    Spacer()
                }
            }
            Spacer()
            if lsegaUs.int("userId") != IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId"){
                Button(action: {
                    cF8eDIYj()
                }) {
                    HStack(spacing:4){
                        if v6Er31I62R {
                            ZJ7h766mz(tMmEWWlfgUag: "q0M9xW2C7AL")
                                .frame(width: 16, height: 16)
                        }
                        
                        Text(v6Er31I62R ? "Follow" : "Following").g0LIIcoZQsOjyND9(
                            size: 14,
                            weight: .medium,
                            color: .white.opacity(v6Er31I62R ? 0.8 : 1)
                        )
                }
                    
                }.frame(width: 92,height: 33)
                                .background(
                                   
                                    LinearGradient(
                                        colors: [
                                            v6Er31I62R ?  Color(red: 138 / 255,green: 120 / 255,blue: 255 / 255,opacity: 0.2) :
                                                Color(red: 174/255, green: 173/255, blue: 247/255).opacity(0.15),
                                            v6Er31I62R ?  Color(red: 170 / 255,green: 84 / 255,blue: 255 / 255,opacity: 0.23) :
                                                Color(red: 174/255, green: 173/255, blue: 247/255).opacity(0.15)
                                        
                                        ], startPoint: .leading, endPoint: .trailing)
                                    
                                )
                                .cornerRadius(325)
            }
            
            
        }.frame(height: 76)
            .frame(maxWidth: .infinity)
            .padding(.horizontal,10)
        .background(
            LinearGradient(colors: [Color(
                                          red: 120 / 255,
                                          green: 233 / 255,
                                          blue: 255 / 255,
                                          opacity: 0.1
                                      ), Color(
                                          red: 84 / 255,
                                          green: 105 / 255,
                                          blue: 199 / 255,
                                          opacity: 0.15
                                      )], startPoint: .leading, endPoint: .trailing)
        ) .cornerRadius(12)
            
            
    }
}
