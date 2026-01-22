import SwiftUI
import AgoraRtcKit

// MARK: - SwiftUI 包装 UIViewController
struct LiveView: UIViewControllerRepresentable {
    var role: AgoraRtcKit.AgoraClientRole  // ✅ 使用 SDK 的类型
    var roomId: String
    var uid: UInt

    func makeUIViewController(context: Context) -> LiveViewController {
        let vc = LiveViewController()
        vc.role = role
        vc.roomId = roomId
        vc.uid = uid
        return vc
    }

    func updateUIViewController(_ uiViewController: LiveViewController, context: Context) {}
}
