//搜索页面
import SwiftUI
import SwiftfulRouting

struct QsS1CqA9M8tL2fs: View {
    @State private var q2C4Mtl3iNa: String = ""
    @State private var iZQ7xV4bM8Ys: Bool = false
    @State private var tsteadySelect: Bool = true
    @Environment(\.router) var rM9Z8S7A1ql
    @State private var piaoncapType: Int = 1 //0历史 1房间 2用户
    @State private var searchResults: [[String: Any]] = []
    @State private var isZ8Q7x4bV9Y0A2: Bool = true
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
                   
                    sZ4V2b7EALDWCou(
                        q2C4Mtl3iNa: $q2C4Mtl3iNa,
                        i6L2M4Yai0s: $iZQ7xV4bM8Ys, on8M9xY6Q0: {velogranText in
                           
                            
                            Task { @MainActor in
                                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                                do {
                                    let results = try await hifySearch(type: piaoncapType, searchValue: q2C4Mtl3iNa)
                                       searchResults = results
                                    print("------搜索---")
                                    print(results)
                                    if(searchResults.isEmpty){
                                        isZ8Q7x4bV9Y0A2 = false
                                    }else{
                                        isZ8Q7x4bV9Y0A2 = true
                                    }
                                    
                                   } catch {
                                       EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                       print(error)
                                   }
                                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                
                               
                                }
                            
                        }
                    )
                  
                }
                HStack(){
                    ZStack{
                        Text("H0mDYXXNCqE/eka4W9EdDg==".bFHEatcgE4zzU9TCfDonsu())
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
                            searchResults = []
                            tsteadySelect = true
                            
                        }
                    }
                    Spacer()
                    ZStack{
                        Text("WWLXeMc2FstL2loM2FhSVg==".bFHEatcgE4zzU9TCfDonsu())
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
                            searchResults = []
                            piaoncapType = 2
                            tsteadySelect = false
                            
                        }
                    }
                }.padding(.top,15)
                 .padding(.horizontal,47)
                
                HStack{
                    Text(piaoncapType == 0 ? "Search History" : "Search Results")
                                    .g0LIIcoZQsOjyND9(
                                        size: 16,
                                        weight: .medium
                                    )
                    Spacer()
                }.padding(.bottom,8)
                ScrollView{
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
                                            .id(UUID())
                                            .onTapGesture {
                                                rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                        LE0xQZ6Y7WC8iv(channelName: "", localUid: UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")),
                                                                       zA9Y4W6LUid: UInt(item.int("userId")))
                                                    }
                                                }
                                            }
                                    } else {
                                        huV9C6xA8M4us(lsegaUs: item, gpiemeSele: q2C4Mtl3iNa)
                                            .id(UUID())
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
    }
}









