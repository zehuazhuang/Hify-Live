//清空消息二次弹窗
import SwiftUI
import NIMSDK
struct CQ7E8ZC2A4Y0le: View {
    @Binding var heS7pC8R2J: Bool
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    heS7pC8R2J = false
                }
            VStack(spacing:26){
                ZStack{
                    ZJ7h766mz(tMmEWWlfgUag: "sLEVTQ6fX1M4qk")
                                       .frame(width: 287, height: 183)
                    VStack(spacing:4){
                        Text("Are you sure to clear all")
                                        .g0LIIcoZQsOjyND9(
                                            size: 18,
                                            weight: .semibold
                                        )
                        Text("sessions？")
                                        .g0LIIcoZQsOjyND9(
                                            size: 18,
                                            weight: .semibold
                                        )
                        HStack(spacing:12){
                            Button(action: {
                                heS7pC8R2J = false
                            }) {
                                Text("Cancel")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 18,
                                                    weight: .medium
                                                )
                                                    .frame(width: 90,height: 46)
                                                    
                                                    .background(
                                                        Color.white.opacity(0.25)
                                                    )
                                                    .cornerRadius(325)
                                                  
                                            }
                            
                            ZJ7h766mz(tMmEWWlfgUag: "cofD9tL5X4F")
                                               .frame(width: 136, height: 46)
                                               .onTapGesture{
                                                   RecentSessionManager.shared.clearAllSessions()
                                                   heS7pC8R2J = false
                                                   QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("+pbctOXhsAk5VyWVYe/fX0vqdZEA/9/1IMmxhVOFRVA=")
                                               }
                            
                        }.padding(.top,18)
                    }
                }.frame(width: 287, height: 183)
                ZJ7h766mz(tMmEWWlfgUag: "clL3qP6K1M")
                                   .frame(width: 32, height: 32)
                
            }
        }
    }
}
