
import Combine

// ✅ 全局状态管理
class LiveSessionManager: ObservableObject {
    static let shared = LiveSessionManager() // 单例

    @Published var currentChannelUserId: UInt = 0 // 当前观看直播间 id
    
    @Published var aHUdhiChZEUid: Int = 0 // 上一个用户id，用来判断是否回退
}
