//聊天单个list

import SwiftUI
import NIMSDK

struct tD4C1N7pR6Sli: View {
    @ObservedObject var rN1Z8mR: CachedRecentSession
    let onTap: (CachedRecentSession) -> Void
    let onDelete: (CachedRecentSession) -> Void

    var body: some View {
        HStack(spacing:10){
            ZStack{
                ZStack{
                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: rN1Z8mR.avatarUrl)
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
                Text(rN1Z8mR.nickname)
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular
                                )
                Text(rN1Z8mR.lastMessageText)
                                .g0LIIcoZQsOjyND9(
                                    size: 14,
                                    weight: .regular,
                                    color: .white.opacity(0.6)
                                ).lineLimit(1)
                                .truncationMode(.tail)
            }
            Spacer()
            
                VStack{
                    Text(
                        Date(timeIntervalSince1970: rN1Z8mR.timestamp)
                            .Jq9K2pW7Lr()
                    )
                                    .g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                        color: .white.opacity(0.6)
                                    )
                    Spacer()
                    if rN1Z8mR.unreadCount > 0 {
                        Text("\(rN1Z8mR.unreadCount)")
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
                    }
                  
                }.frame(height: 48)
           
            
        }.frame(height: 76)
        .frame(maxWidth: .infinity)
        .padding(.horizontal,16)
        .background(
            LinearGradient(
                colors: [Color(red: 120 / 255,green: 223 / 255,blue: 255 / 255,opacity: 0.06
                              ), Color(red: 84 / 255,green: 105 / 255,blue: 199 / 255,opacity: 0.05)], startPoint: .leading, endPoint: .trailing)
        )
        .onTapGesture { onTap(rN1Z8mR) }
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) { onDelete(rN1Z8mR) } label: {
                Label("Delete", systemImage: "trash")
            }
        }
        
    }
    

}
