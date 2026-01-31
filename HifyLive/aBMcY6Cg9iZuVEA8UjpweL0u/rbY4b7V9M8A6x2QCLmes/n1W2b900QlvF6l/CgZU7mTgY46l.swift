
import SwiftUI
import NIMSDK
import SwiftfulRouting
import Combine
//CgZU7mTgY46l
//私聊页
struct CgZU7mTgY46l: View {
    let opponentAvatarURL: String
    let session: NIMSession
        @StateObject private var vm: ChatViewModel
        @FocusState private var isInputFocused: Bool
        @StateObject private var keyboard = KeyboardResponder()
        @Environment(\.router) var rM9Z8S7A1ql
        @State private var opponentInfo: [String: Any] = [:] //对方信息
    
        @State private var showImagePicker = false
        @State private var selectedImage: UIImage?
        @State private var showCameraPicker = false
    
        @State private var isw8UhB9Gj8t = false //显示举报
    

            init(session: NIMSession, opponentAvatarURL: String) {
            self.session = session
            self.opponentAvatarURL = opponentAvatarURL


            // 然后再用它初始化 StateObject
            _vm = StateObject(wrappedValue: ChatViewModel(
                session: session,
                myAvatarURL: IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7["icon"] as? String ?? "",
                opponentAvatarURL: opponentAvatarURL
            ))
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
                            //在线状态
//                            ZJ7h766mz(tMmEWWlfgUag: "zxM23M2tC38")
//                                .frame(width: 10, height: 10)
                            Text(opponentInfo.string("nickname"))
                                .g0LIIcoZQsOjyND9(size: 16, weight: .regular)
                        }
                        
                        Spacer()
                        
                        // 右侧按钮
                        Button {
                         
                            withAnimation{
                                isw8UhB9Gj8t = true
                            }
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "sJ6642gr1JlL1jH")
                                .frame(width: 24, height: 24)
                        }
                    }
                    .padding(.horizontal,16)
                    .padding(.bottom,23)
                    
                    
                    // 消息列表
                    ChatTableView(opponentInfo: opponentInfo, vm: vm, keyboardHeight: keyboard.keyboardHeight, onAvatarTap: { uid in
                        rM9Z8S7A1ql.showScreen(.fullScreenCover) { _ in
                            WUjfoptOKs8pZfhSAH0duplG {
                                zQIRqHb1rSOJJ0wopZa8qxCs(areoloaUid: uid)
                            }
                        }
                    })
                        
                        .padding(.horizontal,10)
                        .background(Color.clear)
                        
                    
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
                                    
                                    NoResignTextField(text: $vm.inputText, isFocused: $isInputFocused,
                                                      onSend: {
                                                              if !vm.inputText.isEmpty {
                                                                  vm.sendText()
                                                              }
                                                          }
                                    )
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
                                    .onTapGesture {
                                        showImagePicker = true
                                    }
                                    .sheet(isPresented: $showImagePicker) {
                                        ImagePicker(image: $selectedImage)
                                    }
                                    .onChange(of: selectedImage) { img in
                                        if let img {
                                            vm.sendImage(img)
                                        }
                                    }
                                
                                //调用摄像头拍照
                                ZJ7h766mz(tMmEWWlfgUag: "jiCL7W4M0L")
                                    .frame(width: 32, height: 32)
                                    .onTapGesture {
                                            showCameraPicker = true
                                        }
                                    .fullScreenCover(isPresented: $showCameraPicker) {
                                            CameraPicker(image: $selectedImage)
                                            .ignoresSafeArea()
                                        }
                                        
                                
                                ZJ7h766mz(tMmEWWlfgUag: "liM7Z8E0Yx9A6")
                                    .frame(width: 32, height: 32)
                            }
                        }.padding(.horizontal,16)
                        .animation(.easeOut(duration: 0.25), value: keyboard.keyboardHeight)
                    }
                //end 底部输入框
                
                if isw8UhB9Gj8t {
                    QiRKOWGBnovrlh(ish1z8TllyFvb: $isw8UhB9Gj8t, ihQ5ReMsh3Uid: opponentInfo.int("userId"))
                }
            }
            .onAppear {
                vm.loadHistory()
                Task {
                    opponentInfo = await T0viKk.wSremNeLspPkPRHBJnlVCs5w.ngI7Y2A8C4E0ZQ9W6xL(
                                   wTEEJpZz0iGVK: session.sessionId
                               )
                }
            }.onTapGesture {
                UIApplication.shared.endEditing()
            }
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


struct ImagePicker: UIViewControllerRepresentable {

    @Environment(\.dismiss) private var dismiss
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let img = info[.originalImage] as? UIImage {
                parent.image = img
            }
            parent.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
struct CameraPicker: UIViewControllerRepresentable {

    @Environment(\.dismiss) private var dismiss
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        picker.sourceType = .camera
        picker.cameraDevice = .rear

        // 🔥 关键，覆盖安全区域
        picker.modalPresentationStyle = .overFullScreen

        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraPicker

        init(_ parent: CameraPicker) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let img = info[.originalImage] as? UIImage {
                parent.image = img
            }
            parent.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil,
                   from: nil,
                   for: nil)
    }
}
