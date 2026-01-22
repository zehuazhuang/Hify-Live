//import SwiftUI
//import SwiftfulRouting
//
//struct LiveRoomPage: View {
//    let uid: UInt
//    let channelId: String
//
//    @Environment(\.router) var router
//
//    var body: some View {
//        ZStack {
//            // 直接用缓存的 token 和传入的 channelId
//            if let token = AgoraManager.shared.currentToken {
//                LiveViewControllerWrapper(
//                    channelId: channelId,
//                    rtcToken: token,
//                    uid: uid
//                )
//                .edgesIgnoringSafeArea(.all)
//
//                VStack {
//                    HStack {
//                        Spacer()
//                        Button(action: { router.dismissScreen() }) {
//                            Image(systemName: "xmark.circle.fill")
//                                .resizable()
//                                .frame(width: 32, height: 32)
//                        }
//                    }
//                    Spacer()
//                }
//                .padding(.horizontal, 16)
//            } else {
//                Text("直播信息未准备好")
//            }
//        }
//    }
//}
