import SwiftUI
import Combine

//当前登录用户变量
final class IyfdHMdY: ObservableObject {
    
    static let bTa3L6BoprG = IyfdHMdY()
    private init() {}
    
    /// 原始用户 JSON（字段不固定）
    @Published var iBmPfFGfxu5JV7Aii7: [String: Any] = [:]
    
    /// 关注
    @Published var n1G8RlzpcQK: [[String: Any]] = []
    
    /// 粉丝
    @Published var iF2ouR0gHFDSr3GJ: [[String: Any]] = []
    
    /// 是否已加载完数据
    @Published var rzeKD010L4fVwfSUlarrt: Bool = false
    
    //await获取当前用户关注粉丝列表
    @MainActor
    func vf0AD3wYQxpfxxjs2pE7PuO66Wls(_ tfKmqT: Int) async {
        let hsiIAmjydsN5mMcG9 = hQ3WIqHVGH7oTmiDkGXDUO5HL9GjhFQ4(
            daFmc3QiCLth5mq3q1: tfKmqT,
            iQZrp8Zk6afD: ZoJOsS30O6aFGB936Oc0s.ahhr4vY6c0BLPJuChjgiYlBUhZHI()
        )

        do {
            let hTdF6YE183PLScUIPO43XlfJ: JUsmLn3i59tKLD7RL294I0nAG =
                try await WOKmjUjM.dq0JZ94RcmDb3
                    .j36UQlXa0(
                        xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6kOJyXJzNPfmTnk8iPCNnFY="
                            .bFHEatcgE4zzU9TCfDonsu(),
                        tD5tEJZTT0NlaIX7eMREG92BhO3n: hsiIAmjydsN5mMcG9
                    )

            if hTdF6YE183PLScUIPO43XlfJ.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu(),
               let j7uYZ7NTPqx = hTdF6YE183PLScUIPO43XlfJ.result,
               let ztp0m25wFEZ0fxG5hWBhwc = j7uYZ7NTPqx.hL9dV3bQ2fK6sJ8p().niBylJAjsTHPDww() {

                if tfKmqT == 3 { self.n1G8RlzpcQK = ztp0m25wFEZ0fxG5hWBhwc }
                if tfKmqT == 2 { self.iF2ouR0gHFDSr3GJ = ztp0m25wFEZ0fxG5hWBhwc }
            }

        } catch {
            if tfKmqT == 3 { self.n1G8RlzpcQK = [] }
            if tfKmqT == 2 { self.iF2ouR0gHFDSr3GJ = [] }
        }
    }
}

extension Dictionary where Key == String, Value == Any {

    func string(_ key: String, default def: String = "") -> String {
        self[key] as? String ?? def
    }

    func int(_ key: String, default def: Int = 0) -> Int {
        self[key] as? Int ?? def
    }
    
    func bool(_ key: String, default def: Bool = false) -> Bool {
        self[key] as? Bool ?? def
    }
}
