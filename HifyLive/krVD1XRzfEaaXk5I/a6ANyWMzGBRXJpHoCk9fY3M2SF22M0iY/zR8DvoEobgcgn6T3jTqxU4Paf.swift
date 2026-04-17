import Foundation
import NIMSDK

struct JOGtDnYupP {
    //正式
    static let loaattrdbUrl = "hUeOnMhj7nu7AePEAoih4UAD9NQ5SJ+orijLXgNlvHM=".bFHEatcgE4zzU9TCfDonsu()
    static let raslidepApId = "Su2KJTUdnyjpaOMmKWpp9A==".bFHEatcgE4zzU9TCfDonsu()
    static let versLErqSu = "FNhflfN/d1l7671FUc7GrA==".bFHEatcgE4zzU9TCfDonsu()
    static let zMVMMyTmNK = "nxI8qTO1K0saYv2rTkG64DG5b5qkt6FMDQdxymtl+FqDQoXzB1YxPjRW35ly0xPu".bFHEatcgE4zzU9TCfDonsu()

}


//直播数据接口
@MainActor
func rP6kV1bS8qX3nT7() async throws -> [[String: Any]] {
    guard let vD9sL2mK4tQ1bH = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("E573kwZWm8b86Uv3xS3ayqIWMexb6mzWo2W6lOX3BkfPzXC84QKrTcP67WBS9ahq".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    var zF7nC3qL5pR2vT = URLRequest(url: vD9sL2mK4tQ1bH)
    zF7nC3qL5pR2vT.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    
    zF7nC3qL5pR2vT.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    zF7nC3qL5pR2vT.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    zF7nC3qL5pR2vT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    zF7nC3qL5pR2vT.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    zF7nC3qL5pR2vT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())

    let tYwP1zF6sM8vR2kq: [String: Any] = [
        "IvtwcNnKT3M5bmqWC3CtlA==".bFHEatcgE4zzU9TCfDonsu(): 1,
        "VJ5ftfTLdSzoovjC+oZ3Zg==".bFHEatcgE4zzU9TCfDonsu(): 6,
        "s9h1LCG8/8oEmlS5VErS+Q==".bFHEatcgE4zzU9TCfDonsu(): NSNull()
    ]

    let xN8vK2pB5rL4dC = try JSONSerialization.data(withJSONObject: tYwP1zF6sM8vR2kq, options: [])
    guard let hL9dV3bQ2fK6sJ8p = String(data: xN8vK2pB5rL4dC, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let cNf7kV3dB2mL5wS = hL9dV3bQ2fK6sJ8p.tYwP1zF6sM8vR2kq()
    zF7nC3qL5pR2vT.httpBody = cNf7kV3dB2mL5wS.data(using: .utf8)

    let (aZk1sL9qP8rT6vX, sT8kV3bQ1pL4dN7) = try await URLSession.shared.data(for: zF7nC3qL5pR2vT)
    
    guard let QwZ5rP8kL2vT1bS = sT8kV3bQ1pL4dN7 as? HTTPURLResponse, QwZ5rP8kL2vT1bS.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    
    let uibS8Zq2C1M4tLr = try JSONSerialization.jsonObject(with: aZk1sL9qP8rT6vX, options: [])
    guard let KxN7dV4oP9qL2rFh = uibS8Zq2C1M4tLr as? [String: Any],
          let shV4kL8pD3tN1bC = KxN7dV4oP9qL2rFh["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String else {
        return []
    }
   
    if(KxN7dV4oP9qL2rFh.int("Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()) != 0000){
        return []
    }
    
    let fJ3yM6vD9sL1hP = shV4kL8pD3tN1bC.hL9dV3bQ2fK6sJ8p()
    guard let aB2mL5wScNf7kV3 = fJ3yM6vD9sL1hP.data(using: .utf8),
          let pR2vT4nC3qL5xN = try? JSONSerialization.jsonObject(with: aB2mL5wScNf7kV3, options: []),
          let rL2vT1bSQwZ5rP8 = pR2vT4nC3qL5xN as? [String: Any],
          let mK4tQ1bHVd9sL2 = rL2vT1bSQwZ5rP8["rvVPaJpgoPTYIKGOQpyEOw==".bFHEatcgE4zzU9TCfDonsu()] as? [[String: Any]] else {
        return []
    }

    return mK4tQ1bHVd9sL2
}


//关注主播直播数据接口
@MainActor
func mK4tQ1bHVd9sL2() async throws -> [[String: Any]] {
    guard let rP8vT2kQwZ5bN = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("E573kwZWm8b86Uv3xS3ayhvtX/kEYVGT//bEQ0TQ4EjTqy7O3eVpk6DI7NSYOrD9".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    var xN6vR2pB5lC4dT = URLRequest(url: rP8vT2kQwZ5bN)
    xN6vR2pB5lC4dT.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    
    xN6vR2pB5lC4dT.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    xN6vR2pB5lC4dT.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    xN6vR2pB5lC4dT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    xN6vR2pB5lC4dT.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    xN6vR2pB5lC4dT.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())


    let tYwP1zF6sM8vR2kq: [String: Any] = [
        "IvtwcNnKT3M5bmqWC3CtlA==".bFHEatcgE4zzU9TCfDonsu(): 1,
        "VJ5ftfTLdSzoovjC+oZ3Zg==".bFHEatcgE4zzU9TCfDonsu(): 6,
        "s9h1LCG8/8oEmlS5VErS+Q==".bFHEatcgE4zzU9TCfDonsu(): NSNull()
    ]


    let bV3mL5wScNf7kQ = try JSONSerialization.data(withJSONObject: tYwP1zF6sM8vR2kq, options: [])
    guard let cD9vT4pB2qL6rX = String(data: bV3mL5wScNf7kQ, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let dF2rV7qP5kL1sM = cD9vT4pB2qL6rX.tYwP1zF6sM8vR2kq()
    xN6vR2pB5lC4dT.httpBody = dF2rV7qP5kL1sM.data(using: .utf8)

    let (eG1sL9qP8rT6vX, fH8kV3bQ1pL4dN7) = try await URLSession.shared.data(for: xN6vR2pB5lC4dT)
    
    guard let gJ2vT1bSQwZ5rP = fH8kV3bQ1pL4dN7 as? HTTPURLResponse, gJ2vT1bSQwZ5rP.statusCode == 200 else {
        throw URLError(.badServerResponse)
    }
    
    let hK9dV3bQ2fL6sJ = try JSONSerialization.jsonObject(with: eG1sL9qP8rT6vX, options: [])
    guard let iL7dV4oP9qK2rF = hK9dV3bQ2fL6sJ as? [String: Any],
          let jM4kL8pD3tN1bC = iL7dV4oP9qK2rF["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String else {
        return []
    }

    if(iL7dV4oP9qK2rF.int("Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()) != 0000){
        return []
    }
    
    let kN3yM6vD9sL1hP = jM4kL8pD3tN1bC.hL9dV3bQ2fK6sJ8p()

    guard let lO2mL5wScNf7kV = kN3yM6vD9sL1hP.data(using: .utf8),
          let mP2vT4nC3qL5xN = try? JSONSerialization.jsonObject(with: lO2mL5wScNf7kV, options: []),
          let nQ2vT1bSRlZ5rP = mP2vT4nC3qL5xN as? [String: Any],
          let oR4tQ1bHVd9sL2 = nQ2vT1bSRlZ5rP["rvVPaJpgoPTYIKGOQpyEOw==".bFHEatcgE4zzU9TCfDonsu()] as? [[String: Any]] else {
        return []
    }
    
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
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("HDx5VUblGbM4SrafLLYl9I3qNaapwxM3EXoPXjvndrE=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    
    
    
    let body: [String: Any] = [
        "IvtwcNnKT3M5bmqWC3CtlA==".bFHEatcgE4zzU9TCfDonsu(): 1,
        "VJ5ftfTLdSzoovjC+oZ3Zg==".bFHEatcgE4zzU9TCfDonsu(): 6,
        "LwIiTP4Kb0lJgLdJnsi2xQ==".bFHEatcgE4zzU9TCfDonsu():type,
        "U5TIn0ZZBRLXWp1MbKWpTg==".bFHEatcgE4zzU9TCfDonsu():xQY2CLEDWefw(),
        "SREY1Qm89GjDk9QVrd/CJg==".bFHEatcgE4zzU9TCfDonsu():searchValue,
    ]
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
    
    
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    let sortedArray = array.sorted { dict1, dict2 in
        let joinNum1 = dict1["YRs/d9bnpzZzXTrRWvVS4A==".bFHEatcgE4zzU9TCfDonsu()] as? Int ?? 0
        let joinNum2 = dict2["YRs/d9bnpzZzXTrRWvVS4A==".bFHEatcgE4zzU9TCfDonsu()] as? Int ?? 0
        return joinNum1 > joinNum2
    }
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        return sortedArray
    } else {
        return []
    }
}
//获取rtctoken、rtmtoken
@MainActor
func getRtctoken() async throws -> [String: Any] {
    
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("WbA4U4WPG9mAkp7gzaIGhhhgE1kTZfe2GdTNxwU/ST8=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    
    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
 
    guard let result = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String else {
        throw NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let decryptedString = result.hL9dV3bQ2fK6sJ8p()
    
   
    guard let resultData = decryptedString.data(using: .utf8) else {
        throw NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
   
    let resultJson = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let resultDict = resultJson as? [String: Any] else {
        throw NSError(domain: "", code: -4, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    if let mO4ZvxOwa = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, mO4ZvxOwa == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        return resultDict
    }else{
        return [:]
    }
    
}


//加入直播 获取主播信息
@MainActor
func joinlive(pmpresoZUid: Int) async throws -> [String: Any] {

    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("E573kwZWm8b86Uv3xS3aylxQO1dZvMTdtmdwJLUi28cPsBTD+ZpPatgrsOz2FFC6".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(
        ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA,
        forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu()
    )
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())

    let body: [String: Any] = [
        "lxa3P2YZrWDgD6uY7+l4/Q==".bFHEatcgE4zzU9TCfDonsu(): pmpresoZUid,
        "LwIiTP4Kb0lJgLdJnsi2xQ==".bFHEatcgE4zzU9TCfDonsu(): 1
    ]
    


    let jsonData = try JSONSerialization.data(withJSONObject: body)
    let jsonString = String(decoding: jsonData, as: UTF8.self)

  
    request.httpBody = jsonString
        .tYwP1zF6sM8vR2kq()
        .data(using: .utf8)
    
    let (data, response) = try await URLSession.shared.data(for: request)

    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }

  
    let json = try JSONSerialization.jsonObject(with: data)
  
    guard let dict = json as? [String: Any],
          let encryptedResult = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String
    else {
        throw NSError(domain: "", code: -2, userInfo: [
            NSLocalizedDescriptionKey: "error"
        ])
    }

  
    let decryptedString = encryptedResult.hL9dV3bQ2fK6sJ8p()


    guard let resultData = decryptedString.data(using: .utf8),
          let resultJson = try JSONSerialization.jsonObject(
              with: resultData
          ) as? [String: Any]
    else {
        throw NSError(domain: "", code: -3, userInfo: [
            NSLocalizedDescriptionKey: "error"
        ])
    }
    
    if let mO4ZvxOwa = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, mO4ZvxOwa == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        return resultJson
    }else{
        throw NSError(domain: "", code: -4, userInfo: [
            NSLocalizedDescriptionKey: "error"
        ])
    }
}


//关注 (uid,1关注 2取消)
@MainActor
func fol6W9ZQ4xC2(uY2M8A4E7C0xL: Int, iA6M7W9EYL0: Int) async throws -> Bool {
    
    // 1️⃣ 构建 URL
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("Ax+One5OZLxypA3n9ZqrTHJJ1ZEzLjrxPPGLBCuA4W4=".bFHEatcgE4zzU9TCfDonsu())") else {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        throw URLError(.badURL)
    }
    
    // 2️⃣ 构建请求
    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "NNdyvMdOH/zmP/saWwMdIQ==".bFHEatcgE4zzU9TCfDonsu(): uY2M8A4E7C0xL,
        "fqrrNYpGSh2B/k2WUp813Q==".bFHEatcgE4zzU9TCfDonsu(): iA6M7W9EYL0
    ]
    
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
   
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
   
    guard
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        let code = jsonObject["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String
    else {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        return false
    }
    
    if(code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu()){
        
        vf0AD3wYQxpfxxjs2pE7PuO66Wls(2)
        vf0AD3wYQxpfxxjs2pE7PuO66Wls(3)
        
        if(iA6M7W9EYL0 == 1){
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("QFJcutXym5Ujoe4qASpA0w==",type: 0)
        }else{
            await FollowingCache.shared.loadFollowing(forceRefresh: true)
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("EMnULaLM6ZF45iH0cANSKQ==",type: 0)
        }
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
    }
    
    
    return code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu()
}


//鉴黄图片
@MainActor
func jhM2W7E8YxL(mosh4E7CxL: String) async throws -> Bool {
    
    // 1️⃣ 构建 URL
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("zVx581n5cqfkXzvFlW2TTxVKpN3sQerlRVpg1F0Q9xk=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    // 2️⃣ 构建请求
    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("application/json", forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "SREY1Qm89GjDk9QVrd/CJg==".bFHEatcgE4zzU9TCfDonsu(): mosh4E7CxL,
    ]
    
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }

   
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
   
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    

    guard
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        let code = jsonObject["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String
    else {
        return false
    }

    
    if (code != "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu()){
        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("p406yIqFNP66yyym3aest2AnEw1t8jrp/TIHdHnoGUYmdgvqL5OeFo9H2bo20ZiU",type: 1)
    }
  
    
   
    return code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu()
}


//根据Uid搜索对应room
@MainActor
func lyrijivecSearch(surlibateUid: Int) async throws -> [String: Any] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("E573kwZWm8b86Uv3xS3aypdEAOdVv6D3L/Hz/Porn9lO/i2XP4L0W8yIvZKt73ZZ".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    
    let body: [String: Any] = [
        "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu(): surlibateUid,
    ]

    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    if let httpResponse = response as? HTTPURLResponse {
        print("HTTP Status Code:", httpResponse.statusCode)
    }
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
  

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }
    

    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        
        let resultJson = try JSONSerialization.jsonObject(with: resultData, options: [])
       

        guard let resultDict = resultJson as? [String: Any] else {
            throw NSError(
                domain: "",
                code: -2,
                userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()]
            )
        }
     
        return resultDict
    } else {
        return [:]
    }
}




//查关注、粉丝
@MainActor
func rEh36ZSearch(ovlkoBKType: Int) async throws -> [[String: Any]] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("gwkJDSPvuIdbiSZMMSMa6kOJyXJzNPfmTnk8iPCNnFY=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "LwIiTP4Kb0lJgLdJnsi2xQ==".bFHEatcgE4zzU9TCfDonsu(): ovlkoBKType,
        "U5TIn0ZZBRLXWp1MbKWpTg==".bFHEatcgE4zzU9TCfDonsu():xQY2CLEDWefw()
    ]
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }

    
    // 解密 result
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
    
    // 将 JSON 数据转换为数组
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        return array
    } else {
        return []
    }
}


