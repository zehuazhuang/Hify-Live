//
//  zR8DvoEobgcgn6T3jTqxU4Paf.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/11.
//

import Foundation



//直播数据接口
@MainActor
func rP6kV1bS8qX3nT7() async throws -> [[String: Any]] {
    guard let vD9sL2mK4tQ1bH = URL(string: "https://testaes.cphub.link/api/agora/live/queryLiveListV2") else {
        throw URLError(.badURL)
    }
    
    var zF7nC3qL5pR2vT = URLRequest(url: vD9sL2mK4tQ1bH)
    zF7nC3qL5pR2vT.httpMethod = "POST"
    
    zF7nC3qL5pR2vT.setValue("11111111", forHTTPHeaderField: "appId")
    zF7nC3qL5pR2vT.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    zF7nC3qL5pR2vT.setValue("BC05CE5875414D248F2FCD158E6DFB31", forHTTPHeaderField: "loginToken")
    zF7nC3qL5pR2vT.setValue("application/json", forHTTPHeaderField: "Content-Type")
    zF7nC3qL5pR2vT.setValue("1231243252523", forHTTPHeaderField: "deviceNo")

    let tYwP1zF6sM8vR2kq: [String: Any] = [
        "currentPage": 1,
        "pageSize": 6,
        "ids": NSNull()
    ]

    let xN8vK2pB5rL4dC = try JSONSerialization.data(withJSONObject: tYwP1zF6sM8vR2kq, options: [])
    guard let hL9dV3bQ2fK6sJ8p = String(data: xN8vK2pB5rL4dC, encoding: .utf8) else {
        throw NSError(domain: "LiveAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let cNf7kV3dB2mL5wS = hL9dV3bQ2fK6sJ8p.tYwP1zF6sM8vR2kq()
    zF7nC3qL5pR2vT.httpBody = cNf7kV3dB2mL5wS.data(using: .utf8)

    let (aZk1sL9qP8rT6vX, sT8kV3bQ1pL4dN7) = try await URLSession.shared.data(for: zF7nC3qL5pR2vT)
    
    guard let QwZ5rP8kL2vT1bS = sT8kV3bQ1pL4dN7 as? HTTPURLResponse, QwZ5rP8kL2vT1bS.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    
    let uibS8Zq2C1M4tLr = try JSONSerialization.jsonObject(with: aZk1sL9qP8rT6vX, options: [])
    guard let KxN7dV4oP9qL2rFh = uibS8Zq2C1M4tLr as? [String: Any],
          let shV4kL8pD3tN1bC = KxN7dV4oP9qL2rFh["result"] as? String else {
        return []
    }
    
    let fJ3yM6vD9sL1hP = shV4kL8pD3tN1bC.hL9dV3bQ2fK6sJ8p()
    guard let aB2mL5wScNf7kV3 = fJ3yM6vD9sL1hP.data(using: .utf8),
          let pR2vT4nC3qL5xN = try? JSONSerialization.jsonObject(with: aB2mL5wScNf7kV3, options: []),
          let rL2vT1bSQwZ5rP8 = pR2vT4nC3qL5xN as? [String: Any],
          let mK4tQ1bHVd9sL2 = rL2vT1bSQwZ5rP8["rows"] as? [[String: Any]] else {
        return []
    }
    
    return mK4tQ1bHVd9sL2
}



@MainActor
func hifylogin() async throws -> [String: Any] {
    
    // 1️⃣ 完整接口 URL（改成你实际 URL）
    guard let url = URL(string: "https://api.cphub.link/api/auth/login") else {
        throw URLError(.badURL)
    }
    
    // 2️⃣ 构建请求
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    
    // 3️⃣ Header
    
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    request.setValue("19C827EE0F4D477FBD918ED7F5F7445C", forHTTPHeaderField: "loginToken")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("1231243252523", forHTTPHeaderField: "deviceNo")
//    request.setValue("zh", forHTTPHeaderField: "Accept-Language")
//    request.setValue("en_US", forHTTPHeaderField: "language")
//    request.setValue("1768208868925", forHTTPHeaderField: "timestamp")
//    request.setValue("com.good.fun.happy", forHTTPHeaderField: "packageName")
//    request.setValue("Xiaomi----Redmi Note 8 Pro", forHTTPHeaderField: "deviceType")
//    request.setValue("10", forHTTPHeaderField: "osVersion")
//    request.setValue("AOS", forHTTPHeaderField: "osType")
//    request.setValue("false", forHTTPHeaderField: "isProxy")
//    request.setValue("0", forHTTPHeaderField: "Content-Length")
//    request.setValue("api.cphub.link", forHTTPHeaderField: "Host")
//    request.setValue("Keep-Alive", forHTTPHeaderField: "Connection")
//    request.setValue("gzip", forHTTPHeaderField: "Accept-Encoding")
//    request.setValue("JSESSIONID=35_6tDaM7UjIelU7p9f3sLsvmdd2lCiHpZR9Ii73", forHTTPHeaderField: "Cookie")
//    request.setValue("okhttp/5.0.0-alpha.6", forHTTPHeaderField: "User-Agent")
    
    
    
    // 4️⃣ Body
    let body: [String: Any] = [
        "platform": "GOOGLE",
        "openId": "",
        "userId":"",
        "email":"",
        "nickname":"",
        "icon":"",
        "gender":"",
        "countryId":"",
        "birthday":"",
        "picList":[]
       
    ]
    print("=== 请求 body ===")
    print(body)
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "LiveAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON 转 String 失败"])
    }
    
    // 3️⃣ 加密
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    // 5️⃣ 打印请求信息（调试）
    print("=== 请求 URL ===")
    print(request.url?.absoluteString ?? "")
    print("=== 请求 Header ===")
    print(request.allHTTPHeaderFields ?? "")
    print("=== 请求加密 Body ===")
    if let bodyString = String(data: request.httpBody!, encoding: .utf8) {
        print(bodyString)
    }
    
    // 6️⃣ 发送请求
    let (data, response) = try await URLSession.shared.data(for: request)
    
    // 7️⃣ 打印状态码
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
    // 8️⃣ 解析 JSON
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "LiveAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "返回数据不是字典"])
    }
    
    print("=== 返回 JSON ===")
    print(dict)
    
    return dict
}
