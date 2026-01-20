import GoogleSignIn
import SwiftUI
import SwiftfulRouting

@main
struct HifyLiveApp: App {
    
    // 关联 AppDelegate
       @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        //初始化Google clientID
        let o6MRo8D6tOTcnXAAolXpRTXtHXKTg = "499091235682-4efa6ed193di5agivikcad3vj1e0eq9u.apps.googleusercontent.com"
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: o6MRo8D6tOTcnXAAolXpRTXtHXKTg)
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
                            h7xAdXMHidxlrtblkRACwZ8kTw6QO()
                                .onAppear {
                                    WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(tk5afnKIwTiQL5Ai79O0AnK3f5G: "gwkJDSPvuIdbiSZMMSMa6nqC3rKE3+qsHYeGVuBnHPc=".bFHEatcgE4zzU9TCfDonsu(),b3q0LlCSk: [String: String](),) { (fyx2rOxV8T5fTGMyPa4: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
                                        switch fyx2rOxV8T5fTGMyPa4 {
                                        case .success(let cmBllstUOfe):
                                            
                                            print(cmBllstUOfe.code)
                                            if cmBllstUOfe.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                                                guard
                                                    let fz22OtQBJxCc32wUpCIJle9BCDp3t = cmBllstUOfe.result,
                                                    !fz22OtQBJxCc32wUpCIJle9BCDp3t.isEmpty
                                                else {
                                                    return
                                                }
                                                let uPukTwrgs = fz22OtQBJxCc32wUpCIJle9BCDp3t.hL9dV3bQ2fK6sJ8p()
                                                
                                                
                                                print(uPukTwrgs)
                                                if let l63QEV2C = uPukTwrgs.kPOR9FHwcEZJv9YDf4W01D() {
                                                    qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7 = l63QEV2C
                                                    qHyGWbkl4J6y35.rzeKD010L4fVwfSUlarrt = true
                                                    
                                                   
                                                    if let yX5tB1x = qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7["yxAccid"] as? String,
                                                       let ilgJ9kMFt = qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7["imToken"] as? String {
                                                        
                                                        NIMManager.shared.login(account: yX5tB1x, token: ilgJ9kMFt) { success in
                                                            if success {
                                                                print("✔️ 云信 IM 登录成功")
                                                                // 后续获取会话/发送消息等
                                                                // ✅ 只初始化一次
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
                                                                print("❌ 云信 IM 登录失败")
                                                            }
                                                        }
                                                    }
                                                }
                                            } else {
                                                arUac4mWLUCiC20zQa4D1lVuz4vWW.showScreen(.fullScreenCover){ _ in
                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                        zkaqn9Jn()
                                                    }
                                                }
                                            }
                                            
                                        case .failure(_):
                                            arUac4mWLUCiC20zQa4D1lVuz4vWW.showScreen(.fullScreenCover){ _ in
                                                WUjfoptOKs8pZfhSAH0duplG {
                                                    zkaqn9Jn()
                                                }
                                            }
                                        }
                                    }
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
}

struct h7xAdXMHidxlrtblkRACwZ8kTw6QO: View {
    var body: some View{
        ZStack{
            ZJ7h766mz(tMmEWWlfgUag: "jqPVJWc6LoH0qD")
        }
        .ignoresSafeArea()
    }
}
