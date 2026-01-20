
//聊天页
import SwiftUI
import NIMSDK

struct jQp7ZL9aM8Wtm: View {
    @State private var echjeteaType: Int = 0
    let mo0LQ7DAi : () -> Void
    @ObservedObject var sessionStore = RecentSessionStore.shared
    
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            ZJ7h766mz(tMmEWWlfgUag: "e6W4Zx7QYbEL")
                .scaledToFill()
                .frame(height: 462)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                .ignoresSafeArea()
            VStack(spacing:20){
                HStack{
                    HStack(spacing:10){
                        ZStack{
                            Text("jvt4DOrKwG4ULVh/g9AJFA==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: echjeteaType == 0 ? .black : .semibold,
                                    color: echjeteaType == 0 ?  .white : .white.opacity(0.4)
                                ).frame(maxHeight: .infinity,alignment:.top)
                            if echjeteaType == 0 {
                                ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                    .frame(width: 28, height: 12)
                                    .frame(maxHeight: .infinity,alignment:.bottom)
                            }
                        }
                        .frame(width: 75,height: 34)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation{
                                echjeteaType = 0
                            }
                        }
                        ZStack{
                            Text("IbWXgE0vnY4iVq1j0/YJ1g==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 18,
                                    weight: echjeteaType == 1 ? .black : .semibold,
                                    color: echjeteaType == 1 ?  .white : .white.opacity(0.4)
                                ).frame(maxHeight: .infinity,alignment:.top)
                            
                            if echjeteaType == 1 {
                                ZJ7h766mz(tMmEWWlfgUag: "qZ1S7A9C8tL4M23")
                                    .frame(width: 28, height: 12)
                                    .frame(maxHeight: .infinity,alignment:.bottom)
                            }
                        }
                        .frame(width: 75,height: 34)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation{
                                echjeteaType = 1
                            }
                        }
                    }.padding(.top,8)
                    Spacer()
                    ZJ7h766mz(tMmEWWlfgUag: "ql76E2C6WELL")
                        .frame(width: 36, height: 36)
                        .onTapGesture {
                            mo0LQ7DAi()
                        }
                    
                }.padding(.horizontal,16)
                if (echjeteaType == 0) {
                    J9L2X1pF8D5ms()
                }else{
                    VH5N3B7tQ6fri()
                }
            }
          
        }
    }
}



