//离开直播间
import SwiftUI

struct Z8q7S9A1C2tLClo: View {
    @Binding var hllonneC8R2J: Bool
    let caentClo :() -> Void
    let ourreeName : String
    let dimpaseAvatar : String
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    hllonneC8R2J = false
                }
            VStack(spacing:26){
                ZStack{
                    ZJ7h766mz(tMmEWWlfgUag: "abC7Z9qS8A1t2L")
                                       .frame(width: 287, height: 270)
                    VStack(spacing:0){
                       
                            ZStack{
                                Circle()
                                    .fill(Color.white.opacity(0.2))
                                    .frame(width: 72, height: 72)
                                    
                                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: dimpaseAvatar)
                                    .frame(width: 62,height: 62)
                                    .clipShape(Circle())
                                ZStack {
                                    Text("Host").g0LIIcoZQsOjyND9(
                                                        size: 12,
                                                        weight: .regular,
                                                    )
                                }.frame(width: 46,height: 18)
                                                .background(
                                                    LinearGradient(
                                                        colors: [Color(red: 203 / 255,green: 15 / 255,blue: 255 / 255,opacity: 1
                                                    ), Color(red: 255 / 255,green: 55 / 255,blue: 28 / 255,opacity: 1)], startPoint: .leading, endPoint: .trailing)
                                                )
                                                .cornerRadius(12)
                                                .frame(maxHeight: .infinity,alignment:.bottom)
                            }.frame(width: 72, height: 72)
                            .padding(.bottom,8)
                                
                        Text("@\(ourreeName)").g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular,
                                            color: .white.opacity(0.6))
                        .padding(.bottom,16)
                                             
                            
                       
                        Text("You are chatting in the room,are you sure ")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular
                                        )
                        Text("you want to leave?")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular
                                        )
                                        
                        HStack(spacing:12){
                            Button(action: {
                                hllonneC8R2J = false
                            }) {
                                Text("Stay in")
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
                            
                            ZJ7h766mz(tMmEWWlfgUag: "lea7A2C1tLM43")
                                               .frame(width: 136, height: 46)
                                               .onTapGesture {
                                                   caentClo()
                                               }
                            
                        }.padding(.top,18)
                    }
                }.frame(width: 287, height: 270)
                ZJ7h766mz(tMmEWWlfgUag: "clL3qP6K1M")
                                   .frame(width: 32, height: 32)
                
            }
        }
    }
}
