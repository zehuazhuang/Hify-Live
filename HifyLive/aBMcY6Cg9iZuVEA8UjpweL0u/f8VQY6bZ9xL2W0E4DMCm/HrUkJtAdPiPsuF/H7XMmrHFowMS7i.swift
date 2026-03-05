//
//  H7XMmrHFowMS7i.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/3.
//
//交易记录
import SwiftUI
import UIPilot

struct H7XMmrHFowMS7i: View {
  
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var tf8B1Q5FNFg: Bool = false //显示选择年月器
    @State private var aYPiY9lOWJ26: Date = Date() //当前时间
    @State private var eJDSJ03kdl6: [[String: Any]] = [] //钻石记录
    
//    var oy5EWB1bII: [[String: Any]] {
//        let caGr7QJGHU = Calendar.current
//        
//        return eJDSJ03kdl6.filter { item in
//            guard let time = item["createTime"] as? TimeInterval else { return false }
//            
//            let itemDate = Date(timeIntervalSince1970: time / 1000)
//            
//            let itemYear = caGr7QJGHU.component(.year, from: itemDate)
//            let itemMonth = caGr7QJGHU.component(.month, from: itemDate)
//            
//            let selectedYear = caGr7QJGHU.component(.year, from: aYPiY9lOWJ26)
//            let selectedMonth = caGr7QJGHU.component(.month, from: aYPiY9lOWJ26)
//            
//            return itemYear == selectedYear && itemMonth == selectedMonth
//        }
//    }
    
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            ZJ7h766mz(tMmEWWlfgUag: "zqyH6H230kp")
                               .frame(height: 462)
                               .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
                               .ignoresSafeArea()
            VStack(spacing:36){
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            pilot.pop()
                        }
                    Text("Record")
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                    HStack(spacing:7.5){
                        ZJ7h766mz(tMmEWWlfgUag: "rZ12Y8OxxdNT6")
                                           .frame(width: 24, height: 24)
                        Text(aYPiY9lOWJ26.micBHIsg(aIRthJHzts: "yyyy/MM"))
                            .g0LIIcoZQsOjyND9(
                                size: 14,
                                weight: .medium
                            )
                        ZJ7h766mz(tMmEWWlfgUag: "hNLKeibgwyQ")
                                           .frame(width: 24, height: 24)
                    }.frame(width: 146,height: 40)
                        .background(.white.opacity(0.15))
                        .cornerRadius(325)
                        .onTapGesture {
                            withAnimation{
                                tf8B1Q5FNFg = true
                            }
                        }

                }
                //钻石icon
                ScrollView(showsIndicators: false){
                    VStack(spacing:16){
                        ForEach(eJDSJ03kdl6.indices, id: \.self) { index in
                            let item = eJDSJ03kdl6[index]
                            let date = Date(timeIntervalSince1970: TimeInterval(item.int("createTime")) / 1000)
                            let value = item.int("costNum")
                            VStack(spacing:16){
                                HStack(spacing:16){
                                    ZJ7h766mz(tMmEWWlfgUag: "nTRZMGM43EhuR")
                                       .frame(width: 24, height: 24)
                                    VStack(alignment: .leading, spacing: 7){
                                        Text(item.string("remark"))
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 16,
                                                            weight: .semibold
                                                        )
                                        Text(date.micBHIsg(aIRthJHzts: "yyyy-MM-dd HH:mm:ss"))
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 14,
                                                            weight: .regular,
                                                            color: .white.opacity(0.6)
                                                        )
                                    }
                                    Spacer()
                                    Text(value > 0 ? "+\(value)" : "-\(value)")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .medium,
                                            color: value > 0 ? Color(red: 135/255, green: 255/255, blue: 94/255) :
                                                Color(red: 255/255, green: 92/255, blue: 89/255)
                                        )
                                }
                                if index != eJDSJ03kdl6.count - 1 {
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.15))
                                            .frame(height: 1)
                                            .frame(maxWidth: .infinity)
                                    }
                            }
                        }
                    }
                }
                
                
            }.padding(.horizontal,16)
            
            if tf8B1Q5FNFg {
                BirthdayBottomSheet(
                    isPresented: $tf8B1Q5FNFg,
                    initialDate: aYPiY9lOWJ26,
                    mode: .yearMonth
                ) { selected in
                    print(aYPiY9lOWJ26)
                    print(selected)
                    if(aYPiY9lOWJ26 != selected){
                        loK18F8L2QLad()
                    }
                    aYPiY9lOWJ26 = selected
                    withAnimation(.spring()) {
                        tf8B1Q5FNFg = false
                    }
                }
            }
        }.onAppear{
            loK18F8L2QLad()
            
        }
    }
    func loK18F8L2QLad(){
        Task{
            EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
            eJDSJ03kdl6 = try await bRW4jX3umRIh(yCvCoRXOXp: aYPiY9lOWJ26.micBHIsg(aIRthJHzts: "yyyy-MM-01"))
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        }
    }
}
