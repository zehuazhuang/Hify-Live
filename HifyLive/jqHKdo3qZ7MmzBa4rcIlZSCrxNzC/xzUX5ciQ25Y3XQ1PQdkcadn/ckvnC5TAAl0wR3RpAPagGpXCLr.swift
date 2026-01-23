import Foundation
import SwiftUI
import Combine
import AliyunOSSiOS

// MARK: - STS 响应模型
struct Yket3EcCd4taOJ6PDmywu1xCsnpmxEq: Codable {
    let StatusCode: String //StatusCode
    let AccessKeyId: String //AccessKeyId
    let AccessKeySecret: String //AccessKeySecret
    let SecurityToken: String //SecurityToken
    let Expiration: String //Expiration
    let bucket: String //bucket
    let host: String //host
    let cdnUrl: String //cdnUrl
}

// MARK: - OSS 凭证管理
final class ZWwVYU456D4bwUbJ0yPhTetPA: ObservableObject {
    static let ddOU4f6yod6uajqZbD67xsbZ = ZWwVYU456D4bwUbJ0yPhTetPA()
    private init() {}

    @Published var mWk1CiVWlJ: String?
    @Published var n5cKN3GBU2ZcYytLoDfFMi2DcClL1yj: String?
    @Published var e3zOSYPbo85kv3HcM8KyunsQpXtQH: String?
    @Published var nTn4KR3pE3DhU4YNdUUWIMe: Date?
    @Published var qx5XcuEz: String?
    @Published var vwyp0hnTEAGImvyhzRgpJHSh7xvpHOab: String?
    @Published var h6p1FVKd2NAV72: String?

    private var rP5UEDzLIM30kPVZ: Timer?

    /// 获取或刷新 STS 凭证
    func ey08X7h1uXv4(fjOKRP50U1kIOdgbOnaY30lSk: @escaping (Bool) -> Void) {
        // 如果已有凭证且未过期 10 秒以上，直接使用
        if let wveqyal7ylsPrzkkC = nTn4KR3pE3DhU4YNdUUWIMe, wveqyal7ylsPrzkkC > Date().addingTimeInterval(10) {
            fjOKRP50U1kIOdgbOnaY30lSk(true)
            return
        }

        // 请求后台获取 STS Token
        WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(
            tk5afnKIwTiQL5Ai79O0AnK3f5G: "fWJsFepccxjOhbFuWe1XLA==".bFHEatcgE4zzU9TCfDonsu(),
            b3q0LlCSk: [String: String](),
        ) { (kcVqTdoOt8VnZdol: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
            switch kcVqTdoOt8VnZdol {
            case .success(let jptInEN1lVGSli8J1pl4rU2bxTScW7Ed):
                if jptInEN1lVGSli8J1pl4rU2bxTScW7Ed.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                    guard let mtH4TnTQTLgaNPp0V6yDgXd3WPl = jptInEN1lVGSli8J1pl4rU2bxTScW7Ed.result, !mtH4TnTQTLgaNPp0V6yDgXd3WPl.isEmpty else {
                        fjOKRP50U1kIOdgbOnaY30lSk(false)
                        return
                    }

                    // 解密 & JSON 转换
                    let nTxwxWVTPEuqbiQEHTOW = mtH4TnTQTLgaNPp0V6yDgXd3WPl.hL9dV3bQ2fK6sJ8p()
                    guard let zTrV47dYqGPv32Z = nTxwxWVTPEuqbiQEHTOW.data(using: .utf8) else {
                        fjOKRP50U1kIOdgbOnaY30lSk(false)
                        return
                    }

                    do {
                        let vbpa9EXEDsewkR4C0R1v8SyVMJX = try JSONDecoder().decode(Yket3EcCd4taOJ6PDmywu1xCsnpmxEq.self, from: zTrV47dYqGPv32Z)
                        DispatchQueue.main.async {
                            self.mWk1CiVWlJ = vbpa9EXEDsewkR4C0R1v8SyVMJX.AccessKeyId
                            self.n5cKN3GBU2ZcYytLoDfFMi2DcClL1yj = vbpa9EXEDsewkR4C0R1v8SyVMJX.AccessKeySecret
                            self.e3zOSYPbo85kv3HcM8KyunsQpXtQH = vbpa9EXEDsewkR4C0R1v8SyVMJX.SecurityToken
                            self.qx5XcuEz = vbpa9EXEDsewkR4C0R1v8SyVMJX.bucket
                            self.vwyp0hnTEAGImvyhzRgpJHSh7xvpHOab = vbpa9EXEDsewkR4C0R1v8SyVMJX.host
                            self.nTn4KR3pE3DhU4YNdUUWIMe = ISO8601DateFormatter().date(from: vbpa9EXEDsewkR4C0R1v8SyVMJX.Expiration)
                            self.h6p1FVKd2NAV72 = vbpa9EXEDsewkR4C0R1v8SyVMJX.cdnUrl
                            self.cJa4B53()
                            fjOKRP50U1kIOdgbOnaY30lSk(true)
                        }
                    } catch {
//                        print("解析 STS JSON 失败:", error)
                        fjOKRP50U1kIOdgbOnaY30lSk(false)
                    }
                }
            case .failure(_):
//                print("STS 请求失败:", mr5Ga0V3h9QgS)
                fjOKRP50U1kIOdgbOnaY30lSk(false)
            }
        }
    }