////操作diamondNum
//@MainActor
//func k8VJeG1rEJh4(ovlkoBKType: Int) async throws -> Bool {
//    guard let qp7bKcVf = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("zoMQeTZXG+yBBEZ4f/nzsV01BeJTKGjREJeJx72cPZk=".bFHEatcgE4zzU9TCfDonsu())") else {
//        throw URLError(.badURL)
//    }
//
//    var sx4vHtQw = URLRequest(url: qp7bKcVf)
//    sx4vHtQw.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
//    sx4vHtQw.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
//    
//    let df9kPl3w: [String: Any] = [
//        "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu(): IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()),
//        "V6H5VEfPt0tf1pc8UPrGgw==".bFHEatcgE4zzU9TCfDonsu():ovlkoBKType
//    ]
//    
//    let xn2fQp8d = try JSONSerialization.data(withJSONObject: df9kPl3w, options: [])
//    guard let zk5vRt1y = String(data: xn2fQp8d, encoding: .utf8) else {
//        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
//    }
//    
//    let mv3wLp8c = zk5vRt1y.tYwP1zF6sM8vR2kq()
//    sx4vHtQw.httpBody = mv3wLp8c.data(using: .utf8)
//
//    
//    let (data, _) = try await URLSession.shared.data(for: sx4vHtQw)
//    
//    let hx1nVz6s = try JSONSerialization.jsonObject(with: data, options: [])
//    guard let bk4pWr9f = hx1nVz6s as? [String: Any] else {
//        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
//    }
//
//
//    
//    if let code = bk4pWr9f["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
//        return true
//    } else {
//        return false
//    }
//}

