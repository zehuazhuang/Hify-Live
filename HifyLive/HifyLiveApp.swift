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
    
    var body: some Scene {
        WindowGroup {
            RouterView { router in
                ZStack {
                    //启动view
                    zkaqn9Jn()
//                    ME9B8ZCwVQxn()
                    //loading view
                    if xZLto.kpjdlNA22 {
                        BMTU5LVVTQYLXCZaN()
                            .transition(.opacity)
                            .zIndex(20)
                    }
                }
                .overlay(dqUmaY6jE7tRWpendJ())
                .onAppear {
                    UfmQhHA1doHKs.bHNA2Amheuq0.fetchData()
                }
            }
        }
    }
}
