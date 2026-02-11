

//ai结果

import SwiftUI
import UIPilot

struct UZ8hTFSeCcwrAy: View {
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    let yffmn1UtOF: String //故事
    @State private var nFWxHFoeMiXPMR = "" //ai接口返回文字
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            ZJ7h766mz(tMmEWWlfgUag: "k75UY6PywSI3")
                .scaledToFill()
                .frame(height: 389)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                .ignoresSafeArea()
            VStack{
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            pilot.pop()
                        }
                    Text("AI Consulting")
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: .semibold
                                    )
                    Spacer()
                }.padding(.horizontal,16)
                ScrollView{
                    ZStack{
                        ZJ7h766mz(tMmEWWlfgUag: "s7AlUaFWRPTl")
                            .frame(width:199, height: 253)
                        LinearGradient(
                               gradient: Gradient(colors: [
                                Color(red: 13/255, green: 14/255, blue: 21/255),
                                Color(red: 13/255, green: 14/255, blue: 20/255).opacity(0.1),
                                Color(red: 13/255, green: 14/255, blue: 21/255).opacity(0),
                               ]),
                               startPoint: .bottom,
                               endPoint: .top
                           )
                           .frame(height: 51)
                           .frame(maxWidth: .infinity,maxHeight: .infinity, alignment: .bottom)
                    }.frame(height: 253)
                        .frame(maxWidth: .infinity)
                    Text(nFWxHFoeMiXPMR)
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: .regular
                                    ).padding(.horizontal,56)
                }
            }
        }.onAppear{
            Task{
                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                nFWxHFoeMiXPMR =  try await wUxKwoiMSH(a8rLStnIHfC: yffmn1UtOF)
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            }
        }
    }
}
