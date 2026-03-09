//
//  GvGCVUWUdy1bOz.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/9.
//
import NIMSDK
import Combine
import Foundation
class OnlineStatusManager: NSObject, ObservableObject, V2NIMSubscribeListener {
    
    static let shared = OnlineStatusManager()
    
    @Published var statusMap: [String: V2NIMUserStatusType] = [:]

    override init() {
        super.init()
       
     
    }
    
    func startListen() {
        NIMSDK.shared().v2SubscriptionService.add(self)
    }

    func subscribe(_ ids: [String]) {
        print("IM登录账号:", NIMSDK.shared().loginManager.currentAccount())
        print("订阅")
        print(ids)
        
        let uniqueIds = Array(Set(ids)) // 去重
        
        let option = V2NIMSubscribeUserStatusOption()
        option.accountIds = uniqueIds
        option.duration = 3600
        option.immediateSync = true

        NIMSDK.shared().v2SubscriptionService.subscribeUserStatus(option) { failed in
            print("订阅完成 \(failed)")
        } failure: { error in
            print("订阅失败 \(error)")
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
