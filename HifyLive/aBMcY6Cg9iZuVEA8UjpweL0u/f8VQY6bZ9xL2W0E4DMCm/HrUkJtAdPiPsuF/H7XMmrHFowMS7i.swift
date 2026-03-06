

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
//交易记录
import SwiftUI
import UIPilot

struct H7XMmrHFowMS7i: View {
  
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var tf8B1Q5FNFg: Bool = false //显示选择年月器
    @State private var aYPiY9lOWJ26: Date = Date() //当前时间
    @State private var eJDSJ03kdl6: [[String: Any]] = [] //钻石记录
    @State private var qC1X7kL8Z1R: Int = 1 //分页
    @State private var Wm9xLoadMore: Bool = true // 是否还有更多
    @State private var isLoadingMore: Bool = false // 是否正在加载
    @State private var isAtBottom = false //是否到底
    
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
                //start
                if eJDSJ03kdl6.isEmpty {
                    LQ0Z4A6C9emp()
                }
                ScrollView(showsIndicators: false){
                    VStack(spacing:16){
                        ForEach(eJDSJ03kdl6.indices, id: \.self) { index in
                            let item = eJDSJ03kdl6[index]
                            let date = Date(timeIntervalSince1970: TimeInterval(item.int("createTime")) / 1000)
                            let value = item.int("costNum")
                            LazyVStack(spacing:16){
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
                                }.background(
                                    GeometryReader { geo in
                                        Color.clear
                                            .onAppear {
                                                if index == eJDSJ03kdl6.count - 1 {
                                                    isAtBottom = true
                                                }
                                            }
                                            .onDisappear {
                                                if index == eJDSJ03kdl6.count - 1 {
                                                    isAtBottom = false
                                                }
                                            }
                                    }
                                )
                                if index != eJDSJ03kdl6.count - 1 {
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.15))
                                            .frame(height: 1)
                                            .frame(maxWidth: .infinity)
                                    }
                            }
                        }
                               if isLoadingMore {
                                   ProgressView()
                                       .tint(.white)
                                       .scaleEffect(1.4)
                               }

                    }
                }.simultaneousGesture (
                    DragGesture()
                           .onChanged { value in
                               let verticalDelta = value.translation.height
                               if verticalDelta < 0 {
                                   if isAtBottom && verticalDelta < -120 && !isLoadingMore {
                                       N8QLoadMore()
                                   }
                               }
                           }

               )
                //end
                
                
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
    //查记录
    func loK18F8L2QLad(){

        qC1X7kL8Z1R = 1
        Wm9xLoadMore = true

        Task{
            EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()

            let data = try await bRW4jX3umRIh(
                kQ6F7mX3: qC1X7kL8Z1R,
                yCvCoRXOXp: aYPiY9lOWJ26.micBHIsg(aIRthJHzts: "yyyy-MM-01")
            )

            eJDSJ03kdl6 = data

            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        }
    }
    
    //加载更多
    func N8QLoadMore() {
        
        if !Wm9xLoadMore { return }
        if isLoadingMore { return }

        isLoadingMore = true
        qC1X7kL8Z1R += 1
        
        Task{
            do{
                let more = try await bRW4jX3umRIh(
                    kQ6F7mX3: qC1X7kL8Z1R,
                    yCvCoRXOXp: aYPiY9lOWJ26.micBHIsg(aIRthJHzts: "yyyy-MM-01")
                )
                
                if more.isEmpty {
                    Wm9xLoadMore = false
                } else {
                    eJDSJ03kdl6.append(contentsOf: more)
                }
                
            }catch{
                print(error)
            }
            
            isLoadingMore = false
        }
    }
}
