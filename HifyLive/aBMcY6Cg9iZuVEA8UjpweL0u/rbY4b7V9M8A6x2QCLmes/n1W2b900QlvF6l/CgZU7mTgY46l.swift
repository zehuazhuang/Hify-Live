
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
        @StateObject private var keyboard = KeyboardResponder()
        @Environment(\.router) var rM9Z8S7A1ql
        

        init(session: NIMSession) {
            self.session = session
            _vm = StateObject(wrappedValue: ChatViewModel(session: session))
        }

        var body: some View {
            ZStack {
                Color(red: 13/255, green: 13/255, blue: 18/255)
                    .ignoresSafeArea()
                
                ZJ7h766mz(tMmEWWlfgUag: "e6W4Zx7QYbEL")
                    .scaledToFill()
                    .frame(height: 462)
                    .frame(maxWidth: .infinity, maxHeight: .infinity,alignment:.top)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    // 顶部导航...
                    HStack {
                        // 左侧关闭按钮
                        Button {
                            rM9Z8S7A1ql.dismissScreen()
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                                .frame(width: 24, height: 24)
                        }
                        
                        Spacer()
                        
                        // 中间标题
                        HStack {
                            ZJ7h766mz(tMmEWWlfgUag: "zxM23M2tC38")
                                .frame(width: 10, height: 10)
                            Text("MadrigalXX1")
                                .g0LIIcoZQsOjyND9(size: 16, weight: .regular)
                        }
                        
                        Spacer()
                        
                        // 右侧按钮
                        Button {
                            
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "sJ6642gr1JlL1jH")
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal,16)
                    .padding(.bottom,23)
                    
                    
                    ZStack{
                        ZJ7h766mz(tMmEWWlfgUag: "kY9WxQ2W4L")
                                           .frame(height: 140)
                                           .frame(maxWidth: .infinity)
                        
                        VStack{
                            HStack{
                                ZStack{
                                    ZJ7h766mz(tMmEWWlfgUag: "jbZ38Z9M43").frame(width: 44, height: 44)
                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
                                        .frame(width: 40,height: 40)
                                        .clipShape(Circle())
                                }.frame(width: 44, height: 44)
                                VStack(alignment:.leading){
                                    Text("MadrigalXX1 ")
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 16,
                                                        weight: .regular
                                                    )
                                    HStack{
                                        ZJ7h766mz(tMmEWWlfgUag: "aSUqulEy").frame(width: 24, height: 24)
                                        Text("30")
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 14,
                                                            weight: .regular
                                                        )
                                        Text("|")
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 14,
                                                            weight: .regular,
                                                            color: .white.opacity(0.4)
                                                        )
                                                        .padding(.horizontal,4)
                                        //改成国家图标
                                        ZJ7h766mz(tMmEWWlfgUag: "aSUqulEy").frame(width: 16, height: 16)
                                        
                                    }
                                }
                                Spacer()
                                
                                ZJ7h766mz(tMmEWWlfgUag: "d2ax6W4EYC8L").frame(width: 48, height: 33)
                            }
                            HStack(spacing:5){
                                ForEach(0..<4){index in
                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.hnhily.link/00000000/20251120/829e480b33a24006a4bc7b21b53153ba.jpeg")
                                        .frame(width: 68,height: 52)
                                        .cornerRadius(8)
                                }
                                Spacer()
                            }
                            
                        }.padding(.horizontal,16)
                        
                    }.frame(height: 140)
                     .frame(maxWidth: .infinity)
                     .padding(.horizontal,16)
                     .padding(.bottom,16)
                    // 消息列表
                    ChatTableView(vm: vm, keyboardHeight: keyboard.keyboardHeight)
                       
                        .background(Color.clear)
                        .onTapGesture { isInputFocused = false }
                    
                    // 底部输入框
                        VStack {
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
                                        .font(
                                            JqA1kMoFobuvplkZO5w4FWsenOf
                                                .yVvo9b0xKtZE0(
                                                    gpMpmhPhxS73zlFX24e2W5x8ZNX6q: 16,
                                                    iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: .regular
                                                )
                                        )
                                        .foregroundColor(.white)
                                }
                                .frame(height: 40)
                                
                                ZJ7h766mz(tMmEWWlfgUag: "qS9A1C2tLse")
                                    .frame(width: 36, height: 36)
                                    .onTapGesture {
                                        vm.sendText()
                                    }
                            }
                            .padding(.leading, 16)
                            .padding(.trailing, 4)
                            .frame(height: 46)
                            .background(Color(red: 34/255, green: 34/255, blue: 38/255))
                            .cornerRadius(24)
                            .padding(.bottom, 6)
                            
                            HStack(spacing: 40) {
                                // 图片按钮
                                ZJ7h766mz(tMmEWWlfgUag: "t9A8E2C6QZxY")
                                    .frame(width: 32, height: 32)
                                
                                ZJ7h766mz(tMmEWWlfgUag: "jiCL7W4M0L")
                                    .frame(width: 32, height: 32)
                                
                                ZJ7h766mz(tMmEWWlfgUag: "liM7Z8E0Yx9A6")
                                    .frame(width: 32, height: 32)
                            }
                        }.padding(.horizontal,16)
                        .animation(.easeOut(duration: 0.25), value: keyboard.keyboardHeight)
                    }
                //end 底部输入框
                
                
            }
            .onAppear { vm.loadHistory() }
        }
    }


class KeyboardResponder: ObservableObject {
    @Published var keyboardHeight: CGFloat = 0
    
    init() {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        let willChange = NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        
        willShow.merge(with: willHide, willChange)
            .sink { [weak self] notification in
                guard let self = self else { return }
                
                let frame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
                let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0.25
                let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? UInt ?? 0
                
                let height = notification.name == UIResponder.keyboardWillHideNotification ? 0 : frame.height
                
                // ✅ 动画同步键盘
                UIView.animate(withDuration: duration, delay: 0,
                               options: UIView.AnimationOptions(rawValue: curve << 16),
                               animations: {
                                   self.keyboardHeight = height
                               }, completion: nil)
            }
            .store(in: &cancellables)
    }
    
    private var cancellables = Set<AnyCancellable>()
}