////查对应diamondNum
//@MainActor
//func s9EAe7DPKU() async throws -> Int {
//    guard let qp7bKcVf = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("VQngpohv2RSvWRMjWFCviO2m7x3tQCC3IHa9QlYX458=".bFHEatcgE4zzU9TCfDonsu())") else {
//        throw URLError(.badURL)
//    }
//
//    var sx4vHtQw = URLRequest(url: qp7bKcVf)
//    sx4vHtQw.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
//    sx4vHtQw.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
//    sx4vHtQw.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
//    
//    let df9kPl3w: [String: Any] = [
//        "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu(): IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())
//    ]
//    
//    let xn2fQp8d = try JSONSerialization.data(withJSONObject: df9kPl3w, options: [])
//    guard let zk5vRt1y = String(data: xn2fQp8d, encoding: .utf8) else {
//        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
//    }
//    
//    let mv3wLp8c = zk5vRt1y.tYwP1zF6sM8vR2kq()
//    sx4vHtQw.httpBody = mv3wLp8c.data(using: .utf8)
//
//    
//    let (data, _) = try await URLSession.shared.data(for: sx4vHtQw)
//    
//    let hx1nVz6s = try JSONSerialization.jsonObject(with: data, options: [])
//    guard let bk4pWr9f = hx1nVz6s as? [String: Any] else {
//        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "error"])
//    }
//    
//    guard let resultStr = bk4pWr9f["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String else {
//        return 0
//    }
//    let decryptedStr = resultStr.hL9dV3bQ2fK6sJ8p()
//  
//   
//    
//    
//    if let code = bk4pWr9f["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
//        return Int(decryptedStr) ?? 0
//    } else {
//        return 0
//    }
//}

