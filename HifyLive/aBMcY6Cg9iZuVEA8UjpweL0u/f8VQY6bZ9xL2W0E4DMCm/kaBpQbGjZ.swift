import SwiftUI
import UIPilot

//关注/粉丝列表
struct kaBpQbGjZ: View {
    let c8WYppF6mHU : Int // 3 关注 2 粉丝
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var q2C4Mtl3iNa: String = "" //搜索文本
    @State private var IwxP0B12Text: String = ""
    @State private var iZQ7xV4bM8Ys: Bool = false
    @State private var wX6DaMQPResults: [[String: Any]] = [] //搜索数据
    @State private var filteredResults: [[String: Any]] = [] //过滤数据
    @State private var xI87npb7lB: Bool = false //弹取关
    @State private var xH4Gfw7C: Int = -1 //弹框坐标用户
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            VStack{
                HStack(spacing:0){
                    Button {
                        pilot.pop()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    .padding(.trailing,12)
                    .contentShape(Rectangle())
                    Text(c8WYppF6mHU == 3 ? "Following" : "Followers")
                                    .g0LIIcoZQsOjyND9(
                                        size: 16,
                                        weight: .semibold
                                    )
                    Spacer()

                    
                }
                sZ4V2b7EALDWCou(
                    q2C4Mtl3iNa: $q2C4Mtl3iNa,
                    i6L2M4Yai0s: $iZQ7xV4bM8Ys, on8M9xY6Q0: {velogranText in
                        IwxP0B12Text = velogranText
                        filterData(keyword: velogranText)
                    },
                    hQqgApVK1Qn:{
                        filteredResults = wX6DaMQPResults
                    }
                )
                Spacer().frame(height: 20)
                
                if filteredResults.isEmpty {
                    LQ0Z4A6C9emp()
                    Spacer()
                }else{
                    ScrollView(showsIndicators: false){
                        LazyVStack(spacing:12){
                            ForEach(filteredResults.indices, id: \.self) { index in
                                let item = filteredResults[index]
                                UDGjeLeI2bL7H(hXDX98TXUs: item, iCHzYzK6: IwxP0B12Text,ondZKTQ307nh:{
                                    withAnimation{
                                        xI87npb7lB = true
                                        xH4Gfw7C = index
                                    }
                                })
                                .id(UUID())
                                .onTapGesture {
                                 
                                    pilot.push(.itHCfaKsRUser(areoloaUid: item.int("userId")))
                                    
                                }
                            }
                        }
                    }
                }
                
            }.padding(.horizontal,16)
            
            
            if xI87npb7lB {
                W9MZC6xA7Q8Y4L(avatarURL: filteredResults[xH4Gfw7C].string("icon"), nickname: filteredResults[xH4Gfw7C].string("nickname"),onClose:{
                    xI87npb7lB = false
                },
                onUnfollow:{
                    
                    Task {
                                do {
                                    let isA2C6WEL = try await fol6W9ZQ4xC2(
                                        uY2M8A4E7C0xL: filteredResults[xH4Gfw7C].int("userId"),
                                        iA6M7W9EYL0: 2
                                    )
                                    
                                    if(isA2C6WEL){
                                        
                                        filteredResults[xH4Gfw7C]["followed"] = 0
                                    }
                                    
                                } catch {
                                    print( error)
                                }
                            }
                }
                )
            }
        }.onTapGesture {
            iZQ7xV4bM8Ys = false
        }
        
        .onAppear() {
            Task {
                
                defer {
                    EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                }

                do {
                    EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt() // 开启加载
                    let data = try await rEh36ZSearch(ovlkoBKType: c8WYppF6mHU)
                    wX6DaMQPResults = data
                    filteredResults = data
                } catch {
                    print(error)
                    
                }
            }
        }
    }
    
    func filterData(keyword: String) {
        let text = keyword.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // 搜索为空 → 还原
        guard !text.isEmpty else {
            filteredResults = wX6DaMQPResults
            return
        }

        filteredResults = wX6DaMQPResults.filter { item in
            let nickname = item["nickname"] as? String ?? ""
            let userId = String(item["userId"] as? Int ?? 0)

            return nickname.localizedCaseInsensitiveContains(text)
                || userId.contains(text)
        }
    }
}
