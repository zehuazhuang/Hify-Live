//
//  UjxG8BXvWy4.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/20.
//

import Combine
import SwiftUI

class RecentSessionStore: ObservableObject {
    static let shared = RecentSessionStore()
    // 统一使用 cache 作为数据源
    @Published var cache: [CachedRecentSession] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        // 初次加载
        fetchRecentSessions()

        // 定时刷新或在 ChatViewModel 更新缓存后调用
        Timer.publish(every: 0.3, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                self.cache = RecentSessionManager.shared.cache
            }
            .store(in: &cancellables)
    }
    
    // 拉取最近会话
    func fetchRecentSessions() {
        RecentSessionManager.shared.fetchRecentSessions {
            self.cache = RecentSessionManager.shared.cache
        }
    }

    // 删除某个会话
    func removeSession(withId id: UUID) {
        RecentSessionManager.shared.removeSession(withId: id)
        self.cache = RecentSessionManager.shared.cache
    }
}
