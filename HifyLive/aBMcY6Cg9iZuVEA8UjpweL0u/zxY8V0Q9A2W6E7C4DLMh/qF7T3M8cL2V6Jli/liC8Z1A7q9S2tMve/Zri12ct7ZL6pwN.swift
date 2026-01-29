//
//  Zri12ct7ZL6pwN.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/29.
//

import Combine

// ✅ 全局直播管理
class LiveSessionManager: ObservableObject {
    static let shared = LiveSessionManager() // 单例

    @Published var currentChannelUserId: UInt = 0 // 当前观看直播间 id
}