//ai接口   /api/dash/scope/textIssues
//@MainActor
//func wUxKwoiMSH(a8rLStnIHfC:String) async throws -> String {
//    guard let aKizfGAB = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("GsFnPc2X/f7aobXnr93oYhJECxk2fnEwep2XUN5J2OI=".bFHEatcgE4zzU9TCfDonsu())") else {
//        throw URLError(.badURL)
//    }
//
//    var q8HYFTfoEX = URLRequest(url: aKizfGAB)
//    q8HYFTfoEX.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
//    q8HYFTfoEX.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
//    q8HYFTfoEX.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
//    q8HYFTfoEX.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
//    q8HYFTfoEX.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
//    q8HYFTfoEX.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
//    
//    let mgtlJjJSofF: [String: Any] = [
//        "4Rl+wufvcznO+bhiRa+zXjg0I2UFlBTK+hd+veBNd1E=".bFHEatcgE4zzU9TCfDonsu(): [
//            [
//                "5Y6kajBzgPKbZLt9h1OljA==".bFHEatcgE4zzU9TCfDonsu(): "nCzjHJjY69lAFGPPmCjEzQ==".bFHEatcgE4zzU9TCfDonsu(),
//                "9GjQB6+Z9mTzYtBA8hOn6Q==".bFHEatcgE4zzU9TCfDonsu(): "\("Xv8VvYtj06m87PXiCV5M1tErUTOfO6yezHGMxqUVqEA=".bFHEatcgE4zzU9TCfDonsu())\(a8rLStnIHfC)\("hGYCO2OIRBQJKOF/1RYmlowhzhI7QCJuI+QFFuFQock=".bFHEatcgE4zzU9TCfDonsu())"
//            ]
//        ]
//    ]
//    
//    let nl9URJeD = try JSONSerialization.data(withJSONObject: mgtlJjJSofF, options: [])
//    guard let rJUtlIfFAN = String(data: nl9URJeD, encoding: .utf8) else {
//        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
//    }
//    
//    let yZyWJII7f = rJUtlIfFAN.tYwP1zF6sM8vR2kq()
//    q8HYFTfoEX.httpBody = yZyWJII7f.data(using: .utf8)
//
//    
//    let (data, _) = try await URLSession.shared.data(for: q8HYFTfoEX)
//    
//    let bkIbzQNjMHU = try JSONSerialization.jsonObject(with: data, options: [])
//    guard let b69TDVhU0 = bkIbzQNjMHU as? [String: Any] else {
//        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
//    }
//    
//    
//    guard let eNquEsbDi6 = b69TDVhU0["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String else {
//        return "Xv6RKs+UxeU5aJDX7m/RjFX+PO67XYwKC5iPRGoEaiU=".bFHEatcgE4zzU9TCfDonsu()
//    }
//    let decryptedStr = eNquEsbDi6.hL9dV3bQ2fK6sJ8p()
//    
//    
// 
//    
//    if let mO4ZvxOwa = b69TDVhU0["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, mO4ZvxOwa == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
//        if let tyid8UPwr = decryptedStr.data(using: .utf8),
//           let fwJQ2HDJ = try? JSONSerialization.jsonObject(with: tyid8UPwr) as? [String: Any],
//           let s8lP3rvX29O: String = fwJQ2HDJ.value(forKeyPath: ["L0x3eyhy70hdb4VYAhL4hQ==".bFHEatcgE4zzU9TCfDonsu(), "giIPfy109z/WpyvBOHxdyA==".bFHEatcgE4zzU9TCfDonsu(), "cEDWduQ1VqtBgK+zD7aenQ==".bFHEatcgE4zzU9TCfDonsu(), "mLRgXS56CMuxNqQyFKVnbA==".bFHEatcgE4zzU9TCfDonsu(), "9GjQB6+Z9mTzYtBA8hOn6Q==".bFHEatcgE4zzU9TCfDonsu()]) {
//          
//            return s8lP3rvX29O
//        }else{
//            return "Xv6RKs+UxeU5aJDX7m/RjFX+PO67XYwKC5iPRGoEaiU=".bFHEatcgE4zzU9TCfDonsu()
//        }
//    } else {
//        return "Xv6RKs+UxeU5aJDX7m/RjFX+PO67XYwKC5iPRGoEaiU=".bFHEatcgE4zzU9TCfDonsu()
//    }
//}

