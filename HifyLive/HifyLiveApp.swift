import GoogleSignIn
import UIPilot
import SwiftUI

import NIMSDK

class N0lU9akMbRab: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return .portrait
    }
}

@main
struct HifyLiveApp: App {
    

    @UIApplicationDelegateAdaptor(N0lU9akMbRab.self) var n0lU9akMbRab
    @StateObject var pilot = UIPilot<APPTJuHVkDYORXa>(initial: .cjMFVE23ZhInit)
    init() {
      
        //初始化Google clientID
        Task { @MainActor in
                   AgoraEngineManager.shared.preloadEngine()
               }
        let o6MRo8D6tOTcnXAAolXpRTXtHXKTg = "499091235682-4efa6ed193di5agivikcad3vj1e0eq9u.apps.googleusercontent.com"
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: o6MRo8D6tOTcnXAAolXpRTXtHXKTg)
        
        WebKitWarmUp.shared.warm()
        
        NIMSDK.shared().register(withAppID: JOGtDnYupP.zMVMMyTmNK, cerName: "")
    }
    
    @StateObject private var qHyGWbkl4J6y35 = IyfdHMdY.bTa3L6BoprG
    
   
    //通知
    @StateObject private var uZzJSmXjKpb1nJ49 = NOHpxY.j9lChKVFzjtP37aeBd
    
    //检查是否登录
    func utufpxtrNowtjF() {
        if ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.wFwG2LK27RYmRSty {
            if qHyGWbkl4J6y35.rzeKD010L4fVwfSUlarrt {
                pilot.push(.lsoFZyn41MiKHome)
            } else {
                Task {
                    await lidstateLoad()
                }
            }
        } else {
            pilot.push(.ms90KqZqLog)
        }
    }
    
    var body: some Scene {
        WindowGroup {
                   UIPilotHost(pilot) { route in
                       WUjfoptOKs8pZfhSAH0duplG{
                           switch route {
                           case .cjMFVE23ZhInit:
                               h7xAdXMHidxlrtblkRACwZ8kTw6QO()
                           case .ms90KqZqLog:
                               zkaqn9Jn().navigationBarHidden(true)
                               
                           case .lsoFZyn41MiKHome:
                               ME9B8ZCwVQxn().navigationBarHidden(true)
                               
                               
                           case let .zhwyzs0gELive(localUid, zA9Y4W6LUid):
                               LE0xQZ6Y7WC8iv(
                                localUid: localUid,
                                zA9Y4W6LUid: zA9Y4W6LUid
                               ).navigationBarHidden(true)
                           case let .itHCfaKsRUser(areoloaUid):
                               zQIRqHb1rSOJJ0wopZa8qxCs(
                                areoloaUid: areoloaUid
                               ).navigationBarHidden(true)
                               
                           case let .ijeWMJnw0(hIUsWqIEhUq3,nw1qv):
                               ijeWMJnw0(hIUsWqIEhUq3: hIUsWqIEhUq3, nw1qv: nw1qv).navigationBarHidden(true)
                           case let .R4IDIKA6NUAIJGfAL9RJRoayyWWGY1k3(irJBAop3c1cEIKUf3jOsmjxJfVg):
                               R4IDIKA6NUAIJGfAL9RJRoayyWWGY1k3(irJBAop3c1cEIKUf3jOsmjxJfVg: irJBAop3c1cEIKUf3jOsmjxJfVg).navigationBarHidden(true)
                           case .zpPt6HEcUfuVXHI2CXtIaD1P:
                               zpPt6HEcUfuVXHI2CXtIaD1P().navigationBarHidden(true)
                           case .UI42a1QDtyK8gG:
                               UI42a1QDtyK8gG().navigationBarHidden(true)
                           case let .UZ8hTFSeCcwrAy(yffmn1UtOF):
                               UZ8hTFSeCcwrAy(yffmn1UtOF: yffmn1UtOF).navigationBarHidden(true)
                           case .Afmox09Q1UKVfE:
                               Afmox09Q1UKVfE().navigationBarHidden(true)
                           case let .kaBpQbGjZ(c8WYppF6mHU):
                               kaBpQbGjZ(c8WYppF6mHU: c8WYppF6mHU)
                           case .bfoXTzIM4dlkv07MZv45zoMZVs23:
                               bfoXTzIM4dlkv07MZv45zoMZVs23().navigationBarHidden(true)
                           case .yDO7bVocx9JH0msGgIyRUs6e:
                               yDO7bVocx9JH0msGgIyRUs6e().navigationBarHidden(true)
                           case .ASkYEgFvkJ3xKj:
                               ASkYEgFvkJ3xKj().navigationBarHidden(true)
                           case .o95HINW4DpHIAT:
                               o95HINW4DpHIAT().navigationBarHidden(true)
                           case .js9GbCBiFR825bdWb7p7kVVWaBoE:
                               js9GbCBiFR825bdWb7p7kVVWaBoE().navigationBarHidden(true)
                           case .lhOJY7byauJZOO6Kfr3SaKy6:
                               lhOJY7byauJZOO6Kfr3SaKy6().navigationBarHidden(true)
                           case let .CgZU7mTgY46l(session,opponentAvatarURL):
                               CgZU7mTgY46l(session: session, opponentAvatarURL: opponentAvatarURL).navigationBarHidden(true)
                           case .QsS1CqA9M8tL2fs:
                               QsS1CqA9M8tL2fs().navigationBarHidden(true)
                           case let .ZQ9FPreviewWrapper(pics, startIndex):
                               ZQ9FPreviewWrapper(pics: pics,startIndex: startIndex)
                                   .ignoresSafeArea()
                           }
                       }
                   }
                .ignoresSafeArea()
                    .onAppear {
                        utufpxtrNowtjF()
                    }//判断token是否过期，到登录页面
                    .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("ppQrKwB8irEoW2EvXL1it8JDDf7"))) { _ in
                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("CF/pQfyETmTqnvPASaLzZqpNGUPBRIo9Z7z0oPoNL/elWQYGLZRU+1kaFCnxQ07D")
                        pilot.push(.ms90KqZqLog)
                    }
               }
    }
    
    func lidstateLoad() async{
       
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
                
               
                print("登录用户------")
                print(qHyGWbkl4J6y35.iBmPfFGfxu5JV7Aii7)

              
                //初始化云信
                IdVwDkHotdjRqB()
                
                //数据获取完毕切换页面
                qHyGWbkl4J6y35.rzeKD010L4fVwfSUlarrt = true
                pilot.push(.lsoFZyn41MiKHome)
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
