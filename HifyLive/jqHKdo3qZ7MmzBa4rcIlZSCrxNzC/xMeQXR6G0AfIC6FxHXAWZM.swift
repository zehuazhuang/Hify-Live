import SwiftUI
import Combine

//loading

final class EfqJ9: ObservableObject {
    static let hlLgQUr6MegOX6Bv = EfqJ9()
    
    @Published var kpjdlNA22: Bool = false
    @Published var nZ9V4xF6Qw: String? = nil //loding 文案
    private init() {}
    
    //show
    func w9VPVHt(nZ9V4xF6Qw: String? = nil) {
        DispatchQueue.main.async {
            self.nZ9V4xF6Qw = nZ9V4xF6Qw
            self.kpjdlNA22 = true
        }
    }
    
    //hide
    func gCQfGMHte60TbdzVw() {
        DispatchQueue.main.async {
            self.kpjdlNA22 = false
            self.nZ9V4xF6Qw = nil
        }
    }
}

struct BMTU5LVVTQYLXCZaN: View {
    @State private var angle: Double = 0
    @ObservedObject var manager = EfqJ9.hlLgQUr6MegOX6Bv
    
    var body: some View {
        if manager.kpjdlNA22 {
            ZStack {
                
                
                Color.black.opacity(0.7)
                    .ignoresSafeArea()
                
                // 中间HUD
                VStack(spacing: 16) {
                    
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.3), lineWidth: 4)
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
                    
                    
                    if let text = manager.nZ9V4xF6Qw {
                        Text(text)
                            .g0LIIcoZQsOjyND9(
                                size: 16,
                                weight: .regular,
                              
                            )
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 20)
                .frame(width: 251)
                
            }
        }
    }
}
