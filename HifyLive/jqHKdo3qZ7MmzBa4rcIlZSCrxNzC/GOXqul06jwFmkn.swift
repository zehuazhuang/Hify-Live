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
            // 初次拉会话
            RecentSessionManager.shared.fetchRecentSessions {
                    let sessions = RecentSessionManager.shared.cache
                    GlobalUnreadStore.shared.update(from: sessions)
                    RecentSessionStore.shared.cache = sessions
            }
//            // ✅ 收集所有会话ID
//            let ids = RecentSessionManager.shared.cache.map { $0.sessionId }
//
//                // ✅ 统一订阅在线状态
//                OnlineStatusManager.shared.startListen()
//                OnlineStatusManager.shared.subscribe(ids)
            
//            Task{
//                let asd = try await iowHG20TQQco()
//                do {
//                    
//                    print(asd)
//                    print(asd.string("roomId"))
//
//                    let request = NIMChatroomEnterRequest()
//                    request.roomId = asd.string("roomId")
//                    request.roomNickname = "iOS_User"
//
//                     try await NIMSDK.shared().chatroomManager.enterChatroom(request)
//                } catch {
//                    print("进入聊天室失败: \(error)")
//                }
//            }
        } else {
            print("云信 IM 登录失败")
        }
    }
}
