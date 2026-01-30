import SwiftUI

//头像更换选择弹框
struct f52Zxoy0vfJtZQ8pdH9SQ: View {
    @Binding var eQLvijjIGA: Bool
    @State private var isZ7E4xA0M2 = false
    var p6JuwoLebzf2SwHZu: (Int) -> Void
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    eQLvijjIGA = false
                }
            
            VStack{
                Spacer()
                ZJ7h766mz(tMmEWWlfgUag: "xPW24mCd1SORVR56nr4UXuY")
                    .frame(height: 271)
                    .overlay {
                        VStack(spacing: 32) {
                            Text("I7I78sCmM9O0q41HOv6fSA==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: .semibold
                                )
                                .padding(.top,24)
                            VStack(spacing: 20) {
                                Button{
                                    p6JuwoLebzf2SwHZu(0)
                                } label: {
                                    RoundedRectangle(cornerRadius: 325)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color(red: 173/255, green: 192/255, blue: 1, opacity: 0.32),
                                                    Color.white.opacity(0.25)
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(height: 46)
                                        .overlay(alignment: .center) {
                                            Text("orkYPgZc5Age3qhGSsiSRg==".bFHEatcgE4zzU9TCfDonsu())
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16
                                                )
                                        }
                                }
                                Button{
                                    p6JuwoLebzf2SwHZu(1)
                                } label: {
                                    RoundedRectangle(cornerRadius: 325)
                                        .fill(
                                            LinearGradient(
                                                gradient: Gradient(colors: [
                                                    Color(red: 173/255, green: 192/255, blue: 1, opacity: 0.32),
                                                    Color.white.opacity(0.25)
                                                ]),
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .frame(height: 46)
                                        .overlay(alignment: .center) {
                                            Text("dUcm+va365NtWGz86VCa9A==".bFHEatcgE4zzU9TCfDonsu())
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16
                                                )
                                        }
                                }
                            }
                            .padding(.horizontal,36)
                            Spacer()
                        }
                    }
            }.offset(y: isZ7E4xA0M2 ? 0 : 300)
        }.onAppear{
            isZ7E4xA0M2 = false
            DispatchQueue.main.async {
                withAnimation(.easeOut(duration: 0.25)) {
                    isZ7E4xA0M2 = true
                }
            }
        }
        
    }
}
