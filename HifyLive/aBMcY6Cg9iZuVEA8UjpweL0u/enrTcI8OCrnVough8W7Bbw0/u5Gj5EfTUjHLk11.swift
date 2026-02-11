import SwiftUI
import UIPilot
import WebKit

//协议网页
struct R4IDIKA6NUAIJGfAL9RJRoayyWWGY1k3: View {
    
    let irJBAop3c1cEIKUf3jOsmjxJfVg:String
    
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255).ignoresSafeArea()
            VStack(spacing: 10) {
                HStack(spacing: 12) {
                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                        .frame(width: 24,height: 24)
                        .onTapGesture {
                            pilot.pop()
                        }
                    Spacer()
                }
               
                .padding(.leading,16)
                syxPKymheDuHDpj8YZDphHB1(woYpip7cBo2EKQWEWjD6eqwol: irJBAop3c1cEIKUf3jOsmjxJfVg)
            }
        }
        
    }
}

/// SwiftUI 可用的网页视图
struct syxPKymheDuHDpj8YZDphHB1: UIViewRepresentable {
    let woYpip7cBo2EKQWEWjD6eqwol: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator

        if let url = URL(string: woYpip7cBo2EKQWEWjD6eqwol) {
            webView.load(URLRequest(url: url))
        }

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // ❌ 不要在这里 load
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {}
}

final class WebKitWarmUp {
    static let shared = WebKitWarmUp()
    private init() {}

    func warm() {
        DispatchQueue.main.async {
            _ = WKWebView(frame: .zero)
        }
    }
}
