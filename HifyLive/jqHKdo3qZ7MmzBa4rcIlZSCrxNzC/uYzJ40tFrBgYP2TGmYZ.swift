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
    func micBHIsg(aIRthJHzts: String = "rpxVSISmgtmCzrTRpHhzTw==".bFHEatcgE4zzU9TCfDonsu()) -> String {
        let mBqzyLFhbMWNzgLYVNonQZdNjc = DateFormatter()
        mBqzyLFhbMWNzgLYVNonQZdNjc.dateFormat = aIRthJHzts
        mBqzyLFhbMWNzgLYVNonQZdNjc.locale = Locale(identifier: "5UGNfNCfUnlKjHijDy8KpQ==".bFHEatcgE4zzU9TCfDonsu())
        mBqzyLFhbMWNzgLYVNonQZdNjc.timeZone = TimeZone(secondsFromGMT: 0)
        return mBqzyLFhbMWNzgLYVNonQZdNjc.string(from: self)
    }
}
