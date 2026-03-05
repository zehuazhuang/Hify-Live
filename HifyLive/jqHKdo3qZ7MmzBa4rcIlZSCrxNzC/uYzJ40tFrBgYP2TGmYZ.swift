import Foundation

// MARK: - String ↔ Date 转换
extension String {
    /// 将 yyyy-MM-dd 格式的字符串转换为 Date
    func a5JBR(pyek4wBnLvt3ZNhEfQExGlySZyL: String = "rpxVSISmgtmCzrTRpHhzTw==".bFHEatcgE4zzU9TCfDonsu()) -> Date? {
        let dtu7OP8GnXt3s7DCfto = DateFormatter()
        dtu7OP8GnXt3s7DCfto.dateFormat = pyek4wBnLvt3ZNhEfQExGlySZyL
        dtu7OP8GnXt3s7DCfto.locale = Locale(identifier: "5UGNfNCfUnlKjHijDy8KpQ==".bFHEatcgE4zzU9TCfDonsu())
        dtu7OP8GnXt3s7DCfto.timeZone = TimeZone(secondsFromGMT: 0)
        return dtu7OP8GnXt3s7DCfto.date(from: self)
    }
}

extension Date {
    /// 将 Date 转换为 yyyy-MM-dd 格式的字符串
    func micBHIsg(aIRthJHzts: String = "yyyy-MM-dd") -> String {
        let mBqzyLFhbMWNzgLYVNonQZdNjc = DateFormatter()
        mBqzyLFhbMWNzgLYVNonQZdNjc.dateFormat = aIRthJHzts
        mBqzyLFhbMWNzgLYVNonQZdNjc.locale = Locale(identifier: "en_US_POSIX")
        mBqzyLFhbMWNzgLYVNonQZdNjc.timeZone = .current
        return mBqzyLFhbMWNzgLYVNonQZdNjc.string(from: self)
    }
}
//数字太大转换
extension Int {
    func shLK3lGBF() -> String {
        if self < 10000 {
            return "\(self)"
        } else if self < 1_000_000 {
            return String(format: "%.1fK", Double(self) / 1000)
        } else {
            return String(format: "%.1fM", Double(self) / 1_000_000)
        }
    }
}


//解析aijson
extension Dictionary where Key == String {
    func value<T>(forKeyPath path: [String]) -> T? {
        var current: Any? = self
        for key in path {
            if let dict = current as? [String: Any] {
                current = dict[key]
            } else if let array = current as? [[String: Any]], let index = Int(key) {
                current = array[index]
            } else {
                return nil
            }
        }
        return current as? T
    }
}


