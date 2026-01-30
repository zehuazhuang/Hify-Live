import SwiftUI
import SwiftfulRouting

//关注/粉丝列表
struct kaBpQbGjZ: View {
    let c8WYppF6mHU : Int // 3 关注 2 粉丝
    @Environment(\.router) var rM9Z8S7A1ql
    @State private var q2C4Mtl3iNa: String = "" //搜索文本
    @State private var IwxP0B12Text: String = ""
    @State private var iZQ7xV4bM8Ys: Bool = false
    @State private var wX6DaMQPResults: [[String: Any]] = []
    @State private var filteredResults: [[String: Any]] = []
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            VStack{
                HStack(spacing:0){
                    Button {
                        rM9Z8S7A1ql.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    .padding(.trailing,12)
                    .contentShape(Rectangle())
                    Text(c8WYppF6mHU == 0 ? "Following" : "Followers")
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
                                UDGjeLeI2bL7H(hXDX98TXUs: item, iCHzYzK6: IwxP0B12Text,)
                                .id(UUID())
                                .onTapGesture {
                                    rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                        WUjfoptOKs8pZfhSAH0duplG {
                                            zQIRqHb1rSOJJ0wopZa8qxCs(areoloaUid: item.int("userId"))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
            }.padding(.horizontal,16)
        }.onTapGesture {
            iZQ7xV4bM8Ys = false
        }
        
        .onAppear() {
            Task{
                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                let data = try await rEh36ZSearch(ovlkoBKType: c8WYppF6mHU)
                        wX6DaMQPResults = data
                        filteredResults = data
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
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
