import Foundation
import SwiftUI
import Combine
import AliyunOSSiOS

// MARK: - STS 响应模型
struct OSSSTSResponse: Codable {
    let StatusCode: String
    let AccessKeyId: String
    let AccessKeySecret: String
    let SecurityToken: String
    let Expiration: String
    let bucket: String
    let host: String
    let cdnUrl: String
}

// MARK: - OSS 凭证管理
final class OSSCredentialManager: ObservableObject {
    static let shared = OSSCredentialManager()
    private init() {}

    @Published var accessKeyId: String?
    @Published var accessKeySecret: String?
    @Published var securityToken: String?
    @Published var expiration: Date?
    @Published var bucket: String?
    @Published var host: String?

    private var refreshTimer: Timer?

    /// 获取或刷新 STS 凭证
    func fetchCredential(completion: @escaping (Bool) -> Void) {
        // 如果已有凭证且未过期 10 秒以上，直接使用
        if let expiration = expiration, expiration > Date().addingTimeInterval(10) {
            completion(true)
            return
        }

        // 请求后台获取 STS Token
        WOKmjUjM.dq0JZ94RcmDb3.postCodable(
            path: "fWJsFepccxjOhbFuWe1XLA==".bFHEatcgE4zzU9TCfDonsu(),
            body: [String: String](),
        ) { (result: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
            switch result {
            case .success(let data):
                if data.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                    guard let compressedString = data.result, !compressedString.isEmpty else {
                        completion(false)
                        return
                    }

                    // 解密 & JSON 转换
                    let decryptedString = compressedString.hL9dV3bQ2fK6sJ8p()
                    guard let jsonData = decryptedString.data(using: .utf8) else {
                        completion(false)
                        return
                    }

                    do {
                        let sts = try JSONDecoder().decode(OSSSTSResponse.self, from: jsonData)
                        DispatchQueue.main.async {
                            self.accessKeyId = sts.AccessKeyId
                            self.accessKeySecret = sts.AccessKeySecret
                            self.securityToken = sts.SecurityToken
                            self.bucket = sts.bucket
                            // ✅ 去掉 host 中的 bucket 子域名，只保留域名
                            if let url = URL(string: sts.host) {
                                self.host = "\(url.scheme ?? "https")://\(url.host ?? "")"
                            } else {
                                self.host = sts.host
                            }
                            self.expiration = ISO8601DateFormatter().date(from: sts.Expiration)
                            self.scheduleRefresh()
                            completion(true)
                        }
                    } catch {
                        print("解析 STS JSON 失败:", error)
                        completion(false)
                    }
                }
            case .failure(let error):
                print("STS 请求失败:", error)
                completion(false)
            }
        }
    }

    /// 定时刷新 STS
    private func scheduleRefresh() {
        refreshTimer?.invalidate()
        guard let expiration = expiration else { return }
        let interval = expiration.timeIntervalSinceNow - 30
        if interval > 0 {
            refreshTimer = Timer.scheduledTimer(withTimeInterval: interval, repeats: false) { [weak self] _ in
                self?.fetchCredential { _ in }
            }
        }
    }
}

// MARK: - 阿里云上传工具
final class OSSUploader {
    static let shared = OSSUploader()
    private init() {}

    private var activeTasks: [OSSTask<AnyObject>] = []
    private var activeClients: [OSSClient] = []

    /// 上传文件到 OSS
    func upload(
        fileURL: URL,
        objectKey: String,
        progress: ((Double) -> Void)? = nil,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        OSSCredentialManager.shared.fetchCredential { success in
            guard success,
                  let accessKeyId = OSSCredentialManager.shared.accessKeyId,
                  let accessKeySecret = OSSCredentialManager.shared.accessKeySecret,
                  let securityToken = OSSCredentialManager.shared.securityToken,
                  let bucket = OSSCredentialManager.shared.bucket,
                  let host = OSSCredentialManager.shared.host
            else {
                completion(.failure(NSError(domain: "OSS", code: -1, userInfo: [NSLocalizedDescriptionKey: "获取凭证失败"])))
                return
            }

            // 打印调试
            print("AccessKeyId:", accessKeyId)
            print("AccessKeySecret:", accessKeySecret)
            print("SecurityToken:", securityToken)
            print("Bucket:", bucket)
            print("Host:", host)

            // OSS SDK 推荐方式，不传 expiration
            let credentialProvider = OSSStsTokenCredentialProvider(
                accessKeyId: accessKeyId,
                secretKeyId: accessKeySecret,
                securityToken: securityToken
            )

            // 创建 OSSClient，只使用域名，不带 bucket
            let client = OSSClient(endpoint: host, credentialProvider: credentialProvider)

            let put = OSSPutObjectRequest()
            put.bucketName = bucket // bucket 独立指定
            put.objectKey = "HifyLive/\(objectKey)"
            put.uploadingFileURL = fileURL

            // 上传进度
            put.uploadProgress = { bytesSent, totalBytesSent, totalBytesExpected in
                guard totalBytesExpected > 0 else { return }
                let ratio = Double(totalBytesSent) / Double(totalBytesExpected)
                DispatchQueue.main.async {
                    progress?(ratio)
                }
            }

            // 发起上传
            let task = client.putObject(put)
            self.activeTasks.append(task)
            self.activeClients.append(client)

            task.continue({ t in
                DispatchQueue.main.async {
                    defer {
                        if let index = self.activeTasks.firstIndex(of: task) {
                            self.activeTasks.remove(at: index)
                        }
                        if let index = self.activeClients.firstIndex(of: client) {
                            self.activeClients.remove(at: index)
                        }
                    }

                    if let error = t.error {
                        completion(.failure(error))
                    } else {
                        let url = "\(host)/HifyLive/\(objectKey)"
                        completion(.success(url))
                    }
                }
                return nil
            })
        }
    }
}
