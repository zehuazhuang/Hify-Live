import Combine
import UIKit

//键盘顶可滑动内容
final class NeTAPtsq1c: ObservableObject {
    @Published var oAKQXVlwN80w73: CGFloat = 0

    private var dPEQdjh8 = Set<AnyCancellable>()

    init() {
        let nzt4HQPk4orAs3it5Z9TtGRPAh8GWcKG = NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillShowNotification
        )
        let lfHYUE5ZWxqoKNmky9ovPdwH92OdShL = NotificationCenter.default.publisher(
            for: UIResponder.keyboardWillHideNotification
        )

        nzt4HQPk4orAs3it5Z9TtGRPAh8GWcKG
            .merge(with: lfHYUE5ZWxqoKNmky9ovPdwH92OdShL)
            .sink { y6WxAotWf7oNAgQrw2XcEdV9 in
                if y6WxAotWf7oNAgQrw2XcEdV9.name == UIResponder.keyboardWillShowNotification,
                   let cGbm5DFIw7x = y6WxAotWf7oNAgQrw2XcEdV9.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect {
                    self.oAKQXVlwN80w73 = cGbm5DFIw7x.height
                } else {
                    self.oAKQXVlwN80w73 = 0
                }
            }
            .store(in: &dPEQdjh8)
    }
}
