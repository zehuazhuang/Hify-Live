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
    guard let vD9sL2mK4tQ1bH = URL(string: "https://testaes.cphub.link/api/agora/live/newLive/queryLiveList") else {
        throw URLError(.badURL)
    }
    
    var zF7nC3qL5pR2vT = URLRequest(url: vD9sL2mK4tQ1bH)
    zF7nC3qL5pR2vT.httpMethod = "POST"
    
    zF7nC3qL5pR2vT.setValue("11111111", forHTTPHeaderField: "appId")
    zF7nC3qL5pR2vT.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    zF7nC3qL5pR2vT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "loginToken")
    zF7nC3qL5pR2vT.setValue("application/json", forHTTPHeaderField: "Content-Type")
    zF7nC3qL5pR2vT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "deviceNo")

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
   
    if(KxN7dV4oP9qL2rFh.int("code") != 0000){
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


//关注主播直播数据接口
@MainActor
func mK4tQ1bHVd9sL2() async throws -> [[String: Any]] {
    guard let rP8vT2kQwZ5bN = URL(string: "https://testaes.cphub.link/api/agora/live/newLive/follow/queryLiveList") else {
        throw URLError(.badURL)
    }
    
    var xN6vR2pB5lC4dT = URLRequest(url: rP8vT2kQwZ5bN)
    xN6vR2pB5lC4dT.httpMethod = "POST"
    
    xN6vR2pB5lC4dT.setValue("11111111", forHTTPHeaderField: "appId")
    xN6vR2pB5lC4dT.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    xN6vR2pB5lC4dT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "loginToken")
    xN6vR2pB5lC4dT.setValue("application/json", forHTTPHeaderField: "Content-Type")
    xN6vR2pB5lC4dT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "deviceNo")
    
   
    if let headers = xN6vR2pB5lC4dT.allHTTPHeaderFields {
        print("---请求头---")
        for (key, value) in headers {
            print("\(key): \(value)")
        }
    }

    let tYwP1zF6sM8vR2kq: [String: Any] = [
        "currentPage": 1,
        "pageSize": 6,
        "ids": NSNull()
    ]
    print("---body----")
    print(tYwP1zF6sM8vR2kq)

    let bV3mL5wScNf7kQ = try JSONSerialization.data(withJSONObject: tYwP1zF6sM8vR2kq, options: [])
    guard let cD9vT4pB2qL6rX = String(data: bV3mL5wScNf7kQ, encoding: .utf8) else {
        throw NSError(domain: "LiveAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let dF2rV7qP5kL1sM = cD9vT4pB2qL6rX.tYwP1zF6sM8vR2kq()
    xN6vR2pB5lC4dT.httpBody = dF2rV7qP5kL1sM.data(using: .utf8)

    let (eG1sL9qP8rT6vX, fH8kV3bQ1pL4dN7) = try await URLSession.shared.data(for: xN6vR2pB5lC4dT)
    
    guard let gJ2vT1bSQwZ5rP = fH8kV3bQ1pL4dN7 as? HTTPURLResponse, gJ2vT1bSQwZ5rP.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    
    let hK9dV3bQ2fL6sJ = try JSONSerialization.jsonObject(with: eG1sL9qP8rT6vX, options: [])
    guard let iL7dV4oP9qK2rF = hK9dV3bQ2fL6sJ as? [String: Any],
          let jM4kL8pD3tN1bC = iL7dV4oP9qK2rF["result"] as? String else {
        return []
    }
    print("------关注result------")
    print(jM4kL8pD3tN1bC)
    if(iL7dV4oP9qK2rF.int("code") != 0000){
        return []
    }
    
    let kN3yM6vD9sL1hP = jM4kL8pD3tN1bC.hL9dV3bQ2fK6sJ8p()
    guard let lO2mL5wScNf7kV = kN3yM6vD9sL1hP.data(using: .utf8),
          let mP2vT4nC3qL5xN = try? JSONSerialization.jsonObject(with: lO2mL5wScNf7kV, options: []),
          let nQ2vT1bSRlZ5rP = mP2vT4nC3qL5xN as? [String: Any],
          let oR4tQ1bHVd9sL2 = nQ2vT1bSRlZ5rP["rows"] as? [[String: Any]] else {
        return []
    }
    
    
    
    print("------关注------")
    print(oR4tQ1bHVd9sL2)
    return oR4tQ1bHVd9sL2
}


//获取当前时间格式"2025-12-24 17:16:15"
func xQY2CLEDWefw() -> String {
    let tZ8vM4RkX1 = DateFormatter()
    tZ8vM4RkX1.dateFormat = "yyyy-MM-dd HH:mm:ss"
    tZ8vM4RkX1.locale = Locale(identifier: "en_US_POSIX")
    let fH7sL2VqT9 = Date()
    return tZ8vM4RkX1.string(from: fH7sL2VqT9)
}

//搜索接口
@MainActor
func hifySearch(type: Int, searchValue: String) async throws -> [[String: Any]] {
    guard let url = URL(string: "https://testaes.cphub.link/api/search/newLive/query") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "loginToken")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("1231243252523", forHTTPHeaderField: "deviceNo")
    
    
    
    
    let body: [String: Any] = [
        "currentPage": 1,
        "pageSize": 6,
        "type":type,
        "searchTime":xQY2CLEDWefw(),
        "searchValue":searchValue,
    ]
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "SearchAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "SearchAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    // 解密 result
    guard let resultStr = dict["result"] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
    
    // 将 JSON 数据转换为数组
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }

    // 按 joinNum 从大到小排序
    let sortedArray = array.sorted { dict1, dict2 in
        let joinNum1 = dict1["joinNum"] as? Int ?? 0
        let joinNum2 = dict2["joinNum"] as? Int ?? 0
        return joinNum1 > joinNum2
    }

    
    
    return sortedArray
}
//获取rtctoken、rtmtoken
@MainActor
func getRtctoken() async throws -> [String: Any] {
    // 1️⃣ 构建 URL
    guard let url = URL(string: "https://testaes.cphub.link/api/index/getAgoraRtmToken") else {
        throw URLError(.badURL)
    }
    
    // 2️⃣ 构建请求
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "loginToken")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("1231243252523", forHTTPHeaderField: "deviceNo")
    
    // 3️⃣ 发送请求
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
    // 4️⃣ 解析返回 JSON
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "LiveAPI", code: -1, userInfo: [NSLocalizedDescriptionKey: "返回数据不是字典"])
    }
    
    // 5️⃣ 取出 result 并解密
    guard let result = dict["result"] as? String else {
        throw NSError(domain: "LiveAPI", code: -2, userInfo: [NSLocalizedDescriptionKey: "result 不存在或不是 String"])
    }
    
    let decryptedString = result.hL9dV3bQ2fK6sJ8p()
    
    // 6️⃣ 将解密后的字符串转为 Data
    guard let resultData = decryptedString.data(using: .utf8) else {
        throw NSError(domain: "LiveAPI", code: -3, userInfo: [NSLocalizedDescriptionKey: "解密字符串转 Data 失败"])
    }
    
    // 7️⃣ 将 Data 转 JSON
    let resultJson = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let resultDict = resultJson as? [String: Any] else {
        throw NSError(domain: "LiveAPI", code: -4, userInfo: [NSLocalizedDescriptionKey: "解密后的数据不是字典"])
    }
    
    // ✅ 直接返回解密后的字典
    return resultDict
}


