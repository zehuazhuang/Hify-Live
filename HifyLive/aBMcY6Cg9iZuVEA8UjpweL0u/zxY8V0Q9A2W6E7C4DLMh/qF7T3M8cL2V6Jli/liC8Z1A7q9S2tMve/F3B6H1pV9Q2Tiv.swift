

import Foundation
import NIMSDK

final class NIMManager {

    static let shared = NIMManager()
    private init() {}
    
    

    func login(account: String, token: String, completion: @escaping (Bool) -> Void) {
        // 新版 SDK 登录
        NIMSDK.shared().loginManager.login(account, token: token) { error in
            completion(error == nil)
        }
    }
    
    //退出云信
    func y59Dm7CdcqOut() {
        
        NIMSDK.shared().loginManager.logout { error in
            
            if let error = error {
                print("云信退出失败:", error.localizedDescription)
               
                return
            }
            
            print("云信退出成功")
            
           
            RecentSessionManager.shared.logoutAndClearAll()
            
           
        }
    }
    
    
    
    // MARK: - 获取最近会话列表
      func fetchRecentSessions() -> [NIMRecentSession] {
          let sessions = NIMSDK.shared().conversationManager.allRecentSessions() ?? []
          return sessions
      }

}

