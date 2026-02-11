import Kingfisher
import SwiftUI


//网络图片封装
struct rP6kV1bS8qX3nT7<Placeholder: View>: View {
    let ggbL2xlcJdwHgZLlXISwwdFDJ05oWE1G: Any?
    let allPics: [String]?          // 所有图片
    let kB1MVUq5MoDAlsqhB: Placeholder
    let V0QmF7P9ZL: Bool?
    @State private var isPreviewPresented = false
    @State private var previewPics: [String] = []
    @State private var previewStartIndex: Int = 0
    init(
        pR9wQ2mL6hY5dF1: Any?,
        allPics: [String]? = nil,              // 传整个图片数组
        V0QmF7P9ZL: Bool? = nil,
        @ViewBuilder plLljeMXzcGjijvIxuDwu3: () -> Placeholder = {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
        }
    ) {
        self.ggbL2xlcJdwHgZLlXISwwdFDJ05oWE1G = pR9wQ2mL6hY5dF1
        self.allPics = allPics
        self.V0QmF7P9ZL = V0QmF7P9ZL
        self.kB1MVUq5MoDAlsqhB = plLljeMXzcGjijvIxuDwu3()
    }

    private var uH3fM5dR1qL8bC0: String {
        ggbL2xlcJdwHgZLlXISwwdFDJ05oWE1G as? String ?? ""
    }

    var body: some View {
        KFImage(URL(string: uH3fM5dR1qL8bC0))
            .placeholder { kB1MVUq5MoDAlsqhB }
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
            .contentShape(Rectangle())
            .onTapGesture {
                guard V0QmF7P9ZL == true else { return }
               
                
                
                   
                        if let pics = allPics, let index = pics.firstIndex(of: uH3fM5dR1qL8bC0) {
                           
                            previewPics = pics
                            previewStartIndex = index
                           
                        } else {
                           
                                
                            previewPics = [uH3fM5dR1qL8bC0]
                            previewStartIndex = 0
                            
                        }
                
               
                    isPreviewPresented = true
              
               
            }.fullScreenCover(isPresented: $isPreviewPresented) {
                ZQ9FPreviewWrapper(pics: previewPics, startIndex: previewStartIndex)
                    .ignoresSafeArea()
            }
           
    }
}
