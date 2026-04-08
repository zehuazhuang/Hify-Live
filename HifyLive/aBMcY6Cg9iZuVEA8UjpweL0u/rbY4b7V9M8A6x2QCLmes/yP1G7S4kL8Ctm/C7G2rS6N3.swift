
//对话用户缓存
import NIMSDK
import Foundation

struct UserExt: Codable {
    let onlineStatus: Int?
}

final class UserManager {
    static let shared = UserManager()
    private init() {}

    // MARK: - 自定义缓存
    private var cache: [String: (nickname: String, avatarUrl: String, isOnline: Bool)] = [:]

    // MARK: - 获取用户信息
    /// 优先从缓存读取，否则异步拉取网络数据
    func getUserInfo(accid: String, completion: @escaping (String, String, Bool) -> Void) {
        // 先查缓存
        if let info = cache[accid] {
            completion(info.nickname, info.avatarUrl, info.isOnline)
            return
        }

        NIMSDK.shared().userManager.fetchUserInfos([accid]) { users, error in
            guard let user = users?.first else {
                DispatchQueue.main.async { completion(accid, "", false) }
                return
            }

            let nickname = user.userInfo?.nickName ?? ""
            let avatarUrl = user.userInfo?.avatarUrl ?? ""

            Task { @MainActor in
                var isOnline: Bool = false

                if let extString = user.userInfo?.ext,
                   let data = extString.data(using: .utf8),
                   let ext = try? JSONDecoder().decode(UserExt.self, from: data) {
                    isOnline = (ext.onlineStatus == 1)
                }

                self.cache[accid] = (nickname, avatarUrl, isOnline)
                RecentSessionStore.shared.updateOnlineStatus(accid: accid, isOnline: isOnline)

                completion(nickname, avatarUrl, isOnline) // ✅ 三个参数
            }
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

                // ✅ 用 Task 切换到 MainActor
                Task { @MainActor in
                    var isOnline: Bool = false

                    if let extString = user.userInfo?.ext,
                       let data = extString.data(using: .utf8),
                       let ext = try? JSONDecoder().decode(UserExt.self, from: data) {
                        isOnline = (ext.onlineStatus == 1)
                    }

                    // ✅ 写缓存
                    self.cache[accid] = (nickname, avatarUrl, isOnline)

                    // ✅ 同步到会话列表
                    RecentSessionStore.shared.updateOnlineStatus(accid: accid, isOnline: isOnline)
                }
            }
        }
    }

    // MARK: - 读取缓存
    func getCachedUserInfo(accid: String) -> (nickname: String, avatarUrl: String, isOnline: Bool)? {
        return cache[accid]
    }

    // MARK: - 清空缓存
    func clearCache() {
        cache.removeAll()
    }
}

