//初始化云信
import UIKit
import NIMSDK

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        // 1️⃣ 初始化云信
        // 如果暂时不需要推送证书，传空字符串 ""
        NIMSDK.shared().register(withAppID: "124f689baed25c488e1330bc42e528af", cerName: "")
        
        return true
        
        
        
    }
}
