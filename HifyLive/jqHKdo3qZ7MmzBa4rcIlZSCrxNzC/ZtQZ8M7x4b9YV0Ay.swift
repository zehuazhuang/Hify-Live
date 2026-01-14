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
        var remainingText = l4K9bX2q
        let lowerSearch = k7NmFz1p.lowercased()

        while let range = remainingText.lowercased().range(of: lowerSearch) {
            let prefix = String(remainingText[..<range.lowerBound])
            if !prefix.isEmpty {
                views.append(createText(prefix, color: .white))
            }

            let match = String(remainingText[range])
            views.append(createText(match, color: Color(red: 23/255, green: 220/255, blue: 255/255)))

            remainingText = String(remainingText[range.upperBound...])
        }

        if !remainingText.isEmpty {
            views.append(createText(remainingText, color: .white))
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
