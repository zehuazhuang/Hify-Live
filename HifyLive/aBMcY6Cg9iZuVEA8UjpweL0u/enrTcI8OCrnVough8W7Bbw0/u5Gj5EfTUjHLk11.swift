import SwiftUI
import WebKit
import SwiftfulRouting

struct R4IDIKA6NUAIJGfAL9RJRoayyWWGY1k3: View {
    
    let irJBAop3c1cEIKUf3jOsmjxJfVg:String
    
    @Environment(\.router) var uROx9OAsQCkQ
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 10) {
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            uROx9OAsQCkQ.dismissScreen()
                        }
                    Spacer()
                }
                .padding(.top,58)
                .padding(.leading,16)
                syxPKymheDuHDpj8YZDphHB1(woYpip7cBo2EKQWEWjD6eqwol: irJBAop3c1cEIKUf3jOsmjxJfVg)
            }
        }
        .ignoresSafeArea()
    }
}

/// SwiftUI 可用的网页视图
struct syxPKymheDuHDpj8YZDphHB1: UIViewRepresentable {
    let woYpip7cBo2EKQWEWjD6eqwol: String

    func makeUIView(context: Context) -> WKWebView {
        let eVYrrnELXG1snIdHnHTC = WKWebView()
        eVYrrnELXG1snIdHnHTC.navigationDelegate = context.coordinator
        eVYrrnELXG1snIdHnHTC.allowsBackForwardNavigationGestures = true
        return eVYrrnELXG1snIdHnHTC
    }

    func updateUIView(_ hoPQXv45a: WKWebView, context: Context) {
        guard let q0zHug5 = URL(string: woYpip7cBo2EKQWEWjD6eqwol) else { return }
        let a9ML7JJBdfPPhRYv9eBuSyLFR48yd = URLRequest(url: q0zHug5)
        hoPQXv45a.load(a9ML7JJBdfPPhRYv9eBuSyLFR48yd)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {}
}
