import SwiftUI
import SwiftfulRouting

struct LiveRoomPage: View {
    
    @State private var channelId: String
    @State private var rtcToken: String? = nil
    @Environment(\.router) var rM9Z8S7A1ql
    private let uid: UInt = UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId"))
    
    // 自定义初始化器
        init(channelId: String) {
            _channelId = State(initialValue: channelId)
        }
    
    var body: some View {
        ZStack {
            if let token = rtcToken {
                // token 拿到后显示直播
                LiveViewControllerWrapper(
                    channelId: channelId,
                    rtcToken: token,
                    uid: uid
                )
                .edgesIgnoringSafeArea(.all)
                
                // 返回按钮
                VStack {
                    HStack {
                        Spacer()
                        ZJ7h766mz(tMmEWWlfgUag: "clL3qP6K1M")
                            .frame(width: 32, height: 32)
                            .onTapGesture {
                                rM9Z8S7A1ql.dismissScreen()
                            }
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
            } else {
                // token 未拿到时显示加载
                ProgressView("正在获取直播信息…")
                    .onAppear {
                        fetchRtcToken()
                    }
            }
            
            
        }
    }
    
    // MARK: - 异步请求 rtcToken
    private func fetchRtcToken() {
        Task {
            do {
                let result = try await getRtctoken()  // result 类型 [String: Any]
                if let data = result["result"] as? [String: Any],
                   let token = data["rtcToken"] as? String,
                   let channelFromServer = data["channelId"] as? String {

                    await MainActor.run {
                        self.rtcToken = token
                        self.channelId = channelFromServer // ⚠️ channelId 一定要用这里的
                    }
                    
                    print(channelFromServer)
                }
            } catch {
                print("获取 rtcToken 失败:", error)
            }
        }
    }
}
