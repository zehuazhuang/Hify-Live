//聊天单个list

import SwiftUI
struct tD4C1N7pR6Sli: View {
    var body: some View {
        HStack(spacing:10){
            ZStack{
                ZStack{
                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
                                       .frame(width: 44, height: 44)
                                       .clipShape(Circle())
                }.frame(width: 48, height: 48)
                    .background(.white.opacity(0.1))
                    .clipShape(Circle())
                ZJ7h766mz(tMmEWWlfgUag: "zxM23M2tC38")
                                   .frame(width: 10, height: 10)
                                   .frame(maxWidth: .infinity,maxHeight: .infinity,alignment:.bottomTrailing)
                                   .padding(.trailing,2)
                                   .padding(.bottom,2)
            }.frame(width: 48, height: 48)
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
                                ).lineLimit(1)
                                .truncationMode(.tail)
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
                    Text("2")
                        .g0LIIcoZQsOjyND9(
                            size: 14,
                            weight: .regular
                        )
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(
                            Circle()
                                .fill(Color.red)
                        )
                    
                }.frame(width: 35,height: 48)
           
            
        }.frame(height: 76)
        .frame(maxWidth: .infinity)
        .padding(.horizontal,16)
        .background(
            LinearGradient(
                colors: [Color(red: 120 / 255,green: 223 / 255,blue: 255 / 255,opacity: 0.06
                              ), Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,opacity: 0.05)], startPoint: .leading, endPoint: .trailing)
        )
    }
}
