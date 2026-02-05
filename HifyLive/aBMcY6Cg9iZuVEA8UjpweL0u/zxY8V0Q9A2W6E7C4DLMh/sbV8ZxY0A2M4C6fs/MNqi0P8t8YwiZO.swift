
//搜索历史持久化
import Foundation
import SwiftUI

final class SearchHistoryManager {

    static let shared = SearchHistoryManager()
    private init() {}

    private let key = "search_history_key"
    private let maxCount = 10   // ✅ 最多 10 条

    func load() -> [String] {
        UserDefaults.standard.stringArray(forKey: key) ?? []
    }

    func add(_ text: String) {
        guard !text.isEmpty else { return }

        var list = load()

        // 去重
        list.removeAll { $0 == text }

        // 最新的放最前
        list.insert(text, at: 0)

        // ✅ 超过 10 条直接截断
        if list.count > maxCount {
            list = Array(list.prefix(maxCount))
        }

        UserDefaults.standard.set(list, forKey: key)
    }

    func clear() {
        UserDefaults.standard.removeObject(forKey: key)
    }

    func remove(_ text: String) {
        var list = load()
        list.removeAll { $0 == text }
        UserDefaults.standard.set(list, forKey: key)
    }
}

struct SearchHistoryTag: View {
    let text: String

    var body: some View {
        Text(text)
            .g0LIIcoZQsOjyND9(
                size: 14,
                weight: .medium,
                color: .white
            )
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(Color.white.opacity(0.12))
            )
    }
}
