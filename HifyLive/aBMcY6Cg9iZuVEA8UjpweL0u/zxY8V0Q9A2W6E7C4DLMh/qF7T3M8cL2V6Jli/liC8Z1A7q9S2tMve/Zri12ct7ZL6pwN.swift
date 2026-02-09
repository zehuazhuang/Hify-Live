
import Combine

// ✅ 全局直播管理
class LiveSessionManager: ObservableObject {
    static let shared = LiveSessionManager() // 单例

    @Published var currentChannelUserId: UInt = 0 // 当前观看直播间 id
    
    @Published var znWne5LXPType: Int = 0  //当前在哪层 0 上面没有层 1私聊层 2从私聊页进入的他人主页层
    
    @Published var udeea4uOEType: Int = 0 //0正常进入私聊页 1 从
}
