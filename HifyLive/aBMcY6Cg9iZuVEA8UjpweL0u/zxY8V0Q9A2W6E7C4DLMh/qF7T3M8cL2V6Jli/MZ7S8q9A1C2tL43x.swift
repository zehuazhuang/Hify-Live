//主播关播页面显示
import SwiftUI
import SwiftfulRouting

struct MZ7S8q9A1C2tL43x: View {
    @Environment(\.router) var rM9Z8S7A1ql
    let x0W6LivDate : [String: Any]?  //主播信息
    @State private var isFollowing: Bool = false
    init(x0W6LivDate: [String: Any]?) {
            self.x0W6LivDate = x0W6LivDate
            // 初始化 State
            _isFollowing = State(initialValue: (x0W6LivDate?["followFlag"] as? Int == 0))
        }
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .fill(
                        LinearGradient(
                                    gradient: Gradient(colors: [Color.black.opacity(0), Color(red: 13/255, green: 13/255, blue: 18/255),]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                    )
                    .background(.ultraThinMaterial)
                    .frame(height: 455)
                    .frame(maxWidth: .infinity)
                Spacer()
            } .ignoresSafeArea()
            
            VStack(spacing:0){
                HStack{
                    Spacer()
                    ZJ7h766mz(tMmEWWlfgUag: "pD8K1Q5tB6R9Lh")
                        .frame(width: 32, height: 32)
                        .onTapGesture {
                            rM9Z8S7A1ql.dismissScreen()
                        }
                }
                ZStack{
                    Circle()
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 80, height: 80)
                        
                   
                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: x0W6LivDate?["icon"])
                            .frame(width: 72,height: 72)
                            .clipShape(Circle())
                            .allowsHitTesting(false)
                    
                        
              
                }.frame(width: 80, height: 80)
                    .onTapGesture {
                        rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                            WUjfoptOKs8pZfhSAH0duplG {
                                zQIRqHb1rSOJJ0wopZa8qxCs(areoloaUid: (x0W6LivDate?["userId"] as? Int) ?? 0)
                            }
                        }
                    }
                Spacer().frame(height: 12)
                Text(x0W6LivDate?["nickname"] as? String ?? "")
                                .g0LIIcoZQsOjyND9(
                                    size: 20,
                                    weight: .semibold
                                )
                Spacer().frame(height: 16)
                Text("Live broadcast is over ")
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: .regular,
                                    color: .white.opacity(0.6)
                                )
                Spacer().frame(height: 24)
                if isFollowing {
                    HStack(spacing:4){
                        ZJ7h766mz(tMmEWWlfgUag: "hZOWHXH3XC0ka")
                                           .frame(width: 16, height: 16)
                        
                        Text("Follow")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .medium
                                        )
                        
                    }
                    .frame(width: 143,height: 46)
                    .background(.white.opacity(0.15))
                    .cornerRadius(325)
                    .onTapGesture {
                        Task{
                            let isA2C6WEL =  try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: x0W6LivDate?["userId"] as? Int ?? 0, iA6M7W9EYL0: 1)
                            
                            if(isA2C6WEL){
                                isFollowing = false
                               
                            }
                            
                            
                        }
                    }
                }
            
                Spacer()
            }.padding(.horizontal,16)
        }.onAppear {
            if let uid = x0W6LivDate?["userId"] as? Int {
                L3vM9X0aQ8yF4b.shared.removeLive(by: uid)
            }
        }
    }
}
