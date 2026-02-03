//
//  UDGjeLeI2bL7H.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/30.
//

//关注粉丝 用户组件
import SwiftUI
struct UDGjeLeI2bL7H: View {
    let hXDX98TXUs: [String: Any]
    let iCHzYzK6 : String
    @State private var v6Er31I62R: Bool
    let ondZKTQ307nh : () -> Void //取关弹框
    
    init(
            hXDX98TXUs: [String: Any],
            iCHzYzK6: String,
            ondZKTQ307nh: @escaping () -> Void
        ) {
            self.hXDX98TXUs = hXDX98TXUs
            self.iCHzYzK6 = iCHzYzK6
            _v6Er31I62R = State(initialValue: hXDX98TXUs.int("followed") == 0)
            self.ondZKTQ307nh = ondZKTQ307nh
        }
    var body: some View {
        
        HStack{
            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: hXDX98TXUs["icon"])
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .allowsHitTesting(false)
            VStack{
                HStack(spacing:0){
                    A6WsC0Ww6ELqEL(l4K9bX2q: (hXDX98TXUs["nickname"] as? String) ?? "", k7NmFz1p: iCHzYzK6, t3QvD8j: "1")

                    
                
                    Spacer()
                }
                HStack(spacing:2){
                    Text("ID：").g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                        color: .white.opacity(0.6))
                    A6WsC0Ww6ELqEL(l4K9bX2q: String((hXDX98TXUs["userId"] as? Int) ?? 0), k7NmFz1p: iCHzYzK6, t3QvD8j: "2")
                    Spacer()
                }
            }
            Spacer()
            Button(action: {
                Task{
                    
                    if(!v6Er31I62R){
                        ondZKTQ307nh()
                        return
                    }
                   
                    let isA2C6WEL =  try await fol6W9ZQ4xC2(uY2M8A4E7C0xL: hXDX98TXUs.int("userId"), iA6M7W9EYL0: 1)
                    if(isA2C6WEL){
                        v6Er31I62R = !v6Er31I62R
                    }
                    
                }
                
                
            }) {
                HStack(spacing:4){
                    if v6Er31I62R {
                        ZJ7h766mz(tMmEWWlfgUag: "q0M9xW2C7AL")
                            .frame(width: 16, height: 16)
                    }
                    
                    Text(v6Er31I62R ? "Follow" : "Following").g0LIIcoZQsOjyND9(
                        size: 14,
                        weight: .medium,
                        color: .white.opacity(v6Er31I62R ? 0.8 : 1)
                    )
            }
                
            }.frame(width: 92,height: 33)
                            .background(
                                LinearGradient(
                                    colors: [Color(red: 120 / 255,green: 233 / 255,blue: 255 / 255,opacity: 0.32
                                ), Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,
opacity: 0.25
                                )], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(325)
        }.frame(height: 76)
            .frame(maxWidth: .infinity)
            .padding(.horizontal,10)
        .background(
            LinearGradient(colors: [Color(
                                          red: 120 / 255,
                                          green: 233 / 255,
                                          blue: 255 / 255,
                                          opacity: 0.1
                                      ), Color(
                                          red: 84 / 255,
                                          green: 105 / 255,
                                          blue: 199 / 255,
                                          opacity: 0.15
                                      )], startPoint: .leading, endPoint: .trailing)
        ) .cornerRadius(12)
            
            
    }
}