    /// 定时刷新 STS
    private func cJa4B53() {
        rP5UEDzLIM30kPVZ?.invalidate()
        guard let ugycSV8iUfo = nTn4KR3pE3DhU4YNdUUWIMe else { return }
        let xsaBDro = ugycSV8iUfo.timeIntervalSinceNow - 30
        if xsaBDro > 0 {
            rP5UEDzLIM30kPVZ = Timer.scheduledTimer(withTimeInterval: xsaBDro, repeats: false) { [weak self] _ in
                self?.ey08X7h1uXv4 { _ in }
            }
        }
    }
}

// MARK: - 阿里云上传工具
final class IsZTtO2FdO13EJk8A2xBPRHSqlJx {
    static let f6fKqLNtg0zFmWoa2M1VFlHkb42 = IsZTtO2FdO13EJk8A2xBPRHSqlJx()
    private init() {}

    private var c8yquqOYGALh4Lq: [OSSTask<AnyObject>] = []
    private var iEROnZ: [OSSClient] = []

    /// 上传文件到 OSS
    func nsBipVAxQ5Hqjj8tsx(
        e8O8OyDACdOvgo: URL,
        u92JYYPz7kFgcQKDFB6: String,
        p2gBE3NSqIq7: ((Double) -> Void)? = nil,
        zC3Plk1KwcQrIoNrAUb4cM2OCESagi1M: @escaping (Result<String, Error>) -> Void
    ) {
        ZWwVYU456D4bwUbJ0yPhTetPA.ddOU4f6yod6uajqZbD67xsbZ.ey08X7h1uXv4 { acju7aj8seFDc in
            guard acju7aj8seFDc,
                  let mRiCvGrGv2YkIyNzjW92iJV4punfe8 = ZWwVYU456D4bwUbJ0yPhTetPA.ddOU4f6yod6uajqZbD67xsbZ.mWk1CiVWlJ,
                  let bg6PWC4t4zFY5ZNyyaDxXg1qOk = ZWwVYU456D4bwUbJ0yPhTetPA.ddOU4f6yod6uajqZbD67xsbZ.n5cKN3GBU2ZcYytLoDfFMi2DcClL1yj,
                  let smCq83tXPFye = ZWwVYU456D4bwUbJ0yPhTetPA.ddOU4f6yod6uajqZbD67xsbZ.e3zOSYPbo85kv3HcM8KyunsQpXtQH,
                  let d5UnyEb9VUQfp = ZWwVYU456D4bwUbJ0yPhTetPA.ddOU4f6yod6uajqZbD67xsbZ.qx5XcuEz,
                  let rZXtCmhawcqHFiAyXfNB9MQ = ZWwVYU456D4bwUbJ0yPhTetPA.ddOU4f6yod6uajqZbD67xsbZ.h6p1FVKd2NAV72
            else {
                zC3Plk1KwcQrIoNrAUb4cM2OCESagi1M(.failure(NSError(domain: "97kbAQ1WT46tpo2WXfZsCw==".bFHEatcgE4zzU9TCfDonsu(), code: -1, userInfo: [NSLocalizedDescriptionKey: "0YQW5vpyTaDg/7y9L/jpLU9FDyxatOTo+IFkEhw7DJk=".bFHEatcgE4zzU9TCfDonsu()])))
                return
            }

            // 打印调试
//            print("AccessKeyId:", mRiCvGrGv2YkIyNzjW92iJV4punfe8)
//            print("AccessKeySecret:", bg6PWC4t4zFY5ZNyyaDxXg1qOk)
//            print("SecurityToken:", smCq83tXPFye)
//            print("Bucket:", d5UnyEb9VUQfp)
//            print("Host:", rZXtCmhawcqHFiAyXfNB9MQ)

            // OSS SDK 推荐方式，不传 expiration
            let ie0lNIij9BXj4y3hbBt = OSSStsTokenCredentialProvider(
                accessKeyId: mRiCvGrGv2YkIyNzjW92iJV4punfe8,
                secretKeyId: bg6PWC4t4zFY5ZNyyaDxXg1qOk,
                securityToken: smCq83tXPFye
            )

            // 创建 OSSClient，只使用域名，不带 bucket
            let ru5dYlMA2nA9XKNL2dEKiN7My9s = OSSClient(endpoint: "oSaDEw5nsZuou1K9VPn68XT1hGeAF9Wyygq+YjoVxuh7qKRfhwPq9yHvN+CD32AQ".bFHEatcgE4zzU9TCfDonsu(), credentialProvider: ie0lNIij9BXj4y3hbBt)
            
            let kUR1NJIHl079Ybv9MvIWxqCMhWPU = DateFormatter()
            kUR1NJIHl079Ybv9MvIWxqCMhWPU.dateFormat = "lVOHa7aB8EyaTMGmM2FJYg==".bFHEatcgE4zzU9TCfDonsu()
            let qsHzExqYyEsV56hSocVnUrQeigoeJ = kUR1NJIHl079Ybv9MvIWxqCMhWPU.string(from: Date())

            let ufxjYqySC1RWM = OSSPutObjectRequest()
            ufxjYqySC1RWM.bucketName = d5UnyEb9VUQfp // bucket 独立指定
            ufxjYqySC1RWM.objectKey = "SOXPAhKx9jqgNmltTr2Mkg==".bFHEatcgE4zzU9TCfDonsu() + qsHzExqYyEsV56hSocVnUrQeigoeJ + "mkR2lsdJIG9S3gS5wH6ryg==".bFHEatcgE4zzU9TCfDonsu() + u92JYYPz7kFgcQKDFB6
            ufxjYqySC1RWM.uploadingFileURL = e8O8OyDACdOvgo

            // 上传进度
            ufxjYqySC1RWM.uploadProgress = { t9KizHGb4SI9EKmLWbdFo, a4mzq8wJ0BeRtv6UhNYc3kJ, iZpm8yAEP8y1Yuvj0RveMrOs01x in
                guard iZpm8yAEP8y1Yuvj0RveMrOs01x > 0 else { return }
                let l8waD9KF2a3J2mNg2LPNeIMk4m = Double(a4mzq8wJ0BeRtv6UhNYc3kJ) / Double(iZpm8yAEP8y1Yuvj0RveMrOs01x)
                DispatchQueue.main.async {
                    p2gBE3NSqIq7?(l8waD9KF2a3J2mNg2LPNeIMk4m)
                }
            }

            // 发起上传
            let iTgm0SXpj = ru5dYlMA2nA9XKNL2dEKiN7My9s.putObject(ufxjYqySC1RWM)
            self.c8yquqOYGALh4Lq.append(iTgm0SXpj)
            self.iEROnZ.append(ru5dYlMA2nA9XKNL2dEKiN7My9s)

            iTgm0SXpj.continue({ rIBocdtXRrB in
                DispatchQueue.main.async {
                    defer {
                        if let b9pedWt7KiKT6MFk = self.c8yquqOYGALh4Lq.firstIndex(of: iTgm0SXpj) {
                            self.c8yquqOYGALh4Lq.remove(at: b9pedWt7KiKT6MFk)
                        }
                        if let sQNSM = self.iEROnZ.firstIndex(of: ru5dYlMA2nA9XKNL2dEKiN7My9s) {
                            self.iEROnZ.remove(at: sQNSM)
                        }
                    }

                    if let btwJd9tT9VxWFq4Ne = rIBocdtXRrB.error {
                        zC3Plk1KwcQrIoNrAUb4cM2OCESagi1M(.failure(btwJd9tT9VxWFq4Ne))
                    } else {
                        let pFt4P = rZXtCmhawcqHFiAyXfNB9MQ + "jw/jbwkrqu8iMIxoO9VyVw==".bFHEatcgE4zzU9TCfDonsu() + qsHzExqYyEsV56hSocVnUrQeigoeJ + "mkR2lsdJIG9S3gS5wH6ryg==".bFHEatcgE4zzU9TCfDonsu() + u92JYYPz7kFgcQKDFB6
                        zC3Plk1KwcQrIoNrAUb4cM2OCESagi1M(.success(pFt4P))
                    }
                }
                return nil
            })
        }
    }
}

