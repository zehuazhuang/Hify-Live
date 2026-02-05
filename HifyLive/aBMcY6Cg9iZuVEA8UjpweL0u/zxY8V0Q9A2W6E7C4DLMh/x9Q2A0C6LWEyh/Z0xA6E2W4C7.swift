
//关注用户的直播
import Combine
class FollowingCache: ObservableObject {
    static let shared = FollowingCache()

    @Published var items: [[String: Any]] = []
    private var cache: [[String: Any]]? = nil

    func invalidate() {
        cache = nil
        items = []
    }

    @MainActor
    func loadFollowing(forceRefresh: Bool = false) async {
        if !forceRefresh, let cache = cache, !cache.isEmpty {
            items = cache
            return
        }

        do {
            let result = try await mK4tQ1bHVd9sL2()
            items = result
            cache = result
        } catch {
            print(error)
        }
    }
}
