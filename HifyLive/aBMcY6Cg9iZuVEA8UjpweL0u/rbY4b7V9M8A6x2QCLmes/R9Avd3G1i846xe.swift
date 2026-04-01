
//系统通知页面
import SwiftUI
import NIMSDK
import UIPilot

struct R9Avd3G1i846xe: View {
    let session: NIMSession
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @State private var messages: [NIMMessage] = []
    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
                
            ZJ7h766mz(tMmEWWlfgUag: "e6W4Zx7QYbEL")
                .scaledToFill()
                .frame(height: 462)
                .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                .ignoresSafeArea()
            
            VStack{
                HStack {
                    Button {
                        RecentSessionStore.shared.markSessionRead(sessionId: session.sessionId)
                        pilot.pop()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24, height: 24)
                    }
                    Spacer()
                        Text("Eivo Team")
                            .g0LIIcoZQsOjyND9(size: 16, weight: .regular)
                    Spacer()
                    Spacer().frame(width: 24, height: 24)
                }.padding(.bottom,23)
                
                ScrollView(showsIndicators: false){
                    VStack(spacing:24){
                        ForEach(messages,id: \.messageId){ msg in
                            VStack(alignment:.leading,spacing:16){
                                HStack{
                                    Spacer()
                                    Text(
                                        Date(timeIntervalSince1970: msg.timestamp)
                                            .Jq9K2pW7Lr()
                                    ).g0LIIcoZQsOjyND9(
                                        size: 14,
                                        weight: .regular,
                                        color: .white.opacity(0.6)
                                    )
                                    Spacer()
                                }
                                HStack(alignment: .top, spacing:8){
                                    ZJ7h766mz(tMmEWWlfgUag: "eY8bYZrPzzM")
                                                       .frame(width: 48, height: 48)
                                    if let text = msg.text, !text.isEmpty {
                                        Text("Top-up successful! \(text) Diamonds have been credited to your account.")
                                            .g0LIIcoZQsOjyND9(size: 14, weight: .regular)
                                            .padding(12)
                                            .background(
                                                Color(red: 35/255, green: 39/255, blue: 61/255),
                                            )
                                            .clipShape(s7q2ZC1S9A4tM8L3(radius: 12, corners: [.topRight,.bottomLeft,.bottomRight]))
                                    }
                                }
                            }
                        }
                    }
                }
            }.padding(.horizontal,16)
        }.onAppear{
            messages = Array((NIMSDK.shared().conversationManager.messages(in: session, message: nil, limit: 1000) ?? []).reversed())
            
            
            
        }
    }
}
