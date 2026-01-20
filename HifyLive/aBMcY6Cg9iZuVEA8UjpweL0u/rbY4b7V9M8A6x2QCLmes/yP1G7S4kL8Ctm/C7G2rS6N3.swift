//
//  C7G2rS6N3.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/19.
//
//对话用户缓存
import NIMSDK
import Foundation

final class UserManager {
    static let shared = UserManager()
    private init() {}

    // MARK: - 自定义缓存
    private var cache: [String: (nickname: String, avatarUrl: String)] = [:]

    // MARK: - 获取用户信息
    /// 优先从缓存读取，否则异步拉取网络数据
    func getUserInfo(accid: String, completion: @escaping (String, String) -> Void) {
        // 先查缓存
        if let info = cache[accid] {
            completion(info.nickname, info.avatarUrl)
            return
        }

        // 异步拉取网络数据
        NIMSDK.shared().userManager.fetchUserInfos([accid]) { users, error in
            guard let user = users?.first else {
                DispatchQueue.main.async { completion(accid, "") }
                return
            }

            let nickname = user.userInfo?.nickName ?? ""
            let avatarUrl = user.userInfo?.avatarUrl ?? ""

            // 写入缓存
            self.cache[accid] = (nickname, avatarUrl)

            DispatchQueue.main.async { completion(nickname, avatarUrl) }
        }
    }

    // MARK: - 批量预加载用户信息
    /// 仅拉取缓存中不存在的 accid
    func preloadUsers(accids: [String]) {
        let uncached = accids.filter { cache[$0] == nil }
        guard !uncached.isEmpty else { return }

        NIMSDK.shared().userManager.fetchUserInfos(uncached) { users, _ in
            guard let users = users else { return }

            for user in users {
                let accid = user.userId ?? "unknown"
                let nickname = user.userInfo?.nickName ?? accid
                let avatarUrl = user.userInfo?.avatarUrl ?? ""

                self.cache[accid] = (nickname, avatarUrl)
            }
        }
    }

    // MARK: - 读取缓存
    func getCachedUserInfo(accid: String) -> (nickname: String, avatarUrl: String)? {
        return cache[accid]
    }

    // MARK: - 清空缓存
    func clearCache() {
        cache.removeAll()
    }
}

