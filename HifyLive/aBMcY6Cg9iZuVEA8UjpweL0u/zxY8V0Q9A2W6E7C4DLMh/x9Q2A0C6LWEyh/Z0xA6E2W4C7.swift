//
//  Z0xA6E2W4C7.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/27.
//
//关注用户的直播
import Combine
class FollowingCache: ObservableObject {
    static let shared = FollowingCache()
    
    @Published var items: [[String: Any]] = []
    private var cache: [[String: Any]]? = nil
    
    @MainActor
    func loadFollowing() async {
        // 如果缓存有，直接返回
        if let cache = cache, !items.isEmpty {
            items = cache
            return
        }
        
        do {
            // 调用你的关注接口
            let result = try await mK4tQ1bHVd9sL2()
           
            items = result
            cache = result
        } catch {
            print( error)
        }
    }
    

}
