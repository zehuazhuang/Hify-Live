import GoogleSignIn
import SwiftUI
import SwiftfulRouting

@main
struct HifyLiveApp: App {
    
    init() {
        //初始化Google clientID
        let o6MRo8D6tOTcnXAAolXpRTXtHXKTg = "499091235682-4efa6ed193di5agivikcad3vj1e0eq9u.apps.googleusercontent.com"
        GIDSignIn.sharedInstance.configuration = GIDConfiguration(clientID: o6MRo8D6tOTcnXAAolXpRTXtHXKTg)
    }
    
    @StateObject private var xZLto = EfqJ9.hlLgQUr6MegOX6Bv
    @StateObject private var qHyGWbkl4J6y35 = IyfdHMdY.bTa3L6BoprG
    
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
