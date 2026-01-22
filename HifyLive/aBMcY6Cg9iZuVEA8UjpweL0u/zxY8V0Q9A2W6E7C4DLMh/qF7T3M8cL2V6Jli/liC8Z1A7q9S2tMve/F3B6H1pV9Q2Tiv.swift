import SwiftUI
import SwiftfulRouting

struct LiveRoomPage: View {
    @State private var channelId: String
    @State private var rtcToken: String? = nil
    @Environment(\.router) var router
    private let uid: UInt =  UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId"))

    init(channelId: String) {
        _channelId = State(initialValue: channelId)
    }

    var body: some View {
        ZStack {
            if let token = rtcToken {
                LiveViewControllerWrapper(channelId: channelId, rtcToken: token, uid: uid)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    HStack {
                        Spacer()
                        Button(action: { router.dismissScreen() }) {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .frame(width: 32, height: 32)
                        }
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
            } else {
                ProgressView("正在获取直播信息…")
                    .onAppear {
                        fetchRtcToken()
                    }
            }
        }
    }

    private func fetchRtcToken() {
        Task {
            do {
                let result = try await getRtctoken()
                if let data = result["result"] as? [String: Any],
                   let token = data["rtcToken"] as? String,
                   let channelFromServer = data["channelId"] as? String {
                   
                    await MainActor.run {
                        self.rtcToken = token
                        self.channelId = channelFromServer
                    }

                    print("获取 token 成功, channelId: \(channelFromServer)")
                }
            } catch {
                print("获取 rtcToken 失败:", error)
            }
        }
    }
}
