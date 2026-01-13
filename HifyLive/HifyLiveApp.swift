import GoogleSignIn
import SwiftUI
import SwiftfulRouting

@main
struct HifyLiveApp: App {
    
    init() {
        //初始化Google clientID
        let o6MRo8D6tOTcnXAAolXpRTXtHXKTg = "UxrD5ZvlHk815TGZPkGosRbvD1QiNBhwZgPEhDhK+3EoydMlF6DmJPi54jh5vxJcYRSmtjWV374z2DYG8hfkOVu4tmwGpGOF/lpXVKNFjSc=".bFHEatcgE4zzU9TCfDonsu()
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
            }
        }
    }
}