//加入直播 获取主播信息
@MainActor
func joinlive(pmpresoZUid: Int) async throws -> [String: Any] {

    guard let url = URL(string: "https://testaes.cphub.link/api/agora/live/getRoomAndJoinRoomV2") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    request.setValue(
        ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA,
        forHTTPHeaderField: "loginToken"
    )
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("1231243252523", forHTTPHeaderField: "deviceNo")

    let body: [String: Any] = [
        "anchorId": pmpresoZUid,
        "type": 1
    ]

    let jsonData = try JSONSerialization.data(withJSONObject: body)
    let jsonString = String(decoding: jsonData, as: UTF8.self)

    // 加密
    request.httpBody = jsonString
        .tYwP1zF6sM8vR2kq()
        .data(using: .utf8)

    let (data, response) = try await URLSession.shared.data(for: request)

    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }

    // 解析外层 JSON
    let json = try JSONSerialization.jsonObject(with: data)
    guard let dict = json as? [String: Any],
          let encryptedResult = dict["result"] as? String
    else {
        throw NSError(domain: "LiveAPI", code: -2, userInfo: [
            NSLocalizedDescriptionKey: "result 不存在或类型错误"
        ])
    }

    // 解密
    let decryptedString = encryptedResult.hL9dV3bQ2fK6sJ8p()

    // 转成最终字典
    guard let resultData = decryptedString.data(using: .utf8),
          let resultJson = try JSONSerialization.jsonObject(
              with: resultData
          ) as? [String: Any]
    else {
        throw NSError(domain: "LiveAPI", code: -3, userInfo: [
            NSLocalizedDescriptionKey: "解密数据解析失败"
        ])
    }

    return resultJson
}


