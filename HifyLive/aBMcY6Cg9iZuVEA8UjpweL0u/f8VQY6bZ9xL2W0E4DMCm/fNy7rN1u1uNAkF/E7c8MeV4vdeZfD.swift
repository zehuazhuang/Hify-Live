//
//  E7c8MeV4vdeZfD.swift
//  HifyLive
//
//  Created by yangyang on 2026/2/2.
//
//拉黑二次确认
import SwiftUI

struct E7c8MeV4vdeZfD: View {
    let d9CzURL: String
    let fmlh3nname: String
    @Binding var ishtTvNH4y: Bool
    var onBlock: (() -> Void)
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    ishtTvNH4y = false
                }
            VStack(spacing:26){
                ZStack{
                    ZJ7h766mz(tMmEWWlfgUag: "b6C0E7jxW2A9L")
                                       .frame(width: 287, height: 279)
                    VStack(spacing:4){
                        ZStack{
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                    .frame(width: 72, height: 72)
                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: d9CzURL)
                                .frame(width: 62,height: 62)
                                .clipShape(Circle())
                        }.frame(width: 72, height: 72)
                        Spacer().frame(height: 6)
                        Text("Block 「@\(fmlh3nname)」？")
                                        .g0LIIcoZQsOjyND9(
                                            size: 14,
                                            weight: .regular
                                        )
                        Text("When a user is blacklisted, you will \nno longer receive their messages.")
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
                            
                            ZJ7h766mz(tMmEWWlfgUag: "cofD9tL5X4F")
                                               .frame(width: 136, height: 46)
                                               .onTapGesture {
                                                   onBlock()
                                               }
                            
                        }.padding(.top,18)
                    }
                }.frame(width: 287, height: 263)
            }
        }
    }
}
