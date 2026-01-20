
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
    let sq8dM6yIm: String = IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7["icon"] as? String ?? ""

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
                                        LazyVStack(spacing: 16) {
                                            ForEach(vm.messages, id: \.messageId) { msg in
                                                HStack {
                                                    if msg.isOutgoingMsg {
                                                        Spacer()
                                                        HStack(spacing:8){
                                                            Text(msg.text ?? "")
                                                                            .g0LIIcoZQsOjyND9(
                                                                                size: 14,
                                                                                weight: .regular
                                                                            )
                                                                            .padding(.horizontal,16)
                                                                            .padding(.vertical,13)
                                                                            .background(
                                                                                LinearGradient(colors: [Color(
                                                                                                              red: 120 / 255,
                                                                                                              green: 223 / 255,
                                                                                                              blue: 255 / 255,
                                                                                                              opacity: 0.32
                                                                                                          ), Color(
                                                                                                              red: 84 / 255,
                                                                                                              green: 105 / 255,
                                                                                                              blue: 199 / 255,
                                                                                                              opacity: 0.25
                                                                                                          )], startPoint: .leading, endPoint: .trailing)
                                                                            )
                                                                            .clipShape(s7q2ZC1S9A4tM8L3(radius: 12, corners: [.topLeft,.bottomLeft,.bottomRight]))
                                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: sq8dM6yIm)
                                                                .frame(width: 32,height: 32)
                                                                .clipShape(Circle())
                                                        }
                                                        
                                                    } else {
                                                        HStack(spacing:8){
                                                            Text(msg.text ?? "")
                                                                            .g0LIIcoZQsOjyND9(
                                                                                size: 14,
                                                                                weight: .regular
                                                                            )
                                                                            .padding(.horizontal,16)
                                                                            .padding(.vertical,13)
                                                                            .background(
                                                                                .white.opacity(0.15)
                                                                            )
                                                                            .clipShape(s7q2ZC1S9A4tM8L3(radius: 12, corners: [.topLeft,.bottomLeft,.bottomRight]))
                                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: sq8dM6yIm)
                                                                .frame(width: 32,height: 32)
                                                                .clipShape(Circle())
                                                        }
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
