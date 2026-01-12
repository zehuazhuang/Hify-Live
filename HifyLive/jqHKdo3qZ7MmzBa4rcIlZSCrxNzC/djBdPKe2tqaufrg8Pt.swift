import SwiftUI

struct JqA1kMoFobuvplkZO5w4FWsenOf {
    // 默认字体系列
    static let q3BkrvU = "Barlow-Regular" //400
    static let xMWTBl16DkUAifDmZD892UuMAv = "Barlow-SemiBold" //600
    static let rRhYwcR9vtOk65ELrsUlV3 = "Barlow-Black" //900

    /// 获取 Font
    static func yVvo9b0xKtZE0(
        gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat,
        iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: Font.Weight = .regular
    ) -> Font {
        let tekonFzEMKqs9kHK: String
        switch iAYoV6kRMI2dAT8yrwHd0S47GmuZB6 {
        case .black:
            tekonFzEMKqs9kHK = rRhYwcR9vtOk65ELrsUlV3
        case .semibold:
            tekonFzEMKqs9kHK = xMWTBl16DkUAifDmZD892UuMAv
        default:
            tekonFzEMKqs9kHK = q3BkrvU
        }
        return Font.custom(tekonFzEMKqs9kHK, size: gpMpmhPhxS73zlFX24e2W5x8ZNX6q)
    }
}


extension Text {
    @ViewBuilder
    func g0LIIcoZQsOjyND9(
        size: Int = 14,
        weight: Font.Weight = .regular,
        color: Color = .white,
        lineSpacing: CGFloat? = nil
    ) -> some View {
        if let iHjzmnLiI8qZz = lineSpacing {
            self
                .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(size), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: weight))
                .foregroundColor(color)
                .lineSpacing(iHjzmnLiI8qZz)
        } else {
            self
                .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(size), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: weight))
                .foregroundColor(color)
        }
    }
}
