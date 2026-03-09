//
//  QX10IFCuguXvQa.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/9.
//
//礼物弹框

import SwiftUI
struct QX10IFCuguXvQa: View {
    @Binding var dyzmBppNrJ: Bool
    @State private var jR6X0INMmiZ = false
    let jhqguQVC07 :() -> Void //显示直播钻石商店
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    cW2kJ7C1e()
                }
            
            ZStack{
               
                
                ZJ7h766mz(tMmEWWlfgUag: "d1SPKVSkFLB")
                                   .frame(height: 374)
                                   .frame(maxWidth: .infinity)
                VStack(spacing:20){
                    HStack(spacing:31){
                        Text("Popular")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .semibold
                                        ).onTapGesture {
                                            jhqguQVC07()
                                        }
                        
                        Spacer()
                    }
                 
                    Spacer()
                }
                .padding(.top,20)
                .padding(.horizontal,16)
            }
            .frame(height: 374)
            .offset(y: jR6X0INMmiZ ? 0 : 374)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .scaleEffect(x: 1.01, y: 1.02, anchor: .center)
            .onAppear {
                jR6X0INMmiZ = false
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.25)) {
                        jR6X0INMmiZ = true
                    }
                }
            }
        }
    }
    func cW2kJ7C1e(){
        withAnimation(.easeOut(duration: 0.25)) {
            jR6X0INMmiZ = false
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            dyzmBppNrJ = false
        }
    }
}
