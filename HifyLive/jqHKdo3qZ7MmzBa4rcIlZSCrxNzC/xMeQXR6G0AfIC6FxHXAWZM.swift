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
    
    @State private var oSPIksfAo9ODLE49BHA1QUcXNFrX = false
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7)
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.4), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 50, height: 50)
                Circle()
                    .trim(from: 0.0, to: 0.25)
                    .stroke(AngularGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0, green: 242/255, blue: 1),
                            Color(red: 217/255, green: 28/255, blue: 1),
                        ]),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(90)
                    ),style: StrokeStyle(lineWidth: 4, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(oSPIksfAo9ODLE49BHA1QUcXNFrX ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: oSPIksfAo9ODLE49BHA1QUcXNFrX)
                    .onAppear {
                        oSPIksfAo9ODLE49BHA1QUcXNFrX = true
                    }
            }
        }
    }
}
