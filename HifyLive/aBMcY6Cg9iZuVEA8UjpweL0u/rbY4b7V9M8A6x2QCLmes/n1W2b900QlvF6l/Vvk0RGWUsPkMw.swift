
//重复消息弹框

import SwiftUI

struct Vvk0RGWUsPkMw: View {
    var onCancel: (() -> Void)?
    var onConfirm: (() -> Void)?
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    onCancel?()
                }
            ZStack{
                ZJ7h766mz(tMmEWWlfgUag: "eY6sGmrWkNs")
                                   .frame(width: 287, height: 165)
                VStack(spacing:29.5){
                    Text("Resend this message")
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: .semibold
                                    )
                    
                    HStack(spacing:12){
                        Button(action: {
                            onCancel?()
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
                                onConfirm?()
                            }
                        
                    }
                }
            }.frame(width: 287, height: 165)
        }
    }
}
