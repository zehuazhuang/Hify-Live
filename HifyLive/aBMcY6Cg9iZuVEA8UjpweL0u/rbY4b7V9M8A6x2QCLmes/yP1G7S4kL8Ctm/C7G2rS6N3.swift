//
//  C7G2rS6N3.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/19.
//
import NIMSDK
import Foundation

class UserManager {
    static let shared = UserManager()
    private init() {}
    
    // 自定义缓存
    private var cache: [String: (nickname: String, avatarUrl: String)] = [:]
    
    /// 获取用户信息，优先缓存，否则异步拉取
    func getUserInfo(accid: String, completion: @escaping (String, String) -> Void) {
        // 先查缓存
        if let info = cache[accid] {
            completion(info.nickname, info.avatarUrl)
            return
        }
        
        // 直接异步拉取网络数据
        NIMSDK.shared().userManager.fetchUserInfos([accid]) { users, error in
            if let user = users?.first {
                let nickname = user.userInfo?.nickName ?? accid
                let avatarUrl = user.userInfo?.avatarUrl ?? ""
                // 写入缓存
                self.cache[accid] = (nickname, avatarUrl)
                
                DispatchQueue.main.async {
                    completion(nickname, avatarUrl)
                }
            } else {
                DispatchQueue.main.async {
                    completion(accid, "")
                }
            }
        }
    }
    
    /// 批量预加载用户信息（用于 RecentSessionManager）
    func preloadUsers(accids: [String]) {
        // 只拉取缓存里不存在的 accid
        let uncached = accids.filter { cache[$0] == nil }
        guard !uncached.isEmpty else { return }
        
        NIMSDK.shared().userManager.fetchUserInfos(uncached) { users, error in
            guard let users = users else { return }
            for user in users {
                // userId 是 String?，需要解包或默认值
                let accid = user.userId ?? "unknown"
                // nickname 非 optional
                let nickname = user.userInfo?.nickName ?? accid
                let avatarUrl = user.userInfo?.avatarUrl ?? ""
                self.cache[accid] = (nickname: nickname, avatarUrl: avatarUrl)
            }
        }
    }
    
    /// 读取缓存
    func getCachedUserInfo(accid: String) -> (nickname: String, avatarUrl: String)? {
        return cache[accid]
    }
    
    /// 清空缓存
    func clearCache() {
        cache.removeAll()
    }
}