//关注 (uid,1关注 2取消)
@MainActor
func fol6W9ZQ4xC2(uY2M8A4E7C0xL: Int, iA6M7W9EYL0: Int) async throws -> Bool {
    
    // 1️⃣ 构建 URL
    guard let url = URL(string: "https://testaes.cphub.link/api/user/followUser") else {
        throw URLError(.badURL)
    }
    
    // 2️⃣ 构建请求
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "loginToken")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "deviceNo")
    
    let body: [String: Any] = [
        "followUserId": uY2M8A4E7C0xL,
        "followType": iA6M7W9EYL0
    ]
    print("------body------")
    print(body)
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON 转 String 失败"])
    }
    
    // 3️⃣ 加密
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    // 4️⃣ 发送请求
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
    // 5️⃣ 解析返回 JSON
    guard
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        let code = jsonObject["code"] as? String
    else {
        return false
    }
    
    if(code == "0000"){
        vf0AD3wYQxpfxxjs2pE7PuO66Wls(2)
        vf0AD3wYQxpfxxjs2pE7PuO66Wls(3)
        
        if(iA6M7W9EYL0 == 1){
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("K5WuoRBCSxi+hTLxteToML8HCLwetEmS+BtoY1tjyJY=")
        }else{
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("EMnULaLM6ZF45iH0cANSKQ==")
        }
    }
    
    // ✅ 返回 true 如果 code 等于 "0000"
    return code == "0000"
}


//鉴黄图片
@MainActor
func jhM2W7E8YxL(mosh4E7CxL: String) async throws -> Bool {
    
    // 1️⃣ 构建 URL
    guard let url = URL(string: "https://testaes.cphub.link/api/anchor/checkCoverImg") else {
        throw URLError(.badURL)
    }
    
    // 2️⃣ 构建请求
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("11111111", forHTTPHeaderField: "appId")
    request.setValue("1.0.1", forHTTPHeaderField: "appVersion")
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "loginToken")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "deviceNo")
    
    let body: [String: Any] = [
        "searchValue": mosh4E7CxL,
    ]
    print("------body------")
    print(body)
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "JSON 转 String 失败"])
    }
    
    // 3️⃣ 加密
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    // 4️⃣ 发送请求
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
    // 5️⃣ 解析返回 JSON
    guard
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        let code = jsonObject["code"] as? String
    else {
        return false
    }
    print(jsonObject)
  
    
    // ✅ 返回 true 如果 code 等于 "0000"
    return code == "0000"
}
