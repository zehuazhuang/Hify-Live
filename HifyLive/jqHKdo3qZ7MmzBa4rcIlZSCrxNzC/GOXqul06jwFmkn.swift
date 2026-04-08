//全局通用方法

import NIMSDK
//初始化云信
@MainActor
func IdVwDkHotdjRqB(){
    Task{
        do {
            let tokenResponse = try await fetchToken()
            TokenManager.shared.save(tokenResponse: tokenResponse)
        } catch {
            print("获取 token 失败:", error)
        }
    }
    NIMManager.shared.login(account: IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.string("yxAccid"), token: IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.string("imToken")) { success in
        if success {
            print("云信 IM 登录成功")
            // 只初始化一次后续获取会话/发送消息等
            _ = IMMessageListener.shared
            
            // 初始化监听器
            _ = OnlineStatusManager.shared
            
            
            // 初次拉会话
               DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                   RecentSessionManager.shared.fetchRecentSessions {
                       let sessions = RecentSessionManager.shared.cache
                       GlobalUnreadStore.shared.update(from: sessions)
                       RecentSessionStore.shared.cache = sessions
                   }
                   
//                   // ✅ 收集所有会话ID
//                   let ids = RecentSessionManager.shared.cache.map { $0.sessionId }
//
//                       // ✅ 统一订阅在线状态
//                    
//                       OnlineStatusManager.shared.subscribe(ids)
//                   
//                   let service = NIMSDK.shared().subscriptionService
//                   
//                   subscriptionService.subscribe(
//                       eventTypes: [1], // 在线状态类型
//                       publisherAccountIds: ["user1","user2"],
//                       expiry: 3600
//                   ) { error in
//                   }
//                   print(NIMSDK.shared().version)
//                   NIMSDK.shared().userManager.fetchUserInfos(["5a27c50df7984f0bbd7bd3180ccc7647"]) { users, error in
//                       if let user = users?.first {
//                           print(user.userInfo?.ext)
//                       }
//                   }
                   
                   
               }
            
            
            
           
            
            
            //进入公共聊天室
            Task{
                let asd = try await iowHG20TQQco()
                do {
                    
                    LiveSessionManager.shared.oep8RDxW = asd.string("roomId")
                   

                    let request = NIMChatroomEnterRequest()
                    request.roomId = asd.string("roomId")

                     try await NIMSDK.shared().chatroomManager.enterChatroom(request)
                } catch {
                    print("进入聊天室失败: \(error)")
                }
            }
        } else {
            print("云信 IM 登录失败")
        }
    }
}
