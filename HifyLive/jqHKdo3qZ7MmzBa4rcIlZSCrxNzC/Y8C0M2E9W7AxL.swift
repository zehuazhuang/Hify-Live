//
//  Y8C0M2E9W7AxL.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/28.
//

import UIKit

//上传oss图片
@MainActor
func pt5uxFoWaSL6Aj2i9XTDnpHDrEQ08I(_ image: UIImage,isIA8MTA: Bool) async throws -> String? {
    // 1️⃣ 图片转 Data
    guard let data = image.jpegData(compressionQuality: 0.8) else {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        return nil
    }

    // 2️⃣ 写入临时文件
    let tempUrl = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).png")
    do {
        try data.write(to: tempUrl)
    } catch {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        return nil
    }

    let fileName = "\(UUID().uuidString).png"

    // 3️⃣ 上传到 OSS（假设你的 OSS 上传方法也改成 async/await 风格）
    let uploadedUrl: String
    do {
        uploadedUrl = try await withCheckedThrowingContinuation { continuation in
            IsZTtO2FdO13EJk8A2xBPRHSqlJx.f6fKqLNtg0zFmWoa2M1VFlHkb42.nsBipVAxQ5Hqjj8tsx(e8O8OyDACdOvgo: tempUrl, u92JYYPz7kFgcQKDFB6: fileName) { result in
                defer { try? FileManager.default.removeItem(at: tempUrl) }
                switch result {
                case .success(let url):
                    continuation.resume(returning: url)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    } catch {
      
        return nil
    }

    print("上传成功:", uploadedUrl)
    
    if (isIA8MTA){
        // 4️⃣ 调用鉴黄接口
        do {
            let isSafe = try await jhM2W7E8YxL(mosh4E7CxL: uploadedUrl)
            if isSafe {
                print("✅ 图片通过鉴黄")
                return uploadedUrl
            } else {
                print("⚠️ 图片未通过鉴黄")
                return nil
            }
        } catch {
            print("❌ 鉴黄接口调用失败:", error)
            return nil
        }
    }else{
        return uploadedUrl
    }

 
}
