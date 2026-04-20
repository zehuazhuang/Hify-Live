
//订阅在线状态
import NIMSDK
import Combine
import Foundation
class OnlineStatusManager: NSObject, ObservableObject, V2NIMSubscribeListener {
    
    static let shared = OnlineStatusManager()
    
    @Published var statusMap: [String: V2NIMUserStatusType] = [:]

    override init() {
        super.init()
       
        NIMSDK.shared().v2SubscriptionService.add(self)
    }
    
   
    
    func subscribe(_ ids: [String]) {
  
        
        let uniqueIds = Array(Set(ids))
        
        let option = V2NIMSubscribeUserStatusOption()
        option.accountIds = uniqueIds
        option.duration = 3600
        option.immediateSync = true

        NIMSDK.shared().v2SubscriptionService.subscribeUserStatus(option) { failed in
            print("end \(failed)")
        } failure: { error in
            print("error \(error)")
        }
        
    }

    func onUserStatusChanged(_ data: [V2NIMUserStatus]) {
        for status in data {
            statusMap[status.accountId] = status.statusType
        }
    }

    func isOnline(_ uid: String) -> Bool {
        guard let status = statusMap[uid] else { return false }
        return status == .USER_STATUS_TYPE_LOGIN
    }
}


