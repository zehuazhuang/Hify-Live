import SwiftUI
import SwiftfulRouting

//个人相册修改
struct o95HINW4DpHIAT: View {
    
    @Environment(\.router) var cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 5) {
                HStack(spacing: 0, content: {
                    HStack(spacing: 12) {
                        Button{
                            cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb.dismissScreen()
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                                .frame(width: 24,height: 24)
                        }
                        Text("U97zV4ZU8kHR5otCSWwn0o0g6sGI4EYL0c15j3pbF2A=".bFHEatcgE4zzU9TCfDonsu())
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: .semibold
                            )
                    }
                    Spacer()
                    RoundedRectangle(cornerRadius: 325)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 16/255, green: 227/255, blue: 1),
                                    Color(red: 217/255, green: 28/255, blue: 1)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .frame(width: 78,height: 33)
                        .overlay(alignment: .center) {
                            Text("hZ5+j3VKZ8mtaGSA5ogSvw==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    weight: .medium
                                )
                        }
                })
                .padding(.top,58)
                .padding(.horizontal,16)
                HStack(spacing: 0) {
                    Text("FEAR8GvovJA5jcxMaK0lDplVMLzQ45sxPiU8eV7b2UuUbebYKDoGeS348FA7zHc6".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            color: Color.white.opacity(0.4)
                        )
                    Spacer()
                }
                .padding(.horizontal,16)
                ScrollView {
                    let ekG0gcc6kk = [
                        GridItem(.flexible(), spacing: 9),
                        GridItem(.flexible(), spacing: 9)
                    ]
                    LazyVGrid(columns: ekG0gcc6kk, spacing: 12) {
                        ForEach(0..<3, id: \.self) { index in
                            if index == 0 {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(red: 34/255, green: 34/255, blue: 38/255))
                                    .frame(height: 126)
                                    .overlay(alignment: .center) {
                                        ZStack(alignment: .center) {
                                            RoundedRectangle(cornerRadius: 8)
                                                .strokeBorder(
                                                    Color.white.opacity(0.4),
                                                    style: StrokeStyle(
                                                        lineWidth: 1,
                                                        lineCap: .round,
                                                        dash: [8, 6]
                                                    )
                                                )
                                            ZJ7h766mz(tMmEWWlfgUag: "yJv1l88NyCjeIR2yve6vkxIHscdO")
                                                .frame(width: 16,height: 16)
                                        }
                                    }
                            } else {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.blue)
                                    .frame(height: 126)
                                    .overlay(
                                        ZStack(content: {
                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.js.design/assets/img/6932532bb5e8b987e5ee80de.png#aee39d6fdc9b09753369edb229eb383f")
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 126)
                                            Color.black.opacity(0.2)
                                        })
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                    .overlay(alignment: .topTrailing) {
                                        ZJ7h766mz(tMmEWWlfgUag: "x7mVKdhqttJqvt5UTZbsvzaHN4vsAO")
                                            .frame(width: 24,height: 24)
                                            .padding(.all,4)
                                    }
                            }
                        }
                    }
                    .padding(.top,14)
                    .padding(.horizontal,16)
                    .padding(.bottom,30)
                }
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    o95HINW4DpHIAT()
}
