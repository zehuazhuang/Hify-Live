//举报弹框
import SwiftUI
import SwiftfulRouting

struct QiRKOWGBnovrlh: View {
    @Binding var ish1z8TllyFvb: Bool
    @State private var isZ7E4xA0M2 = false
    let ihQ5ReMsh3Uid : Int
    @Environment(\.router) var rM9Z8S7A1ql
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    ish1z8TllyFvb = false
                }
            ZStack{
                
                
                ZJ7h766mz(tMmEWWlfgUag: "M8Q7ZP1H2Tb")
                                   .frame(width: 178, height: 166)
                                   .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                VStack(spacing:20){
                    
                    Button(action: {
                        ish1z8TllyFvb = false
                        rM9Z8S7A1ql.showScreen(.fullScreenCover){ _ in
                            WUjfoptOKs8pZfhSAH0duplG {
                                UI42a1QDtyK8gG()
                            }
                        }
                    }) {
                        Text("Report")
                            .g0LIIcoZQsOjyND9(
                                size: 16,
                                weight: .regular
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .contentShape(Rectangle())
                    }
                    .frame(height: 46)
                    .background(
                        LinearGradient(
                            colors: [
                                Color(red: 211 / 255, green: 75 / 255, blue: 117 / 255),
                                Color(red: 237 / 255, green: 168 / 255, blue: 102 / 255),
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(325)
                    
                    Button(action: {
                        Task{
                            let ishlfBPM1m =   await TPb21z0U.eDNcFBMyyi.ngIp5pudxny8o0Mdsqv(fnLUzabLaul9Cx: ihQ5ReMsh3Uid, mwNKAPngt: "")
                            
                            if(ishlfBPM1m){
                                ish1z8TllyFvb = false
                            }
                        }
                    }) {
                        Text("Block")
                            .g0LIIcoZQsOjyND9(
                                size: 16,
                                weight: .regular,
                                color: Color(red: 237 / 255, green: 168 / 255, blue: 102 / 255)
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .contentShape(Rectangle())
                    }
                    .frame(height: 46)
                    .background(
                        RoundedRectangle(cornerRadius: 325)
                            .fill(Color.clear)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 325)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color(red: 211 / 255, green: 75 / 255, blue: 117 / 255),
                                        Color(red: 237 / 255, green: 168 / 255, blue: 102 / 255)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 1
                            )
                    )
                    Button(action: {
                        ish1z8TllyFvb = false
                    }) {
                        Text("Cancel")
                            .g0LIIcoZQsOjyND9(
                                size: 16,
                                weight: .regular
                            )
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .contentShape(Rectangle())
                    }
                    .frame(height: 46)
                    .background(
                        .white.opacity(0.1)
                    )
                    .cornerRadius(325)
                    Spacer()
                }
                .padding(.top,32)
                .padding(.horizontal,36)
            }
            .frame(height: 251)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [Color(red: 17 / 255, green: 31 / 255, blue: 46 / 255),
                             Color(red: 21 / 255, green: 12 / 255, blue: 38 / 255)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(s7q2ZC1S9A4tM8L3(radius: 24, corners: [.topLeft,.topRight]))
            
            .offset(y: isZ7E4xA0M2 ? 0 : 251)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .onAppear {
                isZ7E4xA0M2 = false
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.25)) {
                        isZ7E4xA0M2 = true
                    }
                }
            }
        }
    }
}

