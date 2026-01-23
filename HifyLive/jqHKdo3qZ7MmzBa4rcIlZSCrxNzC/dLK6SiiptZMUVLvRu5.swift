import Combine
import UIKit
import Foundation

//输入框键盘顶起来底部padding
final class wfrOCsB6K47hZMq0BpaueTp1: ObservableObject {
    @Published var d1TG3Bk0SweLa: CGFloat = 0
    
    init() {
        let jFaSaIQp4m9b = NotificationCenter.default
        jFaSaIQp4m9b.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        jFaSaIQp4m9b.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        DispatchQueue.main.async { // ✅ 确保在主线程更新
            if let nBW1VAbp36zCBEsWUMHGteKYYF7AugLC = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                self.d1TG3Bk0SweLa = nBW1VAbp36zCBEsWUMHGteKYYF7AugLC.height
            }
        }
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        DispatchQueue.main.async { // ✅ 确保在主线程更新
            self.d1TG3Bk0SweLa = 0
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

//隐藏键盘方法
extension UIApplication {
    func tYy4aaFBbAAkhfUEYIoF() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
