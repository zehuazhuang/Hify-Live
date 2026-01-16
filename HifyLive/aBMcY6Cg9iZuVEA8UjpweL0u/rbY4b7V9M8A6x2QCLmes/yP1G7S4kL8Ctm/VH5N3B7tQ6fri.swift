// freiend 模块
import SwiftUI

struct VH5N3B7tQ6fri: View {
    @State private var seB51QK82J: Int = 0
    @State private var indices = Array(0..<4)
    var body: some View {
        VStack(spacing:20) {
            HStack(spacing: 16) {
                QP8XkW3ZButton(
                    ti9QZ7xM4bV: "Following",
                    isY0A2C6WEL: seB51QK82J == 0
                   
                ) {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        seB51QK82J = 0
                    }
                }
                QP8XkW3ZButton(
                    ti9QZ7xM4bV: "Follower",
                    isY0A2C6WEL: seB51QK82J == 1
                ) {
                    withAnimation(.easeInOut(duration: 0.25)) {
                        seB51QK82J = 1
                    }
                }

                Spacer()
            }
            .padding(.horizontal, 16)
            ScrollView{
                LazyVStack(spacing:8){
                    ForEach(0..<4){index in
                        tD4C1N7pR6Sli()
                            
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    if let i = indices.firstIndex(of: index) {
                                        indices.remove(at: i)
                                    }
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
            }
            
        }
    }
}
struct QP8XkW3ZButton: View {

    let ti9QZ7xM4bV: String
    let isY0A2C6WEL: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(ti9QZ7xM4bV)
                .g0LIIcoZQsOjyND9(
                    size: 16,
                    weight: .regular,
                    color: .white.opacity(isY0A2C6WEL ? 1 : 0.6)
                )
        }
        .frame(width: 92, height: 33)
        .background(backgroundGradient)
        .cornerRadius(325)
        .gradientBorder(shQY7b9WEL: isY0A2C6WEL)
    }

    private var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: isY0A2C6WEL
            ? [
                Color(red: 120 / 255, green: 233 / 255, blue: 255 / 255, opacity: 0.32),
                Color(red: 84 / 255, green: 105 / 255, blue: 199 / 255, opacity: 0.25)
            ]
            : [
                Color.white.opacity(0.05),
                Color.white.opacity(0.05)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
}
extension View {

    @ViewBuilder
    func gradientBorder(
        shQY7b9WEL: Bool,
        corC7Q9WEL: CGFloat = 325
    ) -> some View {
        if shQY7b9WEL {
            self.overlay(
                RoundedRectangle(cornerRadius: corC7Q9WEL)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color(red: 187 / 255, green: 68 / 255, blue: 219 / 255),
                                Color(red: 43 / 255, green: 93 / 255, blue: 117 / 255)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 1
                    )
            )
        } else {
            self
        }
    }
}
