//聊天单个list

import SwiftUI
import NIMSDK
import Combine
struct tD4C1N7pR6Sli: View {
    @ObservedObject var rN1Z8mR: CachedRecentSession
    let onTap: (CachedRecentSession) -> Void
    

    var body: some View {
        let sXQUGIrFOr = rN1Z8mR.sessionId == "video-sky-test"
        HStack(spacing:10){
            ZStack{
                if(sXQUGIrFOr) {
                    ZJ7h766mz(tMmEWWlfgUag: "eY8bYZrPzzM")
                                       .frame(width: 48, height: 48)
                }else{
                    ZStack{
                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: rN1Z8mR.avatarUrl)
                                               .frame(width: 44, height: 44)
                                               .clipShape(Circle())
                                               .allowsHitTesting(false)
                        
                    }.frame(width: 48, height: 48)
                        .background(.white.opacity(0.1))
                        .clipShape(Circle())
                }
                
                //在线状态
            
                ZJ7h766mz(tMmEWWlfgUag: rN1Z8mR.isOnline ? "zxM23M2tC38" : "i7CwZ3wGTsV")
                                   .frame(width: 10, height: 10)
                                   .frame(maxWidth: .infinity,maxHeight: .infinity,alignment:.bottomTrailing)
                                   .padding(.trailing,2)
                                   .padding(.bottom,2)
            }.frame(width: 48, height: 48)
            VStack(alignment:.leading,spacing:3){
                
                Text(sXQUGIrFOr ? "Platform" : rN1Z8mR.nickname)
                                    .g0LIIcoZQsOjyND9(
                                        size: 16,
                                        weight: .medium
                                    )
                Text(sXQUGIrFOr ? "Top-up successful! \(rN1Z8mR.lastMessageText) Diamonds has been credited to your account. " : rN1Z8mR.lastMessageText)
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
                        if(sXQUGIrFOr) {
                            ZJ7h766mz(tMmEWWlfgUag: "pCK3TVVxu")
                                               .frame(width: 28, height: 20)
                        }else{
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
                        
                    }
                }.frame(height: 48)
           
            
        }.frame(height: 76)
        .frame(maxWidth: .infinity)
        .padding(.horizontal,16)
        .contentShape(Rectangle())
        .onTapGesture { onTap(rN1Z8mR) }
        
    }
}

