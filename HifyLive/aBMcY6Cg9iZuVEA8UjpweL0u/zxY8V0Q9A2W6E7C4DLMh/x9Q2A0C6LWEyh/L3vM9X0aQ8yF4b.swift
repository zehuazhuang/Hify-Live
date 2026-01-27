

import Combine


//直播缓存数据
class L3vM9X0aQ8yF4b: ObservableObject {
    static let shared = L3vM9X0aQ8yF4b()

    @Published var W8pT2K6qR1mD5vH: [[String: Any]] = []
    var H7nC3B5yZ0fJ8sL: [[String: Any]]? = nil

    @MainActor
    func R4kF1V9bQ7mL2xT() async {
       
        if let cache = H7nC3B5yZ0fJ8sL, !W8pT2K6qR1mD5vH.isEmpty {
            W8pT2K6qR1mD5vH = cache
            return
        }

        do {
            let result = try await rP6kV1bS8qX3nT7()
            W8pT2K6qR1mD5vH = result
            H7nC3B5yZ0fJ8sL = result
        } catch {
            print(error)
        }
    }
}
