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
    func fetchData() {
        WOKmjUjM.dq0JZ94RcmDb3.postCodable(
            path: "yTF9srxO9iM6Xra0cN27rq5WFVXh1cXklvTGwnsgpzI=".bFHEatcgE4zzU9TCfDonsu(),
            body: [String: String](),
            completion: { (result: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
                switch result {
                case .success(let resp):
                    if resp.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                        guard let compressedString = resp.result, !compressedString.isEmpty else { return }

                        // 1️⃣ 解密
                        let decryptedString = compressedString.hL9dV3bQ2fK6sJ8p()

                        // 2️⃣ 清理 Base64
                        var base64String = decryptedString
                            .replacingOccurrences(of: "\n", with: "")
                            .replacingOccurrences(of: "\r", with: "")
                            .replacingOccurrences(of: " ", with: "")
                            .filter { "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".contains($0) }

                        // 3️⃣ 补齐 Base64
                        while base64String.count % 4 != 0 {
                            base64String += "="
                        }

                        // 4️⃣ Base64 转 Data
                        guard let compressedData = Data(base64Encoded: base64String) else {
                            print("Base64 转 Data 失败")
                            return
                        }

                        // 5️⃣ gzip 解压
                        do {
                            let jsonData = try compressedData.gunzipped()
                            
                            if let jsonArray = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] {
                                DispatchQueue.main.async {
                                    self.o6Ex5Lgp7q46dDOd3db = jsonArray // 数组，每个元素是字典
                                    print("接口数据已保存到内存:", jsonArray)
                                }
                            } else {
                                print("解析 JSON 失败: 不是数组")
                            }
                        } catch {
                            print("解压或解析失败:", error)
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
}
