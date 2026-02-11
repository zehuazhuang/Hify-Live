//金币页面

import SwiftUI
import SwiftfulRouting



struct Afmox09Q1UKVfE: View {
    let qmLT3WCISX: [GridItem] = [
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
        GridItem(.flexible(), spacing: 8),
    ]
    @Environment(\.router) var yjuUSUolzAjZ
    @StateObject private var pkeDEXpbkc4RXu = PkeDEXpbkc4RXu.shared
    let tSh7kxFecD: [GAg6zvKCMA] = PUiSN9Hnxm9ZJ.tSh7kxFecD
    @State private var sQYNvOjd5vNum: Int = 0 //金币数量
    
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            ZJ7h766mz(tMmEWWlfgUag: "zqyH6H230kp")
                               .frame(height: 462)
                               .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                               .ignoresSafeArea()
            VStack{
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            yjuUSUolzAjZ.dismissScreen()
                        }
                    Text("Wallet")
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                    Text("\(String(sQYNvOjd5vNum))")
                        .g0LIIcoZQsOjyND9(
                            size: 24,
                            weight: .bold
                        )
                    
                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                       .frame(width: 24, height: 24)
                    
                }
                ScrollView(showsIndicators:false){
                    VStack(spacing:8){
                        LazyVGrid(columns: qmLT3WCISX, spacing: 8) {
                            ForEach(0..<10) { index in
                                VStack(spacing:0){
                                    Spacer()
                                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                                       .frame(width: 28, height: 28)
                                    Spacer().frame(height: 18)
                                    Text("\(tSh7kxFecD[index].dtcSMAfVsF4S)")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .bold
                                        )
                                    Spacer().frame(height: 14)
                                    ZStack {
                                       
                                        RoundedRectangle(cornerRadius: 20)
                                            .fill(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [
                                                        Color(red: 17/255, green: 226/255, blue: 255/255),
                                                        Color(red: 217/255, green: 28/255, blue: 255/255),
                                                        Color(red: 217/255, green: 28/255, blue: 255/255),
                                                    ]),
                                                    startPoint: .leading,
                                                    endPoint: .trailing
                                                )
                                            )
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color(red: 59/255, green: 63/255, blue: 66/255), lineWidth: 1)
                                            )
                                            .frame(width: 91, height: 25)
                                        
                                        
                                        Text("$ \(String(tSh7kxFecD[index].akepPKRtaWm))")
                                            .g0LIIcoZQsOjyND9(
                                                size: 14,
                                                weight: .medium
                                            )
                                    }
                                    Spacer().frame(height: 9)
                                }.frame(height:143)
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color(red: 27/255, green: 31/255, blue: 51/255),
                                                Color(red: 29/255, green: 25/255, blue: 36/255),
                                            ]),
                                            startPoint: .top,
                                            endPoint: .bottom
                                        )
                                    )
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        let productId = tSh7kxFecD[index].k0SBAq4pgTjj8
                                        Task {
                                            await pkeDEXpbkc4RXu.mZ6DqgRigNqO(productId: productId)
                                        }
                                    }
                            }
                        }
                    }
                }
            }.padding(.horizontal,16)
        }.onAppear {
            Task {
                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                sQYNvOjd5vNum = try await s9EAe7DPKU()
             
                // 设置回调
                pkeDEXpbkc4RXu.i03CT778BY = {
                    do {
                        sQYNvOjd5vNum = try await s9EAe7DPKU()
                    } catch {
                        print( error)
                    }
                }
                
                
                
                await pkeDEXpbkc4RXu.r1roySzHMIN(
                    ids: tSh7kxFecD.map { $0.k0SBAq4pgTjj8 }
                )
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
            }
        }
    }
}
