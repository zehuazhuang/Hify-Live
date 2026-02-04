

import Combine


//直播缓存数据
class L3vM9X0aQ8yF4b: ObservableObject {
    static let shared = L3vM9X0aQ8yF4b()

    @Published var W8pT2K6qR1mD5vH: [[String: Any]] = []
    var H7nC3B5yZ0fJ8sL: [[String: Any]]? = nil

    @MainActor
    func R4kF1V9bQ7mL2xT(forceRefresh: Bool = false) async {
        // 如果不强制刷新且缓存存在且不为空，直接用缓存
        if !forceRefresh, let cache = H7nC3B5yZ0fJ8sL, !cache.isEmpty {
            W8pT2K6qR1mD5vH = cache
            return
        }

        // 否则去请求数据
        do {
           
            let result = try await rP6kV1bS8qX3nT7()
           
            W8pT2K6qR1mD5vH = result
            H7nC3B5yZ0fJ8sL = result
        } catch {
          
            print("获取直播列表失败:", error)
        }
    }
}