//获取支付列表
@MainActor
func gtR8YJncg8Z() async throws -> [String: Any] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("rnECuXUKaPBVAC3uFs/9EGTewiwsokzuTpDHvYstRYw=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "SREY1Qm89GjDk9QVrd/CJg==".bFHEatcgE4zzU9TCfDonsu():"OO6n+r7uRyPm5LuKCU8HYA==".bFHEatcgE4zzU9TCfDonsu()
    ]
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    let (data, _) = try await URLSession.shared.data(for: request)
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }

    let resultObject = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let resultDict = resultObject as? [String: Any] else {
        return [:]
    }
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        
        return resultDict
    } else {
        return [:]
    }
}


//创建支付订单
@MainActor
func vaBBMmyXOh(jYPvECldH:Int,xsqZJWxTw:Int,vyLi1B0zU7:String,nVsTUsf:String,x8TX0Ex45:String,
                eLhfV9aP:Int,qXGyOYr2a:Int,vsbJYss443E:String,qNZY7Dy4i:String,
                tUdgDq4mC:Int,oCKpEiNR4O:String,vFlR9vnX64:String,s9Pxt3Yh9:Int) async throws -> [String: Any] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("DaeCFOl48YmdabIwqtJTxE7hKXNYOSlTXz1A2OnhCa0=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "vF8UUYn4x9Kig9AZnl/0RQ==".bFHEatcgE4zzU9TCfDonsu(): jYPvECldH,
        "Vd5UztnKvYIrlYbNri6mWQ==".bFHEatcgE4zzU9TCfDonsu(): xsqZJWxTw,
        "6mYZrNXFL3zTQn+clczoFIRVdaI63JzcWkhR5wHskiU=".bFHEatcgE4zzU9TCfDonsu(): vyLi1B0zU7,
        "GlmwyCz1h1ASuLA2ZmlotA==".bFHEatcgE4zzU9TCfDonsu(): nVsTUsf,
        "HO9e8o+W6BuM4CAAya5CSFGMQXXne/ar6AaQcGthm7Y=".bFHEatcgE4zzU9TCfDonsu(): x8TX0Ex45,
        "Kkw7ft83Gi9kxDE3pVyxtw==".bFHEatcgE4zzU9TCfDonsu():eLhfV9aP,
        "i8JRDFtSh8BimP7LP8iRiQ==".bFHEatcgE4zzU9TCfDonsu():qXGyOYr2a,
        "Hf8BMDJuVLRbByPmlQq9pw==".bFHEatcgE4zzU9TCfDonsu(): vsbJYss443E,
        "PqPeomvLKiUNwpPKC8OydA==".bFHEatcgE4zzU9TCfDonsu():qNZY7Dy4i,
        "1HbnSrDHJcm4QTALN+qSpQ==".bFHEatcgE4zzU9TCfDonsu():tUdgDq4mC,
        "K8C1mMpTgWFmLFmLBtigKQ==".bFHEatcgE4zzU9TCfDonsu():oCKpEiNR4O,
        "RH0qR/vpbT6eag00qg8x/g==".bFHEatcgE4zzU9TCfDonsu():vFlR9vnX64,
        "na5tsuEh23O8sY4sGzaIZg==".bFHEatcgE4zzU9TCfDonsu():s9Pxt3Yh9
    ]
    
 
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
   

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }


    let resultObject = try JSONSerialization.jsonObject(with: resultData, options: [])
   
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
    
        return resultObject as? [String: Any] ?? [:]
    } else {
      
        return [:]
    }
}

