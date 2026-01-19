
import SwiftUI
import NIMSDK
import SwiftfulRouting
import Combine
//CgZU7mTgY46l
//私聊页
struct CgZU7mTgY46l: View {

    let session: NIMSession
    @StateObject private var vm: ChatViewModel
    @FocusState private var isInputFocused: Bool

    init(session: NIMSession) {
        self.session = session
        _vm = StateObject(wrappedValue: ChatViewModel(session: session))
    }
    @Environment(\.router) var rM9Z8S7A1ql
    @State private var keyboardHeight: CGFloat = 0

    var body: some View {
        ZStack{
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            VStack{
                ZJ7h766mz(tMmEWWlfgUag: "e6W4Zx7QYbEL")
                    .scaledToFill()
                    .frame(height: 462)
                    .frame(maxWidth: .infinity)
                Spacer()
            }.ignoresSafeArea()
            VStack {
                HStack{
                    Button {
                        rM9Z8S7A1ql.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    Spacer()
                    HStack{
                        ZJ7h766mz(tMmEWWlfgUag: "zxM23M2tC38")
                                           .frame(width: 10, height: 10)
                        Text("MadrigalXX1 ")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .regular
                                        )
                    }
                    Spacer()
                    Button {
                       
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "sJ6642gr1JlL1jH")
                            .frame(width: 24,height: 24)
                    }
                }
                // MARK: 消息列表
                                ScrollViewReader { proxy in
                                    ScrollView(showsIndicators:false) {
                                        LazyVStack(spacing: 8) {
                                            ForEach(vm.messages, id: \.messageId) { msg in
                                                HStack {
                                                    if msg.isOutgoingMsg {
                                                        Spacer()
                                                        Text(msg.text ?? "")
                                                            .padding(8)
                                                            .background(Color.blue)
                                                            .cornerRadius(8)
                                                            .foregroundColor(.white)
                                                    } else {
                                                        Text(msg.text ?? "")
                                                            .padding(8)
                                                            .background(Color.gray.opacity(0.2))
                                                            .cornerRadius(8)
                                                        Spacer()
                                                    }
                                                }
                                                .id(msg.messageId)
                                            }
                                        }
                                        .padding(.top, 8)
                                        .padding(.bottom, 8)
                                    }
                                    .onChange(of: vm.messages.count) { _ in
                                        scrollToBottom(proxy: proxy)
                                    }
                                }

                HStack {
                    ZStack(alignment: .leading) {
                       
                        if vm.inputText.isEmpty {
                            Text("Type a message...")
                                            .g0LIIcoZQsOjyND9(
                                                size: 16,
                                                weight: .regular,
                                                color: .white.opacity(0.4)
                                            )
                        }

                        TextField("", text: $vm.inputText)
                            .focused($isInputFocused)
                            .submitLabel(.send)
                            .onSubmit {
                                    if !vm.inputText.isEmpty {
                                        vm.sendText()
                                    }
                                }
                            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(
                                        gpMpmhPhxS73zlFX24e2W5x8ZNX6q: 16,
                                        iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: .regular
                                    ))
                            .foregroundColor(.white)
                            
                    }
                    .frame(height: 40)


                    ZJ7h766mz(tMmEWWlfgUag: "qS9A1C2tLse")
                        .frame(width: 36, height: 36)
                        .onTapGesture {
                            vm.sendText()
                        }
                }
                .padding(.leading,16)
                .padding(.trailing,4)
                .frame(height: 46)
                .background(Color(red: 34/255, green: 34/255, blue: 38/255))
                .cornerRadius(24)
                .padding(.bottom,6)
                
            }.padding(.horizontal,16)
            .onAppear {
                vm.loadHistory()
            }
        }.onTapGesture {
            isInputFocused = false
        }
    }
    private func scrollToBottom(proxy: ScrollViewProxy) {
        if let last = vm.messages.last {
            withAnimation(.easeOut(duration: 0.25)) {
                proxy.scrollTo(last.messageId, anchor: .bottom)
            }
        }
    }
    
}
