
import SwiftUI

struct LiveViewControllerWrapper: UIViewControllerRepresentable {

    let channelId: String
    let rtcToken: String
    let uid: UInt

    func makeUIViewController(context: Context) -> LiveViewController {
        let vc = LiveViewController()
        vc.channelId = channelId
        vc.rtcToken = rtcToken
        vc.uid = uid
        return vc
    }

    func updateUIViewController(
        _ uiViewController: LiveViewController,
        context: Context
    ) {}
}



