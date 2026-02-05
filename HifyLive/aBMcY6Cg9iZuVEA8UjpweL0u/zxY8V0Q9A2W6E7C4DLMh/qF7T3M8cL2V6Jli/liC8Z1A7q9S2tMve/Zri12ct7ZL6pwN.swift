
import Combine

// ✅ 全局直播管理
class LiveSessionManager: ObservableObject {
    static let shared = LiveSessionManager() // 单例

    @Published var currentChannelUserId: UInt = 0 // 当前观看直播间 id
}
