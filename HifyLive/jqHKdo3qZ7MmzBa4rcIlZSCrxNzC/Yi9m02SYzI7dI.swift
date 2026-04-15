import Network
import UIKit

class Yi9m02SYzI7dI {
    static let shared = Yi9m02SYzI7dI()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    
    private(set) var isConnected: Bool = true
    
    private init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                let connected = path.status == .satisfied
                
                // 只有状态变化时才处理
                if self.isConnected != connected {
                    self.isConnected = connected
                    
                    if !connected {
                        NotificationCenter.default.post(name: .networkLost, object: nil)
                    }
                }
            }
        }
        monitor.start(queue: queue)
    }
}

extension Notification.Name {
    static let networkLost = Notification.Name("networkLost")
}
