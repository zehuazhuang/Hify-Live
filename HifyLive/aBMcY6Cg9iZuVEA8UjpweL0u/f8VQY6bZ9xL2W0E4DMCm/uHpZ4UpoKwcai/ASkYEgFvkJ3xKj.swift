//ai页面

import SwiftUI
import SwiftfulRouting

struct ASkYEgFvkJ3xKj: View {
    @Environment(\.router) var w6S64Kback
    @State private var zJ12Kw9wzlText: String = ""
    @FocusState private var p44OpPgyKfoc: Bool
    @State private var qO5zSP720XNL: Bool = false //弹余额不足
    @State private var cFwtsghtldfBL6: Int = 0 //用户钻石
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            ZJ7h766mz(tMmEWWlfgUag: "k75UY6PywSI3")
                .scaledToFill()
                .frame(height: 389)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                .ignoresSafeArea()
            VStack(spacing:0){
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            w6S64Kback.dismissScreen()
                        }
                    Spacer()
                }
                Spacer().frame(height: 37)
                HStack{
                    ZStack(alignment: .topLeading){
                        ZJ7h766mz(tMmEWWlfgUag: "jQrGU76Txx")
                            .frame(width: 46,height: 25)
                        Text("AI Consulting")
                            .g0LIIcoZQsOjyND9(
                                size: 40,
                                weight: .black
                            ).padding(.top,13)
                    }
                    Spacer()
                }
                Spacer().frame(height: 31)
                HStack(spacing:8){
                    Text("AI copywriting generation")
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    ZStack {
                        // 背景 + 描边
                        RoundedRectangle(cornerRadius: 100)
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
                            .frame(width: 48, height: 20)
                        
                        
                        HStack(spacing:4){
                            ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                               .frame(width: 16, height: 16)
                            Text("100")
                                .g0LIIcoZQsOjyND9(
                                    size: 10,
                                    weight: .medium
                                )
                        }
                    }
                    Spacer()
                }
                Spacer().frame(height: 12)
                ZStack(alignment: .topLeading) {
                    
                    TextEditor(text: $zJ12Kw9wzlText)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                        .frame(height: 168)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 9)
                        .padding(.vertical, 4)
                        .scrollContentBackground(.hidden)
                        .background(
                            Color(red: 34/255, green: 34/255, blue: 38/255),
                        )
                        .cornerRadius(24)
                        .focused($p44OpPgyKfoc)
                    if zJ12Kw9wzlText.isEmpty {
                        HStack(spacing:0){
                            Text("Enter the copywriting style you want to generate")
                                .g0LIIcoZQsOjyND9(
                                    size: 12,
                                    weight: .regular,
                                    color: .white.opacity(0.4)
                                )
                                .padding(.horizontal, 12)
                                .padding(.vertical, 12)
                            
                           
                            Spacer()
                        }
                    }
                }
                Spacer()
                Button {
                    Task{
                        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                        cFwtsghtldfBL6 = try await s9EAe7DPKU()
                        
                        if(cFwtsghtldfBL6 >= 100){
                            
                            Task{
                                let xS2bi4lIs = try await k8VJeG1rEJh4(ovlkoBKType: -100)
                                if(xS2bi4lIs){
                                    cFwtsghtldfBL6 -= 100
                                }
                                
                            }
                            
                            
                            w6S64Kback.showScreen(.fullScreenCover) { _ in
                                WUjfoptOKs8pZfhSAH0duplG {
                                    UZ8hTFSeCcwrAy(yffmn1UtOF: zJ12Kw9wzlText)
                                }
                            }
                            zJ12Kw9wzlText = ""
                        }else{
                            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                            withAnimation{
                                qO5zSP720XNL = true
                            }
                        }
                    }
                
                    
                    
                } label: {
                    ZJ7h766mz(tMmEWWlfgUag: "ovdsD4s27")
                        .frame(width: 262,height: 46)
                        .overlay {
                            Text("OsfHVPPKKXIHMyiwPxWJ2g==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(size: 18, weight: .semibold)
                        }
                }
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .padding(.horizontal,16)
            
            //余额不足弹框
            if qO5zSP720XNL {
                ZsQF3kwG2Bygwo(ishtTvNH4y: $qO5zSP720XNL, qZFGLpr8D4s: {
                    w6S64Kback.showScreen(.fullScreenCover) { _ in
                        WUjfoptOKs8pZfhSAH0duplG {
                            Afmox09Q1UKVfE()
                        }
                    }
                })
            }
        }.onAppear{
            Task{
                cFwtsghtldfBL6 = try await s9EAe7DPKU()
            }
        }
        .onTapGesture {
            p44OpPgyKfoc = false
        }
    }
}
