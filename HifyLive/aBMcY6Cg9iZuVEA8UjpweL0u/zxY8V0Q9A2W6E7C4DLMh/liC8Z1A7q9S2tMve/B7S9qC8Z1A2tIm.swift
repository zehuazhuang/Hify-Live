//
//  B7S9qC8Z1A2tIm.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//

import Foundation
import NIMSDK

final class NIMManager {

    static let shared = NIMManager()
    private init() {}

    func login(account: String, token: String, completion: @escaping (Bool) -> Void) {
        // 新版 SDK 登录
        NIMSDK.shared().loginManager.login(account, token: token) { error in
            completion(error == nil)
        }
    }
}

