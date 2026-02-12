//举报弹框
import SwiftUI
import UIPilot
import NIMSDK
struct QiRKOWGBnovrlh: View {
    @Binding var ish1z8TllyFvb: Bool
    @State private var isZ7E4xA0M2 = false
    let ihQ5ReMsh3Uid: Int
    let szHHWP8Name: String
    let wksgt0dUrl: String
    let ihysbsdRVA:String //yxid
    @Binding var uZIHcG0Vju0: Int //0未被拉黑 1 已拉黑
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var isy9YH69iABl = false //二次确认拉黑
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
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
          
                        pilot.push(.UI42a1QDtyK8gG)
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
                        if(uZIHcG0Vju0 == 0){
                            withAnimation{
                                isy9YH69iABl = true
                            }
                        }else{
                            Task{
                                let kQcXuK4siS =  await TPb21z0U.eDNcFBMyyi.hxEXXV2aWMNka7HM2qhr1Qccen3rB(iN2NID: ihQ5ReMsh3Uid, lCOFD: ihysbsdRVA)
                               
                                if(kQcXuK4siS){
                                    ish1z8TllyFvb = false
                                    uZIHcG0Vju0 = 0
                                }
                            }
                        }
                       

                    }) {
                        Text(uZIHcG0Vju0 == 0 ? "Block" : "Unblock")
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
            if isy9YH69iABl {
                E7c8MeV4vdeZfD(d9CzURL: wksgt0dUrl, fmlh3nname: szHHWP8Name, ishtTvNH4y: $isy9YH69iABl, onBlock: {
                    Task{
                        let ishlfBPM1m =   await TPb21z0U.eDNcFBMyyi.ngIp5pudxny8o0Mdsqv(fnLUzabLaul9Cx: ihQ5ReMsh3Uid, mwNKAPngt: ihysbsdRVA)
                        
                        
                       
                       
                        if(ishlfBPM1m){
                            uZIHcG0Vju0 = 1
                            ish1z8TllyFvb = false
                        }
                    }
                })
            }
            
        }
    }
}

