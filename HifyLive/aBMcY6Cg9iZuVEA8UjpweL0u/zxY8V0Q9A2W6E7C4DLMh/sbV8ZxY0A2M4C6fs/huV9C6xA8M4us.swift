//用户组件

import SwiftUI
struct huV9C6xA8M4us: View {
    let lsegaUs: [String: Any]
    let gpiemeSele : String
    var body: some View {
        HStack{
            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: lsegaUs["icon"])
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack{
                HStack(spacing:0){
                    A6WsC0Ww6ELqEL(l4K9bX2q: (lsegaUs["nickname"] as? String) ?? "", k7NmFz1p: gpiemeSele, t3QvD8j: "1")

                    Spacer().frame(width: 4)
                    ZJ7h766mz(tMmEWWlfgUag: lsegaUs.int("gender") == 2 ? "bM4Z7ZVY8M4gr" : "h8bx8HHiJD1BodEG8Zfzl")
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
            Button(action: {}) {
                Text("Following").g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .medium,
                                    color: .white.opacity(0.8)
                                )
            }.frame(width: 92,height: 33)
                            .background(
                                LinearGradient(
                                    colors: [Color(red: 120 / 255,green: 233 / 255,blue: 255 / 255,opacity: 0.32
                                ), Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,
opacity: 0.25
                                )], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(325)
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
