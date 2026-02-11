//搜索页面
import SwiftUI
import UIPilot


struct QsS1CqA9M8tL2fs: View {
    @State private var q2C4Mtl3iNa: String = ""
    @State private var iZQ7xV4bM8Ys: Bool = false
    @State private var tsteadySelect: Bool = true //
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var piaoncapType: Int = 0 //0历史 1房间 2用户
    @State private var searchResults: [[String: Any]] = []
    @State private var isZ8Q7x4bV9Y0A2: Bool = true
    @State private var searchHistory: [String] = [] //搜索框输入历史
    
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            ZJ7h766mz(tMmEWWlfgUag: "ka3h49PRef1i0")
                               .frame(height: 288)
                               .frame(maxWidth: .infinity)
                               .frame(maxHeight: .infinity,alignment: .bottom)
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
                    
                    sZ4V2b7EALDWCou(
                        q2C4Mtl3iNa: $q2C4Mtl3iNa,
                        i6L2M4Yai0s: $iZQ7xV4bM8Ys, on8M9xY6Q0: {velogranText in
                            // ✅ 写入搜索历史
                                   SearchHistoryManager.shared.add(velogranText)
                                   searchHistory = SearchHistoryManager.shared.load()
                            
                            Task {
                                await oA0T1rQLoad()
                            }
                            
                        }, hQqgApVK1Qn: {
                        }
                    )
                    
                }
                HStack(){
                    ZStack{
                        Text("dw65f4oHFXwqqr9n4fm/Eg==".bFHEatcgE4zzU9TCfDonsu()) //Rooms
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: tsteadySelect ? .black : .semibold,
                                color: tsteadySelect ?  .white : .white.opacity(0.4)
                            ).frame(maxHeight: .infinity,alignment:.top)
                        if tsteadySelect {
                            ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                .frame(width: 28, height: 12)
                                .frame(maxHeight: .infinity,alignment:.bottom)
                        }
                        
                    }
                    .frame(width: 102,height: 34)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation{
                            piaoncapType = 1
                            tsteadySelect = true
                        }
                            
                    }
                    Spacer()
                    ZStack{
                        Text("WWLXeMc2FstL2loM2FhSVg==".bFHEatcgE4zzU9TCfDonsu()) //Users
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: !tsteadySelect ? .black : .semibold,
                                color: !tsteadySelect ?  .white : .white.opacity(0.4)
                            ).frame(maxHeight: .infinity,alignment:.top)
                        
                        if !tsteadySelect {
                            ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                .frame(width: 28, height: 12)
                                .frame(maxHeight: .infinity,alignment:.bottom)
                        }
                    }
                    .frame(width: 102,height: 34)
                    .contentShape(Rectangle())
                    .onTapGesture {
                            
                        withAnimation{
                            piaoncapType = 2
                            tsteadySelect = false
                        }
                    }
                }.padding(.top,15)
                    .padding(.horizontal,47)
                if piaoncapType == 0  {
                VStack(spacing:0){
                   
                        HStack{
                            Text("Search History")
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .medium
                                )
                            Spacer()
                        }.padding(.bottom,12)
                            .padding(.top,8)
                        
                        
                        if searchResults.isEmpty{
                            FlowLayout(spacing: 8) {
                                
                                // 搜索历史
                                ForEach(searchHistory, id: \.self) { item in
                                    SearchHistoryTag(text: item)
                                        .onTapGesture {
                                            q2C4Mtl3iNa = item
                                            Task {
                                                await oA0T1rQLoad()
                                            }
                                        }
                                }
                                
                                // 清空按钮（作为最后一个 item）
                                if !searchHistory.isEmpty {
                                    Button {
                                        SearchHistoryManager.shared.clear()
                                        searchHistory.removeAll()
                                    } label: {
                                        ZJ7h766mz(tMmEWWlfgUag: "cVTpp6zUMJxU1")
                                            .frame(width: 33, height: 33)
                                    }
                                }
                            }
                        }
                    }
                }
                ScrollView(showsIndicators: false){
                    LazyVStack(spacing:12){
                        if(piaoncapType == 0){
                            
                        }else{
                            
                            if !isZ8Q7x4bV9Y0A2 {
                                LQ0Z4A6C9emp()
                                
                            }else{
                                ForEach(searchResults.indices, id: \.self) { index in
                                    let item = searchResults[index]
                                    if piaoncapType == 1 {
                                        FjNgwaDxH1fEY41(room: item, gpiemeSele: q2C4Mtl3iNa)
                                            .onTapGesture {

                                                
                                                pilot.push(.zhwyzs0gELive(localUid: UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")), zA9Y4W6LUid: UInt(item.int("userId"))))
                                            }
                                    } else {
                                        huV9C6xA8M4us(lsegaUs: item, gpiemeSele: q2C4Mtl3iNa,cF8eDIYj: {
                                            Task {
                                                await oA0T1rQLoad()
                                            }
                                        })
                                        .onTapGesture {
                                          
                                            
                                            pilot.push(.itHCfaKsRUser(areoloaUid: item.int("userId")))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }.padding(.top,8)
            }.padding(.horizontal,16)
        }
        .onAppear {
            searchHistory = SearchHistoryManager.shared.load()
        }
        .onTapGesture {
            iZQ7xV4bM8Ys = false
        }
    }
    func oA0T1rQLoad() async  {
        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
       
        Task { @MainActor in
         
            do {
                let results = try await hifySearch(type: tsteadySelect ? 1 : 2, searchValue: q2C4Mtl3iNa)
                   searchResults = results
                if(tsteadySelect){
                        piaoncapType = 1
                }else{
                        piaoncapType = 2
                }
                if(searchResults.isEmpty){
                    isZ8Q7x4bV9Y0A2 = false
                }else{
                    isZ8Q7x4bV9Y0A2 = true
                }
                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
               } catch {
                   EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                   print(error)
               }
            }
    }
}









