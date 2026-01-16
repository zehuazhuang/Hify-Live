import SwiftUI
import Combine

//当前登录用户变量
final class IyfdHMdY: ObservableObject {
    
    static let bTa3L6BoprG = IyfdHMdY()
    private init() {}
    
    /// 原始用户 JSON（字段不固定）
    @Published var iBmPfFGfxu5JV7Aii7: [String: Any] = [:]
    
    /// 是否已加载完数据
    @Published var rzeKD010L4fVwfSUlarrt: Bool = false
}

extension Dictionary where Key == String, Value == Any {

    func string(_ key: String, default def: String = "") -> String {
        self[key] as? String ?? def
    }

    func int(_ key: String, default def: Int = 0) -> Int {
        self[key] as? Int ?? def
    }
}
