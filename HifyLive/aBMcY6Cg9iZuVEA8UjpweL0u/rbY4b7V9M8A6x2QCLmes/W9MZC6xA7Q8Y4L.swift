
//私聊取关弹框
import SwiftUI

struct W9MZC6xA7Q8Y4L: View {
    let avatarURL: String
    let nickname: String
    var onClose: (() -> Void)?
    var onUnfollow: (() -> Void)?
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    onClose?()
                }
            VStack(spacing:26){
                ZStack{
                    ZJ7h766mz(tMmEWWlfgUag: "b6C0E7jxW2A9L")
                                       .frame(width: 287, height: 263)
                    VStack(spacing:4){
                        ZStack{
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                    .frame(width: 72, height: 72)
                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: avatarURL)
                                .frame(width: 62,height: 62)
                                .clipShape(Circle())
                        }.frame(width: 72, height: 72)
                        Spacer().frame(height: 6)
                        Text("@\(nickname)")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular
                                        )
                        Text("Are you want to Unfollow")
                                        .g0LIIcoZQsOjyND9(
                                            size: 18,
                                            weight: .semibold
                                        )
                       
                        HStack(spacing:12){
                            Button(action: {
                                onClose?()
                            }) {
                                Text("Keep follow")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 18,
                                                    weight: .medium
                                                )
                                                    .frame(width: 116,height: 46)
                                                    
                                                    .background(
                                                        Color.white.opacity(0.25)
                                                    )
                                                    .cornerRadius(325)
                                                  
                                            }
                            
                            ZJ7h766mz(tMmEWWlfgUag: "unfMZ80E2Q6")
                                               .frame(width: 116, height: 46)
                                               .onTapGesture {
                                                   onClose?()
                                                   onUnfollow?()
                                               }
                            
                        }.padding(.top,18)
                    }
                }.frame(width: 287, height: 263)
                ZJ7h766mz(tMmEWWlfgUag: "clL3qP6K1M")
                                   .frame(width: 32, height: 32)
                                   .onTapGesture {
                                       onClose?()
                                   }
                
            }
        }
    }
}
