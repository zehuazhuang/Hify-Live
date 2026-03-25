//头像开播

import SwiftUI
struct AqS7C1A2tLt: View {
    let mdFf7YData: [String: Any]
    var body: some View {
        VStack(spacing:4){
            ZStack{
                aW6MZ4xQ7L0Ez().frame(width: 56, height: 56)
                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: mdFf7YData.string("icon"))
                    .frame(width: 52,height: 52)
                    .clipShape(Circle())
                    .allowsHitTesting(false)
                ZStack {
                    
                    ZJ7h766mz(tMmEWWlfgUag: "ag1RyoCDRTVrB")
                                       .frame(width: 42, height: 16)
                    Text("Live").g0LIIcoZQsOjyND9(
                                        size: 12,
                                        weight: .medium,
                    )
                }.frame(width: 42,height: 16)
                  .frame(maxHeight: .infinity,alignment:.bottom)
                  .offset(y:3)
            }.frame(width: 56, height: 56)
            
            Text(mdFf7YData.string("nickname")).g0LIIcoZQsOjyND9(
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
                LinearGradient(
                    colors: [
                        Color(red: 26/255, green: 217/255, blue: 255/255),
                        Color(red: 217/255, green: 28/255, blue: 255/255)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
            .scaleEffect(pR9dV2sF1kUo ? 1.15 : 0.9)

            .onAppear {
                withAnimation(
                    .easeInOut(duration: 0.7)
                        .repeatForever(autoreverses: true)
                ) {
                    pR9dV2sF1kUo = true
                }
            }
    }
}
