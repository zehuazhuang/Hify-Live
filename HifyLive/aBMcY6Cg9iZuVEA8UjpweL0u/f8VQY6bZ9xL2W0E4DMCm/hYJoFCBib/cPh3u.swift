import SwiftUI
import UserNotifications
import Combine

//个人首页通知配置
final class NOHpxY: ObservableObject {
    static let j9lChKVFzjtP37aeBd = NOHpxY()
    
    @Published var wgQztju2ChP5: Bool = false
    
    private init() {
        s1UvUY5jDYFvHb3j0()
    }
    
    func s1UvUY5jDYFvHb3j0() {
        UNUserNotificationCenter.current().getNotificationSettings { oSkr0A in
            DispatchQueue.main.async {
                switch oSkr0A.authorizationStatus {
                case .notDetermined:
                    // 第一次进 app，自动弹框
                    self.aR1jmEh7Q5JVQa()
                case .denied:
                    self.wgQztju2ChP5 = false
                case .authorized, .provisional, .ephemeral:
                    self.wgQztju2ChP5 = true
                @unknown default:
                    self.wgQztju2ChP5 = false
                }
            }
        }
    }
    
    private func aR1jmEh7Q5JVQa() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { xEPFYRfUHTbWuWq1, error in
            DispatchQueue.main.async {
                self.wgQztju2ChP5 = xEPFYRfUHTbWuWq1
            }
        }
    }
    
    func mYSDCpljHEidX6JhjetF() {
        guard let mEnCKiprYL05jxEhVBvChQthgUdUhYMJ = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(mEnCKiprYL05jxEhVBvChQthgUdUhYMJ) else { return }
        UIApplication.shared.open(mEnCKiprYL05jxEhVBvChQthgUdUhYMJ)
    }
}
