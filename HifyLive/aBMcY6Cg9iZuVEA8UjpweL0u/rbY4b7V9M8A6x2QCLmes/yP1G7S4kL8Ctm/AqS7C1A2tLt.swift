//头像开播

import SwiftUI
struct AqS7C1A2tLt: View {
    var body: some View {
        VStack(spacing:4){
            ZStack{
                aW6MZ4xQ7L0Ez().frame(width: 56, height: 56)
                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
                    .frame(width: 52,height: 52)
                    .clipShape(Circle())
                ZStack {
                    Text("Live").g0LIIcoZQsOjyND9(
                                        size: 12,
                                        weight: .regular,
                                    )
                }.frame(width: 38,height: 15)
                                .background(
                                    LinearGradient(
                                        colors: [Color(red: 203 / 255,green: 15 / 255,blue: 255 / 255,opacity: 1
                                    ), Color(red: 255 / 255,green: 55 / 255,blue: 28 / 255,opacity: 1)], startPoint: .leading, endPoint: .trailing)
                                )
                                .cornerRadius(4)
                                .frame(maxHeight: .infinity,alignment:.bottom)
            }.frame(width: 56, height: 56)
            Text("Madrigaasdasd").g0LIIcoZQsOjyND9(
                                size: 14,
                                weight: .regular,
                                color: .white.opacity(0.6))
                                .lineLimit(1)
                                .truncationMode(.tail)
            
        }.frame(width: 56)
    }
}
//光圈动画
struct aW6MZ4xQ7L0Ez: View {
    @State private var pR9dV2sF1kUo = false

    var body: some View {
        Circle()
            .stroke(
                AngularGradient(
                    colors: [
                        Color(red: 217/255, green: 28/255, blue: 255/255).opacity(0.72),
                        Color(red: 49/255, green: 198/255, blue: 232/255).opacity(0.1)
                    ],
                    center: .center
                ),
                lineWidth: 1
            )
            .rotationEffect(.degrees(pR9dV2sF1kUo ? 360 : 0))
            .onAppear {
                withAnimation(
                    .linear(duration: 1.6)
                        .repeatForever(autoreverses: false)
                ) {
                    pR9dV2sF1kUo = true
                }
            }
    }
}
