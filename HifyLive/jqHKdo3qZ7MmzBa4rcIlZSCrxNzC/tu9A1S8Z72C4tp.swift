import Kingfisher
import SwiftUI

//网络图片封装
struct rP6kV1bS8qX3nT7: View {
    let pR9wQ2mL6hY5dF1: Any?

    private var uH3fM5dR1qL8bC0: String { // 原 urlString
        if let fG7sJ2vK4zQ9pH = pR9wQ2mL6hY5dF1 as? String {
            return fG7sJ2vK4zQ9pH
        } else {
            return ""
        }
    }

    var body: some View {
        KFImage(URL(string: uH3fM5dR1qL8bC0))
            .placeholder {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}
