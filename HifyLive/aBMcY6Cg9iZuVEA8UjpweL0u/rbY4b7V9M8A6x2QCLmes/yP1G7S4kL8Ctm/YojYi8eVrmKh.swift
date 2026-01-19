//
//  YojYi8eVrmKh.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/19.
//
//缓存聊天对话
import NIMSDK

class RecentSessionManager {
    static let shared = RecentSessionManager()
    private init() {}
    
    // 最近会话缓存
    private(set) var cache: [NIMRecentSession] = []
    
    /// 拉取最近会话，并批量预加载用户信息
    func fetchRecentSessions(forceRefresh: Bool = false, completion: (() -> Void)? = nil) {
        if !cache.isEmpty && !forceRefresh {
            // 使用缓存，同时尝试预加载用户信息
            preloadUserInfos()
            completion?()
            return
        }
        
        // 拉取最新会话
        let sessions = NIMManager.shared.fetchRecentSessions()
        cache = sessions
        
        // 批量预加载用户信息
        preloadUserInfos()
        
        completion?()
    }
    
    /// 批量预加载用户信息到 UserManager 缓存
    private func preloadUserInfos() {
        let accids = cache.compactMap { $0.session?.sessionId }
        for accid in accids {
            // 调用 UserManager 异步拉取并缓存
            UserManager.shared.getUserInfo(accid: accid) { nickname, avatarUrl in
               
            }
        }
    }
    
    func updateCache(sessions: [NIMRecentSession]) {
        cache = sessions
        preloadUserInfos()
    }
    
    func clearCache() {
        cache.removeAll()
    }
}

