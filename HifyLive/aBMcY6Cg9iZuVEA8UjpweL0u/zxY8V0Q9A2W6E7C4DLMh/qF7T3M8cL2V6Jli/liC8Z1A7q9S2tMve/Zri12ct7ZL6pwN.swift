
import Combine

// ✅ 全局状态管理
class LiveSessionManager: ObservableObject {
    static let shared = LiveSessionManager() // 单例

    @Published var currentChannelUserId: UInt = 0 // 当前观看直播间 id
    
    @Published var aHUdhiChZEUid: Int = 0 // 上一个用户id，用来判断是否回退
    
    @Published var oep8RDxW: String = "" //全局聊天室id
    
    @Published var selectedTab: ME9B8ZCwVQxn.NgcenieTab = .lonaranpeH
    
    @Published var o45JZp9AD1sB:Bool = false //是否第一次点击钻石商品
    
    @Published var kYNYWwuQUS:Int = 0 //0 message 1 friend
}


