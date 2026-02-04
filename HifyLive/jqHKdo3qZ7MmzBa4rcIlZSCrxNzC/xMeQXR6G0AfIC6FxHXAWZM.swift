import SwiftUI
import Combine

//loading

final class EfqJ9: ObservableObject {
    static let hlLgQUr6MegOX6Bv = EfqJ9()
    
    @Published var kpjdlNA22: Bool = false
    
    private init() {}
    
    //show
    func w9VPVHt() {
        DispatchQueue.main.async {
            self.kpjdlNA22 = true
        }
    }
    
    //hide
    func gCQfGMHte60TbdzVw() {
        DispatchQueue.main.async {
            self.kpjdlNA22 = false
        }
    }
}

struct BMTU5LVVTQYLXCZaN: View {
    @State private var angle: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
            
            Circle()
                .stroke(Color.white.opacity(0.4), lineWidth: 4)
                .frame(width: 50, height: 50)
            
            Circle()
                .trim(from: 0.0, to: 0.25)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [Color.cyan, Color.purple]),
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 4, lineCap: .round)
                )
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(angle))
                .onAppear {
                    withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                        angle = 360
                    }
                }
        }
    }
}
