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

//成功返回结构
struct JUsmLn3i59tKLD7RL294I0nAG: Codable {
    let code: String
    let message: String
    let result: String?
}

//字符串转json
extension String {
    func kPOR9FHwcEZJv9YDf4W01D() -> [String: Any]? {
        guard let bGRy5fekQVRZLaPUFJaf2fUWEszmMze = self.data(using: .utf8) else { return nil }
        let qelPPnfmV0UYbi1h = try? JSONSerialization.jsonObject(with: bGRy5fekQVRZLaPUFJaf2fUWEszmMze)
        return qelPPnfmV0UYbi1h as? [String: Any]
    }
}

struct UVvaHCnbKWNk4KQPzW5aJDt: Error {
    let cj1N1slhsxdjKjCewAzR3TFUsJw: String
    
    var eUJLh: String { cj1N1slhsxdjKjCewAzR3TFUsJw }
}

//post请求封装
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
            "Accept": "f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(),//Accept --- application/json
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
        lCPuY6S9Ov185igRRdGb8fQizbjuqw: T,
        eUBbaLZvAje5GLxMb: @escaping (Result<Data, Error>) -> Void
    ) {
        let tmXsNyLk9jl = sqvbWkPN.appendingPathComponent(d91f2YK)
        var biHmuVi1B21WPGO = URLRequest(url: tmXsNyLk9jl)
        biHmuVi1B21WPGO.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu() //POST
        biHmuVi1B21WPGO.allHTTPHeaderFields = mUKxiOp6eoowXkAujNLiR()
        print("请求头: \(biHmuVi1B21WPGO.allHTTPHeaderFields ?? [:])")
        
        do {
            let d7hTYfwIR = try JSONEncoder().encode(lCPuY6S9Ov185igRRdGb8fQizbjuqw)
            
            guard let nEa4KCzHwxluWISVzOXqVwukQ9 = String(data: d7hTYfwIR, encoding: .utf8) else {
                throw NSError(domain: "rS5burW4QkK/9yJ7MUbz4A==".bFHEatcgE4zzU9TCfDonsu(), code: -1, userInfo: [NSLocalizedDescriptionKey: "EFbsDh1PQGFj37y1bb/KJ75hHJu8VfRfhEGPBcQVaVg=".bFHEatcgE4zzU9TCfDonsu()])
            }
            
            let o2HZU0mJ = nEa4KCzHwxluWISVzOXqVwukQ9.tYwP1zF6sM8vR2kq() // 你的加密方法
            print("加密数据")
            print(o2HZU0mJ)
            biHmuVi1B21WPGO.httpBody = o2HZU0mJ.data(using: .utf8)
            
        } catch {
            eUBbaLZvAje5GLxMb(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: biHmuVi1B21WPGO) { fHzNVSPyWl1PBPEr, odwmhGvKuEz7uG, iXeEEC6uYGesqcZFyS0azNH in
            DispatchQueue.main.async {
                if let _ = iXeEEC6uYGesqcZFyS0azNH {
                    eUBbaLZvAje5GLxMb(.failure(UVvaHCnbKWNk4KQPzW5aJDt(cj1N1slhsxdjKjCewAzR3TFUsJw:"9fZeXzm2b8JDi9URhrOPCQ==".bFHEatcgE4zzU9TCfDonsu())))
                    return
                }
                
                guard let bWtqmD7lucTVd = odwmhGvKuEz7uG as? HTTPURLResponse else {
                    eUBbaLZvAje5GLxMb(.failure(UVvaHCnbKWNk4KQPzW5aJDt(cj1N1slhsxdjKjCewAzR3TFUsJw:"2DM2Z94bu6d8JPzzIf8jsun0SnWw62x3q/6Ntp98akQkE0An2ZjWccqq39/HHg1pN2F46Szhu50OUr5rn+kPTw==".bFHEatcgE4zzU9TCfDonsu())))
                    return
                }
                
                // 检测 401
                if bWtqmD7lucTVd.statusCode == 401 {
//                    print("⚠️ Token 已过期，请重新登录")
                    ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.lVl52wvq4fL2AjD8MczeYD9FTXtw() // 清除 token
                    NotificationCenter.default.post(name: NSNotification.Name("ppQrKwB8irEoW2EvXL1it8JDDf7"), object: nil)
                    return
                }
                
                guard let tQk6UNCOXMjVF = fHzNVSPyWl1PBPEr else {
                    eUBbaLZvAje5GLxMb(.failure(UVvaHCnbKWNk4KQPzW5aJDt(cj1N1slhsxdjKjCewAzR3TFUsJw:"zKJ0JhTyNQKhBwONwPSNv/6ZA+dkt4xcIDrr2g61RgHGWBNMyyqv0OYQoTDCFFpy".bFHEatcgE4zzU9TCfDonsu())))
                    return
                }
                
                eUBbaLZvAje5GLxMb(.success(tQk6UNCOXMjVF))
            }
        }.resume()
    }
    
    /// POST 请求（解析成 Codable）
    func zhuqPvhpwoDjs<T: Codable, U: Codable>(
        tk5afnKIwTiQL5Ai79O0AnK3f5G: String,
        b3q0LlCSk: T,
        vz8mIZ: @escaping (Result<U, Error>) -> Void
    ) {
        u4zc01qpmnxgrZY2kpPJSCrCCWhUIptZ(d91f2YK:tk5afnKIwTiQL5Ai79O0AnK3f5G , lCPuY6S9Ov185igRRdGb8fQizbjuqw: b3q0LlCSk) { td9MXst2FJp5tH in
            switch td9MXst2FJp5tH {
            case .success(let deHtiwXgwor6oBoAdpZwniF):
                do {
                    let kLUC87riFAgqL = try JSONDecoder().decode(U.self, from: deHtiwXgwor6oBoAdpZwniF)
                    vz8mIZ(.success(kLUC87riFAgqL))
                } catch {
                    vz8mIZ(.failure(error))
                }
            case .failure(let bxtX6INFNIOUXbK6Gsja):
                let yf37ozbFnvBsnl: UVvaHCnbKWNk4KQPzW5aJDt
                if let gft5ya = bxtX6INFNIOUXbK6Gsja as? UVvaHCnbKWNk4KQPzW5aJDt {
                    yf37ozbFnvBsnl = gft5ya
                } else {
                    yf37ozbFnvBsnl = UVvaHCnbKWNk4KQPzW5aJDt(cj1N1slhsxdjKjCewAzR3TFUsJw: bxtX6INFNIOUXbK6Gsja.localizedDescription)
                }
                vz8mIZ(.failure(yf37ozbFnvBsnl))
            }
        }
    }
    
    /// POST 请求（async / await）
    func j36UQlXa0<T: Codable, U: Codable>(
        xH0OPzEYR4M5ewWkZQAveq6Vy7: String,
        tD5tEJZTT0NlaIX7eMREG92BhO3n: T
    ) async throws -> U {
        try await withCheckedThrowingContinuation { vPBjxM0F3RljYto in
            zhuqPvhpwoDjs(
                tk5afnKIwTiQL5Ai79O0AnK3f5G: xH0OPzEYR4M5ewWkZQAveq6Vy7,
                b3q0LlCSk: tD5tEJZTT0NlaIX7eMREG92BhO3n
            ) { (jIpeCs8u8aCybmHDkNyl0s9ubDnihvo: Result<U, Error>) in
                switch jIpeCs8u8aCybmHDkNyl0s9ubDnihvo {
                case .success(let bDzKb9cGLKC4kzyfKtbcX8v9):
                    vPBjxM0F3RljYto.resume(returning: bDzKb9cGLKC4kzyfKtbcX8v9)
                case .failure(let bxtX6INFNIOUXbK6Gsja):
                    let yf37ozbFnvBsnl: UVvaHCnbKWNk4KQPzW5aJDt
                    if let gft5ya = bxtX6INFNIOUXbK6Gsja as? UVvaHCnbKWNk4KQPzW5aJDt {
                        yf37ozbFnvBsnl = gft5ya
                    } else {
                        yf37ozbFnvBsnl = UVvaHCnbKWNk4KQPzW5aJDt(cj1N1slhsxdjKjCewAzR3TFUsJw: bxtX6INFNIOUXbK6Gsja.localizedDescription)
                    }
                    vPBjxM0F3RljYto.resume(throwing: yf37ozbFnvBsnl)
                }
            }
        }
    }
}
