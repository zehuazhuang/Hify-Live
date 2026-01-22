import Kingfisher
import SwiftUI

//网络图片封装
struct rP6kV1bS8qX3nT7<Placeholder: View>: View {

    let ggbL2xlcJdwHgZLlXISwwdFDJ05oWE1G: Any?
    let kB1MVUq5MoDAlsqhB: Placeholder

    init(
        pR9wQ2mL6hY5dF1: Any?,
        @ViewBuilder plLljeMXzcGjijvIxuDwu3: () -> Placeholder = {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
        }
    ) {
        self.ggbL2xlcJdwHgZLlXISwwdFDJ05oWE1G = pR9wQ2mL6hY5dF1
        self.kB1MVUq5MoDAlsqhB = plLljeMXzcGjijvIxuDwu3()
    }

    private var uH3fM5dR1qL8bC0: String {
        ggbL2xlcJdwHgZLlXISwwdFDJ05oWE1G as? String ?? ""
    }

    var body: some View {
        KFImage(URL(string: uH3fM5dR1qL8bC0))
            .placeholder {
                kB1MVUq5MoDAlsqhB
            }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}
