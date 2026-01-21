import UIKit

//UIKIT 字体
struct JqA1kUIFont {

    static let regular = "Barlow-Regular"
    static let medium  = "Barlow-Medium"
    static let semibold = "Barlow-SemiBold"
    static let black   = "Barlow-Black"

    static func font(
        size: CGFloat,
        weight: UIFont.Weight = .regular
    ) -> UIFont {

        let name: String
        switch weight {
        case .black:
            name = black
        case .semibold:
            name = semibold
        case .medium:
            name = medium
        default:
            name = regular
        }

        return UIFont(name: name, size: size)
            ?? UIFont.systemFont(ofSize: size, weight: weight)
    }
}
