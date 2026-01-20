
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
        @StateObject private var keyboard = KeyboardResponder() // ✅ 声明键盘监听
        @Environment(\.router) var rM9Z8S7A1ql
        

        init(session: NIMSession) {
            self.session = session
            _vm = StateObject(wrappedValue: ChatViewModel(session: session))
        }

        var body: some View {
            ZStack {
                Color(red: 13/255, green: 13/255, blue: 18/255)
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

                    // 消息列表
                    ChatTableView(vm: vm, keyboardHeight: keyboard.keyboardHeight)
                        .background(Color.clear)
                        .onTapGesture { isInputFocused = false }
                }

                // 底部输入框
                VStack {
                    Spacer()
                    HStack {
                        TextField("Type a message...", text: $vm.inputText)
                            .focused($isInputFocused)
                            .padding(.horizontal)
                            .padding(.vertical, 10)
                            .background(Color(red: 34/255, green: 34/255, blue: 38/255))
                            .cornerRadius(24)

                        Button {
                            vm.sendText()
                        } label: {
                            Image(systemName: "arrow.up.circle.fill")
                                .font(.system(size: 36))
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal)
                    
                    .animation(.easeOut(duration: 0.25), value: keyboard.keyboardHeight)
                }
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
