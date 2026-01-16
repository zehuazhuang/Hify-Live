

//message模块
import SwiftUI

struct J9L2X1pF8D5ms: View {
    @State private var indices = Array(0..<4)
    
    var body: some View {
        ZStack{
            VStack(spacing:4){
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing:16){
                        ForEach(0..<4){index in
                            AqS7C1A2tLt()
                        }
                        Spacer()
                        
                        VStack{
                            ZJ7h766mz(tMmEWWlfgUag: "mM3S8q9A2Co")
                                .frame(width: 56, height: 56)
                            Text("More")
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular,
                                    color: .white.opacity(0.6)
                                )
                        }
                    }
                }.padding(.horizontal,16)
                // ScrollView{
                VStack{
                    HStack(spacing:10){
                        ZJ7h766mz(tMmEWWlfgUag: "tLZ71tLM433")
                            .frame(width: 48, height: 48)
                        VStack(alignment:.leading,spacing:3){
                            Text("Platform")
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular
                                )
                            Text("Congratulations! Your VIP ...")
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular,
                                    color: .white.opacity(0.6)
                                )
                        }
                        Spacer()
                        
                        VStack{
                            Text("10-09")
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular,
                                    color: .white.opacity(0.6)
                                )
                            Spacer()
                            ZJ7h766mz(tMmEWWlfgUag: "rX2M9V3aL8P")
                                .frame(width: 28, height: 20)
                        }.frame(width: 35,height: 48)
                        
                        
                    }.frame(height: 76)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal,16)
                        .background(
                            LinearGradient(
                                colors: [Color(red: 120 / 255,green: 223 / 255,blue: 255 / 255,opacity: 0.1
                                              ), Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,opacity: 0.15)], startPoint: .leading, endPoint: .trailing)
                        )
                }
                List{
                    ForEach(0..<4){index in
                        tD4C1N7pR6Sli()
                            .padding(.vertical, 4)
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    if let i = indices.firstIndex(of: index) {
                                        indices.remove(at: i)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }.listStyle(.plain)
                    .background(Color.clear)
                
                
            }
            
        }
    }
}
