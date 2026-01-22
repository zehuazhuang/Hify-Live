import SwiftUI
import AgoraRtcKit

enum AgoraClientRole : Int {
    case broadcaster  // 主播
    case audience     // 观众
}


struct ContentView: View {
    @State private var role: AgoraRtcKit.AgoraClientRole = .broadcaster  // ✅ 使用 SDK 类型
    
    var body: some View {
        VStack {
            LiveView(role: role, roomId: "room123", uid: 12345)
                .edgesIgnoringSafeArea(.all)
            
            Button("切换角色") {
                role = (role == .broadcaster) ? .audience : .broadcaster
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}
