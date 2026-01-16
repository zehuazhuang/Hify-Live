import GoogleSignIn
import SwiftUI
import SwiftfulRouting


struct uHYeXunyhHKJK7QDdQI46W: Codable {
    
    let sjcRdDTK: Int //用户ID
    let fQQWhWMIMla1kWr: String //云信ID
    
    func encode(to encoder: Encoder) throws {
        var xlZ4NMI1SwBAYpXr1 = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        try xlZ4NMI1SwBAYpXr1.encode(
            sjcRdDTK,
            forKey: bonDyqD2YnaVJW(
                "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
        
        try xlZ4NMI1SwBAYpXr1.encode(
            fQQWhWMIMla1kWr,
            forKey: bonDyqD2YnaVJW(
                "HKd/L3NovhrAFZdHjyoJDg==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
    }
}

@main
struct HifyLiveApp: App {
    
    init() {
        //初始化Google clientID
        let o6MRo8D6tOTcnXAAolXpRTXtHXKTg = "499091235682-4efa6ed193di5agivikcad3vj1e0eq9u.apps.googleusercontent.com"
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: o6MRo8D6tOTcnXAAolXpRTXtHXKTg)
    }
    
    @StateObject private var xZLto = EfqJ9.hlLgQUr6MegOX6Bv
    @StateObject private var qHyGWbkl4J6y35 = IyfdHMdY.bTa3L6BoprG
    
    @Environment(\.router) var arUac4mWLUCiC20zQa4D1lVuz4vWW
    
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                ZStack {
                    //判断是否存在token，存在进首页，不存在去登录
                    if ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.wFwG2LK27RYmRSty {
                        if qHyGWbkl4J6y35.rzeKD010L4fVwfSUlarrt {
                            ME9B8ZCwVQxn()
                        } else {
                            //获取当前登录用户数据
                            h7xAdXMHidxlrtblkRACwZ8kTw6QO()
                                .onAppear {
                                    let ynVm9Eu9qXtHxVzDpKzMrG8Cqopy = uHYeXunyhHKJK7QDdQI46W(sjcRdDTK: ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.bM7TelSL1RiLs8539FWAC, fQQWhWMIMla1kWr: ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fP9yQC0UH00)
                                    WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(tk5afnKIwTiQL5Ai79O0AnK3f5G: "jd+Je9oaVKuQ4jHkoZazeiUeAljC8YlPdz+5tirNkKw=".bFHEatcgE4zzU9TCfDonsu(), b3q0LlCSk: ynVm9Eu9qXtHxVzDpKzMrG8Cqopy) { (fyx2rOxV8T5fTGMyPa4: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
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
                                                }
                                            } else {
                                                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                arUac4mWLUCiC20zQa4D1lVuz4vWW.showScreen(.fullScreenCover){ _ in
                                                    zkaqn9Jn()
                                                }
                                            }
                                        case .failure(_):
                                            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                            arUac4mWLUCiC20zQa4D1lVuz4vWW.showScreen(.fullScreenCover){ _ in
                                                zkaqn9Jn()
                                            }
                                        }
                                    }
                                }
                        }
                    } else {
                        zkaqn9Jn()
                    }
                    //loading view
                    if xZLto.kpjdlNA22 {
                        BMTU5LVVTQYLXCZaN()
                            .transition(.opacity)
                            .zIndex(20)
                    }
                    dqUmaY6jE7tRWpendJ()
                        .zIndex(10)
                }
                .onAppear {
                    UfmQhHA1doHKs.bHNA2Amheuq0.e3lm29iotZr1P6CsH()
                }
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("ppQrKwB8irEoW2EvXL1it8JDDf7"))) { _ in
                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("CF/pQfyETmTqnvPASaLzZqpNGUPBRIo9Z7z0oPoNL/elWQYGLZRU+1kaFCnxQ07D")
                    router.showScreen(.fullScreenCover) { _ in
                        zkaqn9Jn() // 你的登录页
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
