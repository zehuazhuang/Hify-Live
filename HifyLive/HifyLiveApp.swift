import GoogleSignIn
import SwiftUI
import SwiftfulRouting
import NIMSDK

@main
struct HifyLiveApp: App {
    
    // 关联 AppDelegate
//       @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        //初始化Google clientID
        let o6MRo8D6tOTcnXAAolXpRTXtHXKTg = "499091235682-4efa6ed193di5agivikcad3vj1e0eq9u.apps.googleusercontent.com"
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: o6MRo8D6tOTcnXAAolXpRTXtHXKTg)
        
        WebKitWarmUp.shared.warm()
    }
    
    @StateObject private var qHyGWbkl4J6y35 = IyfdHMdY.bTa3L6BoprG
    
    @Environment(\.router) var arUac4mWLUCiC20zQa4D1lVuz4vWW
    //通知
    @StateObject private var uZzJSmXjKpb1nJ49 = NOHpxY.j9lChKVFzjtP37aeBd
    
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                ZStack {
                    //判断是否存在token，存在进首页，不存在去登录
                    if ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.wFwG2LK27RYmRSty {
                        if qHyGWbkl4J6y35.rzeKD010L4fVwfSUlarrt {
                            WUjfoptOKs8pZfhSAH0duplG {
                                ME9B8ZCwVQxn()
                            }
                        } else {
                            //获取当前登录用户数据
                           
                            h7xAdXMHidxlrtblkRACwZ8kTw6QO().task {
                                lidstateLoad()
                            }
                            
                        }
                    } else {
                        WUjfoptOKs8pZfhSAH0duplG {
                            zkaqn9Jn()
                        }
                    }
                }
                .onAppear {
                    UfmQhHA1doHKs.bHNA2Amheuq0.e3lm29iotZr1P6CsH()
                }
                //判断token是否过期，到登录页面
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("ppQrKwB8irEoW2EvXL1it8JDDf7"))) { _ in
                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("CF/pQfyETmTqnvPASaLzZqpNGUPBRIo9Z7z0oPoNL/elWQYGLZRU+1kaFCnxQ07D")
                    router.showScreen(.fullScreenCover) { _ in
                        WUjfoptOKs8pZfhSAH0duplG {zkaqn9Jn()} // 你的登录页
                    }
                }
            }
        }
    }
    
    func lidstateLoad(){
       
        Task {
           // let gUYkcLEvc5ndcD5NIGlQgbY4C3v1L5: [String:Any]? = await aYTO7iD()
            var responseData: [String: Any]? = nil
            let maxRetries = 3   // 最多尝试次数，避免死循环
            var attempt = 0

            while responseData == nil && attempt < maxRetries {
                attempt += 1
                responseData = await aYTO7iD()
                
                if responseData == nil {
                    print("第 \(attempt) 次请求返回空，重试...")
                    try? await Task.sleep(nanoseconds: 1_000_000_000) // 等 1 秒再重试
                }
            }

            if let data = responseData {
                print("成功获取数据:", data)
            }
            if let kRWrAfSFZzA6re6E68Sfhxj: [String:Any] = responseData {
                qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7 = kRWrAfSFZzA6re6E68Sfhxj
                if let ov5FA166mGGy3hHU = kRWrAfSFZzA6re6E68Sfhxj[
                    "yz0sixGzozcHcCcfNkfJkg==".bFHEatcgE4zzU9TCfDonsu()
                ] as? [[String: Any]] {
                    qHyGWbkl4J6y35.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi = ov5FA166mGGy3hHU.compactMap {
                        $0.string("ttysucqiFVfAC6KE/VcrvA==".bFHEatcgE4zzU9TCfDonsu())
                    }
                }
                //获取关注粉丝列表
                vf0AD3wYQxpfxxjs2pE7PuO66Wls(2)
                vf0AD3wYQxpfxxjs2pE7PuO66Wls(3)
                NIMSDK.shared().register(withAppID: JOGtDnYupP.zMVMMyTmNK, cerName: "")
                do {
                    let tokenResponse = try await fetchToken()
                    TokenManager.shared.save(tokenResponse: tokenResponse)
                } catch {
                    print("获取 token 失败:", error)
                }
                print("登录用户------")
                print(qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7)
                TokenManager.shared.setupRTM()
                TokenManager.shared.loginRTM(userId: String(qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7.int("userId"))) { success in
                    print(success ? "rtm登录成功" : "rtm登录失败")
                }
                if let yX5tB1x = qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7["yxAccid"] as? String,
                   let ilgJ9kMFt = qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7["imToken"] as? String {
                    NIMManager.shared.login(account: yX5tB1x, token: ilgJ9kMFt) { success in
                        if success {
                            print("云信 IM 登录成功")
                            // 只初始化一次后续获取会话/发送消息等
                            _ = IMMessageListener.shared
                            // 初次拉会话
                            RecentSessionManager.shared.fetchRecentSessions {
                                DispatchQueue.main.async {
                                    let sessions = RecentSessionManager.shared.cache
                                    GlobalUnreadStore.shared.update(from: sessions)
                                    RecentSessionStore.shared.cache = sessions
                                }
                            }
                        } else {
                            print("云信 IM 登录失败")
                        }
                    }
                }
                //数据获取完毕切换页面
                qHyGWbkl4J6y35.rzeKD010L4fVwfSUlarrt = true
            } else {
                arUac4mWLUCiC20zQa4D1lVuz4vWW.showScreen(.fullScreenCover){ _ in
                    WUjfoptOKs8pZfhSAH0duplG {
                        zkaqn9Jn()
                    }
                }
            }
        }
    }
}

struct h7xAdXMHidxlrtblkRACwZ8kTw6QO: View {
    var body: some View{
        ZStack{
            ZJ7h766mz(tMmEWWlfgUag: "ciashiuqNCUYQ")
        }
        .ignoresSafeArea()
    }
}