//表单验证
@MainActor
func n3Qw6R9Xb1K(kL2Q7ZxM8R:String,z8Y1QxL4Z8v:String,x8V6N2kL9MZ:String) async throws -> Bool {
    guard let url = URL(string: "0gpxpFDPBNTADaY9hV0iaAbVUUtr+8hLZM3D6ruAISX0V01wMFZzUCisEMtU58p4".bFHEatcgE4zzU9TCfDonsu()) else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "DHIR6pFApaU06VPrfMdaGw==".bFHEatcgE4zzU9TCfDonsu(): kL2Q7ZxM8R,
        "0JuhSq/qM2jgPlG6WOQcSg==".bFHEatcgE4zzU9TCfDonsu(): z8Y1QxL4Z8v,
        "ZpYl4txjdVqZ1ILQHr+SQA==".bFHEatcgE4zzU9TCfDonsu(): x8V6N2kL9MZ,
    ]
    
  
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
   
  
    

    
   
    
    

    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        return true
    } else {
        return false
    }
}

//查用户信息 目前用来更新钻石数量
@MainActor
func ks5LJq4BIxOAX() async throws -> [String: Any] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("gwkJDSPvuIdbiSZMMSMa6nqC3rKE3+qsHYeGVuBnHPc=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    
    let body: [String: Any] = [
        "xR6igx82ef56y6Xya7xWkA==".bFHEatcgE4zzU9TCfDonsu(): 2,
        "U5TIn0ZZBRLXWp1MbKWpTg==".bFHEatcgE4zzU9TCfDonsu(): xQY2CLEDWefw(),
    ]
    
  
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
   

    guard let resultStr = dict["result"] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }
    

    let resultObject = try JSONSerialization.jsonObject(with: resultData, options: [])
   
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
     
        return resultObject as? [String: Any] ?? [:]
    } else {
      
        return [:]
    }
}


//查钻石变动记录
@MainActor
func bRW4jX3umRIh(kQ6F7mX3:Int,yCvCoRXOXp:String) async throws -> [[String: Any]] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("9E0t0Mw7i43QepfSwVzZmQ9p+CM1j+5QlvxHx1enH0/MjkNhFuWGx47uczIYBcem".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "DXekK+6CObCO752piMsUGA==".bFHEatcgE4zzU9TCfDonsu():kQ6F7mX3,
        "VJ5ftfTLdSzoovjC+oZ3Zg==".bFHEatcgE4zzU9TCfDonsu():"ECCWfXjao9urJwluriPYgA==".bFHEatcgE4zzU9TCfDonsu(),
        "VgTe2eF3pjDXNZk2aeQdJw==".bFHEatcgE4zzU9TCfDonsu():yCvCoRXOXp,
    ]
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }


    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
   

    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
       
        return array
    } else {
        return []
    }
}


//获取礼物接口
@MainActor
func cTiuphrpj0WxFn(pX8YxxAkBf:String,bDXCgArl3:Int?) async throws -> [String: Any] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("bHY+fjm1mmzRt//2CkxNF1hFSVkhLQWzyKIjdDDnxB8=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    var body: [String: Any] = [
        "Xl0L3bYF+dlnaUWeqj7fXw==".bFHEatcgE4zzU9TCfDonsu(): pX8YxxAkBf
    ]

    if pX8YxxAkBf == "O1nHuxRaSAQKliEvbi2Big==".bFHEatcgE4zzU9TCfDonsu() {
        body["/IpTQQDboINqwLVA4KXlGA==".bFHEatcgE4zzU9TCfDonsu()] = bDXCgArl3
    }
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }

    
    guard let rhCuiF2Z = json as? [String: Any] else { return [:] }
    
   
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }
    
   
   
    
    
   
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let dict = resultArray as? [String: Any] else { return [:] }

    guard let giftList = dict["6Jb8gMqG988Ih51nmMJKTw==".bFHEatcgE4zzU9TCfDonsu()] as? [String: Any] else { return [:] }
    

    if let code = rhCuiF2Z["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
    
        return giftList
    } else {
        return [:]
    }
}


