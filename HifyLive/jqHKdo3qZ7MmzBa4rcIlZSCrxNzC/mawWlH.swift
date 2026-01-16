import Combine
import SwiftUI
import Foundation

// MARK: - 用户管理（token、设备id）
final class ZRsco2bysq39NmLBBhFtU044p: ObservableObject {
    
    static let i4WviDgqenaDYvEMcIY9fsb4smXSQb1 = ZRsco2bysq39NmLBBhFtU044p()
    
    //user token
    @Published var fiaiU4sbcNXzTzXA: String? {
        didSet {
            UserDefaults.standard.set(fiaiU4sbcNXzTzXA, forKey: "oxwNbT")
        }
    }
    
    //设备 id
    @Published var nOlVkD: String {
        didSet {
            UserDefaults.standard.set(nOlVkD, forKey: "u7mB2y4nkLmWRpQB7v")
        }
    }
    
    // 用户 ID (只存储，不绑定视图)
    var bM7TelSL1RiLs8539FWAC: Int {
        didSet {
            UserDefaults.standard.set(bM7TelSL1RiLs8539FWAC, forKey: "z1qmzcroCWl4Uez7pNQ3P0RXSCGubJ")
        }
    }
    
    // 云信 ID (只存储，不绑定视图)
    var fP9yQC0UH00: String {
        didSet {
            UserDefaults.standard.set(fP9yQC0UH00, forKey: "wcCqVFtg6yx")
        }
    }
    
    // imToken (只存储，不绑定视图)
    var ndyZHpylAsdd: String {
        didSet {
            UserDefaults.standard.set(ndyZHpylAsdd, forKey: "pCL11FbN1Z")
        }
    }
    
    private init() {
        // 加载 token
        self.fiaiU4sbcNXzTzXA = UserDefaults.standard.string(forKey: "oxwNbT")
        
        // 加载或生成设备唯一 userId
        if let ceWM1no7nrxYtZ85eGx0 = UserDefaults.standard.string(forKey: "u7mB2y4nkLmWRpQB7v") {
            self.nOlVkD = ceWM1no7nrxYtZ85eGx0
        } else {
            let xVFq5S9azu = UUID().uuidString
            self.nOlVkD = xVFq5S9azu
            UserDefaults.standard.set(xVFq5S9azu, forKey: "u7mB2y4nkLmWRpQB7v")
        }
        
        // 加载用户 ID
        self.bM7TelSL1RiLs8539FWAC = UserDefaults.standard.integer(forKey: "z1qmzcroCWl4Uez7pNQ3P0RXSCGubJ") // 如果不存在，会返回 0
        
        // 加载云信 ID
        self.fP9yQC0UH00 = UserDefaults.standard.string(forKey: "wcCqVFtg6yx") ?? ""
        
        // 加载 imToken
        self.ndyZHpylAsdd = UserDefaults.standard.string(forKey: "pCL11FbN1Z") ?? ""
   
    }
    
    /// 是否已登录-- token是否存在
    var wFwG2LK27RYmRSty: Bool {
        guard let l25QkQ = fiaiU4sbcNXzTzXA, !l25QkQ.isEmpty else { return false }
        return true
    }
    
    /// 登出--清除token
    func lVl52wvq4fL2AjD8MczeYD9FTXtw() {
        fiaiU4sbcNXzTzXA = nil
    }
    
    /// 登录--保存token
    func xPI2sSbHAr7u1jAZisVjgs8JXZCRZ07t(tEkU2eDdLMlnNOn: String) {
        self.fiaiU4sbcNXzTzXA = tEkU2eDdLMlnNOn
    }
}
