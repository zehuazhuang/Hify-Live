import Foundation
import Combine
import Gzip

// 国家列表管理
final class UfmQhHA1doHKs: ObservableObject {
    static let bHNA2Amheuq0 = UfmQhHA1doHKs()
    private init() {}
    
    // 保存接口数据的内存变量
    @Published var o6Ex5Lgp7q46dDOd3db: [[String: Any]]? = nil
    
    // MARK: - 拉取接口数据
    func e3lm29iotZr1P6CsH() {
        WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(
            tk5afnKIwTiQL5Ai79O0AnK3f5G: "yTF9srxO9iM6Xra0cN27rq5WFVXh1cXklvTGwnsgpzI=".bFHEatcgE4zzU9TCfDonsu(),
            b3q0LlCSk: [String: String](),
            vz8mIZ: { (tXxufOd2WBoomP: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
                switch tXxufOd2WBoomP {
                case .success(let dCFe3z7l6L):
                    print(dCFe3z7l6L.code)
                    if dCFe3z7l6L.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                        guard let wCIWg0zdgKOcPtHLH5kFxK5uaHu = dCFe3z7l6L.result, !wCIWg0zdgKOcPtHLH5kFxK5uaHu.isEmpty else { return }
                        
                        // 1️⃣ 解密
                        let d0yTWS99AFDuIeihRG0EbESdFlKGB = wCIWg0zdgKOcPtHLH5kFxK5uaHu.hL9dV3bQ2fK6sJ8p()
                        
                        // 2️⃣ 清理 Base64
                        var zkeMpyoGeryoQLCSnpq0X = d0yTWS99AFDuIeihRG0EbESdFlKGB
                            .replacingOccurrences(of: "\n", with: "")
                            .replacingOccurrences(of: "\r", with: "")
                            .replacingOccurrences(of: " ", with: "")
                            .filter { "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".contains($0) }
                        
                        // 3️⃣ 补齐 Base64
                        while zkeMpyoGeryoQLCSnpq0X.count % 4 != 0 {
                            zkeMpyoGeryoQLCSnpq0X += "="
                        }

                        // 4️⃣ Base64 转 Data
                        guard let zoswWjrIXiiLytqqNmzhvPmIVzu4Qh = Data(base64Encoded: zkeMpyoGeryoQLCSnpq0X) else {
//                            print("Base64 转 Data 失败")
                            return
                        }

                        // 5️⃣ gzip 解压
                        do {
                            let moxtx0d1FWIrh1iobpilfqdgXp7A3YX = try zoswWjrIXiiLytqqNmzhvPmIVzu4Qh.gunzipped()
                            
                            if let bMHS63lL9v67ma5HGA = try JSONSerialization.jsonObject(with: moxtx0d1FWIrh1iobpilfqdgXp7A3YX, options: []) as? [[String: Any]] {
                                DispatchQueue.main.async {
                                    self.o6Ex5Lgp7q46dDOd3db = bMHS63lL9v67ma5HGA // 数组，每个元素是字典
                                    print(bMHS63lL9v67ma5HGA)
                                }
                            } else {
//                                print("解析 JSON 失败: 不是数组")
                            }
                        } catch {
//                            print("解压或解析失败:", error)
                        }
                    }
                case .failure(let lrc2DAIlr3lyl7YcXi):
                    print(lrc2DAIlr3lyl7YcXi)
                }
            }
        )
    }
}
