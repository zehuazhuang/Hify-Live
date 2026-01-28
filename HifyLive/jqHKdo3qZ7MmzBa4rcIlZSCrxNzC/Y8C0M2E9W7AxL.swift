//
//  Y8C0M2E9W7AxL.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/28.
//

import UIKit

//上传oss图片
func pt5uxFoWaSL6Aj2i9XTDnpHDrEQ08I(_ image: UIImage, completion: @escaping (String?) -> Void) {
    guard let data = image.jpegData(compressionQuality: 0.8) else {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        completion(nil)
        return
    }

    let tempUrl = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).png")
    do {
        try data.write(to: tempUrl)
    } catch {
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        completion(nil)
        return
    }

    let fileName = "\(UUID().uuidString).png"
    IsZTtO2FdO13EJk8A2xBPRHSqlJx.f6fKqLNtg0zFmWoa2M1VFlHkb42.nsBipVAxQ5Hqjj8tsx(e8O8OyDACdOvgo: tempUrl, u92JYYPz7kFgcQKDFB6: fileName) { result in
        defer { try? FileManager.default.removeItem(at: tempUrl) }

        switch result {
        case .success(let url):
            print("上传成功:", url)
            completion(url) // ✅ 通过闭包返回 URL
            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        case .failure(_):
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("xI0ZIhbhVyHclrMTc2etOZ34kehVcER4puC7wXCAfDc=")
            completion(nil)
        }
    }
}
