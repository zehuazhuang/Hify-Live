import SwiftUI

// 搜索字体颜色变色
struct A6WsC0Ww6ELqEL: View {
    let l4K9bX2q: String//字符串
    let k7NmFz1p: String//输入框字符串
    let t3QvD8j: String//1是名字 2是id

    var body: some View {
        HStack(spacing: 0) {
            let texts = buildTexts()
            ForEach(0..<texts.count, id: \.self) { i in
                texts[i]
            }
        }
    }

    
    private var currentSize: CGFloat {
        t3QvD8j == "1" ? 16 : 14
    }

    private var currentWeight: Font.Weight {
        t3QvD8j == "1" ? .semibold : .regular
    }

    private func buildTexts() -> [Text] {
        guard !k7NmFz1p.isEmpty else {
            return [createText(l4K9bX2q, color: .white)]
        }

        var views: [Text] = []
        var searchStartIndex = l4K9bX2q.startIndex

        while let range = l4K9bX2q.range(
            of: k7NmFz1p,
            options: [.caseInsensitive, .diacriticInsensitive],
            range: searchStartIndex..<l4K9bX2q.endIndex
        ) {
            let prefix = String(l4K9bX2q[searchStartIndex..<range.lowerBound])
            if !prefix.isEmpty {
                views.append(createText(prefix, color: .white))
            }

            let match = String(l4K9bX2q[range])
            views.append(createText(match, color: Color(red: 23/255, green: 220/255, blue: 255/255)))

            searchStartIndex = range.upperBound
        }

        let suffix = String(l4K9bX2q[searchStartIndex...])
        if !suffix.isEmpty {
            views.append(createText(suffix, color: .white))
        }

        return views
    }

    
    private func createText(_ str: String, color: Color) -> Text {
        Text(str)
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(
                gpMpmhPhxS73zlFX24e2W5x8ZNX6q: currentSize,
                iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: currentWeight
            ))
            .foregroundColor(color)
    }
}