//OSS 上传封装一个 async/await 版本
extension IsZTtO2FdO13EJk8A2xBPRHSqlJx {
    func lsPWcBctMdZKbZmayF(
        mp5zcQyx: URL,
        iQG9oHdO6VjSKvCvA6dikEBFjKYP: String,
        zEegMv5lVmEjyxeTPLGSQPehTs: ((Double) -> Void)? = nil
    ) async throws -> String {
        return try await withCheckedThrowingContinuation { lhdKMbClm in
            self.nsBipVAxQ5Hqjj8tsx(e8O8OyDACdOvgo: mp5zcQyx, u92JYYPz7kFgcQKDFB6: iQG9oHdO6VjSKvCvA6dikEBFjKYP, p2gBE3NSqIq7: zEegMv5lVmEjyxeTPLGSQPehTs) { xbSkXXgNwboW in
                switch xbSkXXgNwboW {
                case .success(let yVd2y4aKD3Idlfp7yuSxId09jwPJ5j):
                    lhdKMbClm.resume(returning: yVd2y4aKD3Idlfp7yuSxId09jwPJ5j)
                case .failure(let yoSZDzI5Z4JCWzKhOYy5cvS1J):
                    lhdKMbClm.resume(throwing: yoSZDzI5Z4JCWzKhOYy5cvS1J)
                }
            }
        }
    }
}
