//余额不足
import SwiftUI

struct ZsQF3kwG2Bygwo: View {
    @Binding var ishtTvNH4y: Bool
    let qZFGLpr8D4s: () -> Void
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    ishtTvNH4y = false
                }.ignoresSafeArea()
            VStack(spacing:22){
                ZStack{
                    ZJ7h766mz(tMmEWWlfgUag: "jJsg89qmB8B")
                                       .frame(width: 287, height: 249)
                    VStack(spacing:4){
                        
                        ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                           .frame(width: 72, height: 72)
                        Spacer().frame(height: 6)
                 
                        Text("Sorry, your balance is insufficient.\nPlease recharge before continuing.")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular
                                        )
                       
                        HStack(spacing:12){
                            Button(action: {
                                ishtTvNH4y = false
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
                            
                            RoundedRectangle(cornerRadius: 325)
                                .fill(Color.clear)
                                .frame(width: 136,height: 46)
                                .overlay {
                                    ZStack(alignment: .center) {
                                        ZJ7h766mz(tMmEWWlfgUag: "ySceliLORzDY")
                                        Text("hbRPSikZjt3gcfaAIKa5Rw==".bFHEatcgE4zzU9TCfDonsu())
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .semibold
                                            )
                                    }
                                }.onTapGesture {
                                    ishtTvNH4y = false
                                    qZFGLpr8D4s()
                                }
                            
                        }.padding(.top,18)
                    }
                }.frame(width: 287, height: 263)
            }
        }
    }
}
