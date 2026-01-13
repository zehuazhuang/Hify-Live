import Foundation

struct bonDyqD2YnaVJW: CodingKey {
    
    let stringValue: String
    let intValue: Int? = nil
    
    init(_ wKOuFTie4tWyzb3q4vsAUd8la65qjA: String) {
        self.stringValue = wKOuFTie4tWyzb3q4vsAUd8la65qjA
    }
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    init?(intValue: Int) {
        return nil
    }
}

struct JUsmLn3i59tKLD7RL294I0nAG: Codable {
    let code: String
    let message: String
    let result: String?
}

final class WOKmjUjM {
    
    static let dq0JZ94RcmDb3 = WOKmjUjM()
    private init() {}
    
    /// 基础地址
    private let sqvbWkPN = URL(string: "OqNCDtx/JP4F79AwSU+rDse//L3+v56XegqODMcGDG8=".bFHEatcgE4zzU9TCfDonsu())! //https://testaes.cphub.link
    
    /// 获取最新请求头
    private func mUKxiOp6eoowXkAujNLiR() -> [String: String] {
        let nmZuLwUv = ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1
        
        return [
            "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu(): "11111111",//appId
            "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu(): "1.0.1",//appVersion
            "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu(): nmZuLwUv.fiaiU4sbcNXzTzXA ?? "",//loginToken
            "xGWm0Zhs5rl1HzU63Yd4hA==".bFHEatcgE4zzU9TCfDonsu(): "f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(),//content-type --- application/json
            "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu(): nmZuLwUv.nOlVkD, //deviceNo
        ]
    }
    
    /// POST 请求（通用）
    /// - Parameters:
    ///   - path: 接口路径
    ///   - body: 请求体
    ///   - completion: 返回 Data（原始），由调用方自己决定解析方式
    func u4zc01qpmnxgrZY2kpPJSCrCCWhUIptZ<T: Codable>(
        d91f2YK: String,
        body: T,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        let url = sqvbWkPN.appendingPathComponent(d91f2YK)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = mUKxiOp6eoowXkAujNLiR()
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            
            guard let jsonString = String(data: jsonData, encoding: .utf8) else {
                throw NSError(domain: "LiveAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to encode JSON"])
            }
            
            let encryptedString = jsonString.tYwP1zF6sM8vR2kq() // 你的加密方法
            print("加密数据")
            print(encryptedString)
            request.httpBody = encryptedString.data(using: .utf8)
            
        } catch {
            completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data", code: -1)))
                    return
                }
                
                completion(.success(data))
            }
        }.resume()
    }
    
    /// POST 请求（解析成 Codable）
    func postCodable<T: Codable, U: Codable>(
        path: String,
        body: T,
        completion: @escaping (Result<U, Error>) -> Void
    ) {
        u4zc01qpmnxgrZY2kpPJSCrCCWhUIptZ(d91f2YK:path , body: body) { result in
            switch result {
            case .success(let data):
                do {
                    let decoded = try JSONDecoder().decode(U.self, from: data)
                    completion(.success(decoded))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