//礼物打赏
@MainActor
func zIOvUXp0PFIa(nA9jTgkiq:String,xD0brNNV4C:Int,gdmasRe0BC:Int,xLZR0tX7pimL:String,uAcDaiEtw:String,vxDqzCuq:String,
                  jKcu69C:String,c7LgmQQhS:Int,pE5bbtQ8Hb:Int) async throws -> Int {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("bHY+fjm1mmzRt//2CkxNFwat03Fb8EFRjPckVeC7chg=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    var body: [String: Any] = [
        "HKd/L3NovhrAFZdHjyoJDg==".bFHEatcgE4zzU9TCfDonsu():nA9jTgkiq,
        "Zz4Ykfa/0Kfx39dJIdDSiA==".bFHEatcgE4zzU9TCfDonsu():xD0brNNV4C,
        "yVe9bzMjVIPdyNfg7PFs0w==".bFHEatcgE4zzU9TCfDonsu():gdmasRe0BC,
        "Xl0L3bYF+dlnaUWeqj7fXw==".bFHEatcgE4zzU9TCfDonsu():xLZR0tX7pimL,
    ]
    
    if xLZR0tX7pimL == "yJe4LdZ6Bse2OtV+AhIKoA==".bFHEatcgE4zzU9TCfDonsu() {
        body["xwwIVSmbj0x7rMKxW2Xx8A==".bFHEatcgE4zzU9TCfDonsu()] = uAcDaiEtw
    }
    
    
   
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)
    
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    

   
    
    guard let yPN3u1oIU = json as? [String: Any] else { return -1 }
    

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return -1
    }
    

    let result = try JSONSerialization.jsonObject(with: resultData, options: []) as? [String: Any]
  
    
    if let code = yPN3u1oIU["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {

       
        return (result?["V6H5VEfPt0tf1pc8UPrGgw==".bFHEatcgE4zzU9TCfDonsu()] as? Int) ?? -1
    } else {
        return -1
    }
}


//查直播间大哥位 Top3
@MainActor
func luJfveDVkRb(pQO2dnNxqK:Int) async throws -> [[String: Any]] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("bHY+fjm1mmzRt//2CkxNFzhZlqY07NQ1NjPhTjsxWkY=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "pk4uxc9YUdeI/GYSkbOtUg==".bFHEatcgE4zzU9TCfDonsu():pQO2dnNxqK,
    ]
    

    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
  

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
   

    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
       
        return array
    } else {
        return []
    }
}


//查主播在线用户列表
@MainActor
func d34SzmkHKFl(mcIOzuQURD:Int,phqabUmw:Int) async throws -> [[String: Any]] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("N5LuhVL9Wnkpc6gT/8/0DVQSFyUJuE9tC1xi4nPdV74=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("x3wM1rmeXjIvQ4ZW0hIaZQ==".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "F66Jd+bGoVhD2VydCV9CuA==".bFHEatcgE4zzU9TCfDonsu():mcIOzuQURD,
        "IvtwcNnKT3M5bmqWC3CtlA==".bFHEatcgE4zzU9TCfDonsu():phqabUmw,
        "VJ5ftfTLdSzoovjC+oZ3Zg==".bFHEatcgE4zzU9TCfDonsu():20
    ]
    

    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
 

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
   
    

    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
       
        return array
    } else {
        return []
    }
}


//查财富榜
@MainActor
func vFTFn8eFEdr(wvh5z2I6H:String) async throws -> [[String: Any]] {
    guard let url = URL(string: "5jjiCHeVD0MPiL2zrVLXI3yZjuBsG7U0xxZPnLOp++fKeABgyIWBXKewU70weyDh3sF4Ns7NobAfTzB7quaqik/7ohMsHQG6zuNb+bR1X3Y=".bFHEatcgE4zzU9TCfDonsu()) else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(IyfdHMdY.bTa3L6BoprG.xA6pKFG9JJCo, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "7Pa7vYkSemgtba2dEouF9w==".bFHEatcgE4zzU9TCfDonsu():wvh5z2I6H,
    ]

    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
    
    
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
  
    guard let tU1FEzyQrLe = resultArray as? [String: Any] else {
        return []
    }
   
    guard let rankList = tU1FEzyQrLe["1MHkvZY24w8S+yscJlX9Mg==".bFHEatcgE4zzU9TCfDonsu()] as? [[String: Any]] else {
        return []
    }
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "/GHoot6Wp8QCrnswPObcGA==".bFHEatcgE4zzU9TCfDonsu() {
        return rankList
    } else {
        return []
    }
}

//查魅力榜
@MainActor
func dB2EuHa3VY3u(mXaJwcQS7e:String) async throws -> [[String: Any]] {
    guard let url = URL(string: "5jjiCHeVD0MPiL2zrVLXI3yZjuBsG7U0xxZPnLOp++fKeABgyIWBXKewU70weyDh3sF4Ns7NobAfTzB7quaqipHpckgFweV5SPEVBvruk3Y=".bFHEatcgE4zzU9TCfDonsu()) else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(IyfdHMdY.bTa3L6BoprG.xA6pKFG9JJCo, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "7Pa7vYkSemgtba2dEouF9w==".bFHEatcgE4zzU9TCfDonsu():mXaJwcQS7e,
    ]

    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
    
    
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
  
    guard let tU1FEzyQrLe = resultArray as? [String: Any] else {
        return []
    }
   
    guard let rankList = tU1FEzyQrLe["1MHkvZY24w8S+yscJlX9Mg==".bFHEatcgE4zzU9TCfDonsu()] as? [[String: Any]] else {
        return []
    }
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "/GHoot6Wp8QCrnswPObcGA==".bFHEatcgE4zzU9TCfDonsu() {
        return rankList
    } else {
        return []
    }
}

