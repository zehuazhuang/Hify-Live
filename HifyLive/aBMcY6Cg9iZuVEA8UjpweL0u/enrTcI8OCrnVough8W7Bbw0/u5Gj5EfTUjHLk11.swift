import SwiftUI
import WebKit

struct ContentView: View {
    var body: some View {
        WebView(urlString: "https://www.apple.com")
            .edgesIgnoringSafeArea(.all)
    }
}

/// SwiftUI 可用的网页视图
struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            print("开始加载网页")
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("网页加载完成")
        }

        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("网页加载失败: \(error.localizedDescription)")
        }
    }
}