//交换token
@MainActor
func giz2OZsRuin() async throws -> [String: Any] {
    guard let url = URL(string: "5jjiCHeVD0MPiL2zrVLXIymyugiTGts3b2zLQ6RLsxce5nrFme+LZjP83CGPoR16dUjl6luFJBKb7h1z79ToCw==".bFHEatcgE4zzU9TCfDonsu()) else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "km2wMXC6wIJi3UcUM7XhmA==".bFHEatcgE4zzU9TCfDonsu():ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA ?? "",
    ]
   

    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    

    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }
    

    let resultObject = try JSONSerialization.jsonObject(with: resultData, options: [])
   
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "/GHoot6Wp8QCrnswPObcGA==".bFHEatcgE4zzU9TCfDonsu() {
        return resultObject as? [String: Any] ?? [:]
    } else {
      
        return [:]
    }
}


//查直播间财富榜
@MainActor
func qYJEUV2QGq6U(qAloWEox0:String,jSaWDcnOS:Int) async throws -> [[String: Any]] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("N5LuhVL9Wnkpc6gT/8/0DbFmiuDq7QywTD8KeHgv+LE=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "7Pa7vYkSemgtba2dEouF9w==".bFHEatcgE4zzU9TCfDonsu():qAloWEox0,
        "pk4uxc9YUdeI/GYSkbOtUg==".bFHEatcgE4zzU9TCfDonsu():jSaWDcnOS
    ]
    
    
    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
   
    
    
    
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
       
        return array
    } else {
        return []
    }
}


//获取全局聊天室id
@MainActor
func iowHG20TQQco() async throws -> [String: Any] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("X6V/GKcy/GehkWoDdA2D0IAGxpuxZMzlnhkHwz87oLvOLZ4Md6HGk5Ixdi4gGMWO".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [
        "SREY1Qm89GjDk9QVrd/CJg==".bFHEatcgE4zzU9TCfDonsu(): "ypYHrXZIRwwR6R+wOeHK2g==".bFHEatcgE4zzU9TCfDonsu(),
    ]
   

    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return [:]
    }
    
    
    let resultObject = try JSONSerialization.jsonObject(with: resultData, options: [])
   
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
        return resultObject as? [String: Any] ?? [:]
    } else {
      
        return [:]
    }
}

//获取聊天快捷
@MainActor
func sfWiOA3TikY() async throws -> [[String: Any]] {
    guard let url = URL(string: "\(JOGtDnYupP.loaattrdbUrl)\("a9QVNUgXmkAq0rAvpkUZ4uZDA6pJbarrvu4zUUy0dvQ=".bFHEatcgE4zzU9TCfDonsu())") else {
        throw URLError(.badURL)
    }

    var request = URLRequest(url: url)
    request.httpMethod = "TwpekIooLUCgvTHFl+MwxQ==".bFHEatcgE4zzU9TCfDonsu()
    request.setValue("\(JOGtDnYupP.raslidepApId)", forHTTPHeaderField: "/+vyNnyngEXe9nlWlLUFXw==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("\(JOGtDnYupP.versLErqSu)", forHTTPHeaderField: "Lk7BrUILkWCahgrrMWOljA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.fiaiU4sbcNXzTzXA, forHTTPHeaderField: "id14e0qm/f9qOtXAfms/CA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("f3H1kWTUPAokQRTc/YRo2SdZMdBwtVX/DK3GeWeDHlg=".bFHEatcgE4zzU9TCfDonsu(), forHTTPHeaderField: "rgt87F4MfDPc3s53eug40w==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue(ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.nOlVkD, forHTTPHeaderField: "BKuUg/kfLV0gqKYcWCIqTA==".bFHEatcgE4zzU9TCfDonsu())
    request.setValue("", forHTTPHeaderField: "JUAzF+0p7E3Adx3j7US4Sg==".bFHEatcgE4zzU9TCfDonsu())
    
    let body: [String: Any] = [:]
    

    
    let jsonData = try JSONSerialization.data(withJSONObject: body, options: [])
    guard let jsonString = String(data: jsonData, encoding: .utf8) else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    let encryptedString = jsonString.tYwP1zF6sM8vR2kq()
    request.httpBody = encryptedString.data(using: .utf8)

    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let dict = json as? [String: Any] else {
        throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "AkteF/GcVRV5/DtmIvFLPQ==".bFHEatcgE4zzU9TCfDonsu()])
    }
    
    
    guard let resultStr = dict["3kaiUTUqa1od+4LspC6jGg==".bFHEatcgE4zzU9TCfDonsu()] as? String,
          let resultData = resultStr.hL9dV3bQ2fK6sJ8p().data(using: .utf8) else {
        return []
    }
    
    
    let resultArray = try JSONSerialization.jsonObject(with: resultData, options: [])
    
    guard let array = resultArray as? [[String: Any]] else {
        return []
    }
    
    
    if let code = dict["Kn2/ws1Rnf8zNd5fHo1Oxw==".bFHEatcgE4zzU9TCfDonsu()] as? String, code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
       
        return array
    } else {
        return []
    }
}
