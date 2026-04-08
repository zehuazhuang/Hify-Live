import SwiftUI
import UIPilot
import Combine
import NIMSDK
//浮窗系统通知
class XQAQvuU6cZLbgE: ObservableObject {
    static let shared = XQAQvuU6cZLbgE()
    
    @Published var uKbjaEGR: String? = nil //消息文本
    @Published var sVt7blcSwH: Bool = false
    @Published var messageID = UUID()
    
    // 新增字段
    @Published var senderName: String? = nil
    @Published var senderAvatar: String? = nil // 头像可以是本地 Image 或 URL 后处理
    @Published var isSystemMessage: Bool = false
    @Published var sessionId: String? = nil  // 私聊 sessionId
    
    @Published var timestamp: Date = Date()
    
    private var nextMessage: (text: String, name: String?, avatar: String?, isSystem: Bool, sessionId: String?,timestamp: Date)? = nil
    private var currentWorkItem: DispatchWorkItem? = nil
    
    
    private init() {}
    
    // 显示通知（新消息有动画切换）
    func vEnu5pS9V(
        text: String,
        name: String? = nil,
        avatar: String? = nil,
        isSystem: Bool = false,
        sessionId: String? = nil,
        timestamp: Date = Date(),
        duration: Double = 3.0
    ) {
        if sVt7blcSwH {
            nextMessage = (text, name, avatar, isSystem, sessionId,timestamp)
            currentWorkItem?.cancel()
            withAnimation { sVt7blcSwH = false }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                guard let self = self else { return }
                if let msg = self.nextMessage {
                    self.nextMessage = nil
                    self.showMessage(msg.text, name: msg.name, avatar: msg.avatar, isSystem: msg.isSystem, sessionId: msg.sessionId, timestamp: msg.timestamp, duration: duration)
                }
            }
        } else {
            showMessage(text, name: name, avatar: avatar, isSystem: isSystem, sessionId: sessionId, timestamp: timestamp, duration: duration)
        }
    }
    
    private func showMessage(
        _ text: String,
        name: String? = nil,
        avatar: String? = nil,
        isSystem: Bool = false,
        sessionId: String? = nil,
        timestamp: Date,
        duration: Double
    ) {
        messageID = UUID()
        uKbjaEGR = text
        senderName = name
        senderAvatar = avatar
        self.isSystemMessage = isSystem
        self.sessionId = sessionId
        self.timestamp = timestamp
        
        withAnimation { sVt7blcSwH = true }
        
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            withAnimation { self.sVt7blcSwH = false }
        }
        currentWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: workItem)
    }
}

struct XQAQvuU6cZLbgEView: View {
    @ObservedObject var manager = XQAQvuU6cZLbgE.shared
    @State private var offsetY: CGFloat = 0
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    @ObservedObject var sessionStore = RecentSessionStore.shared
    var body: some View {
        if manager.sVt7blcSwH, let message = manager.uKbjaEGR {
            HStack(spacing: 12) {
                if let avatar = manager.senderAvatar {
                    
                    if avatar == "system" {
                        ZJ7h766mz(tMmEWWlfgUag: "eY8bYZrPzzM")
                                           .frame(width: 48, height: 48)
                    }else{
                        rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: avatar)
                                            .frame(width: 48,height: 48)
                                            .clipShape(Circle())
                    }
                    
                } else if manager.isSystemMessage {
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack{
                        if let name = manager.senderName {
                            Text(name)
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .medium
                                )
                        } else if manager.isSystemMessage {
                            Text("Eivo Team")
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .medium
                                )
                        }
                        Spacer()
                        Text("\(manager.timestamp.xq_timeAgo())")
                            .g0LIIcoZQsOjyND9(
                                size: 14,
                                weight: .regular,
                                color: .white.opacity(0.6)
                            )
                    }
                    
                    Text(message)
                        .g0LIIcoZQsOjyND9(
                            size: 14,
                            weight: .regular,
                            color: .white.opacity(0.6)
                        )
                        .lineLimit(1)
                }
                
                Spacer()
            }
            .id(manager.messageID)
            .padding()
            .background(
                Color(red: 13/255, green: 27/255, blue: 41/255)
                    .cornerRadius(12)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color(red: 17/255, green: 226/255, blue: 255/255),
                                Color(red: 217/255, green: 28/255, blue: 255/255),
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 1
                    )
            )
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .offset(y: offsetY)
            .onTapGesture {
                if let sessionId = manager.sessionId {
                    let session = NIMSession(sessionId, type: .P2P)
                    // 1️⃣ 清当前会话未读（UI）
                    GlobalUnreadStore.shared.clearUnread(
                        for: session.sessionId,
                        count: 0
                    )

                    // 2️⃣ 本地缓存同步
                    sessionStore.markSessionRead(sessionId: session.sessionId)
                    
                    if(sessionId == "video-sky-test"){
                        pilot.push(.R9Avd3G1i846xe(session: session))
                    }else{
                        pilot.push(.CgZU7mTgY46l(session: session, opponentAvatarURL: manager.senderAvatar ?? "", qOH29Z5X: false))
                        
                    }
                    
                } else if manager.isSystemMessage {
                    print("系统通知点击")
                }
                // 点击后隐藏通知
                withAnimation { manager.sVt7blcSwH = false }
            }
            .gesture(
                DragGesture(minimumDistance: 10)
                    .onChanged { value in
                        if value.translation.height < 0 { offsetY = value.translation.height }
                    }
                    .onEnded { value in
                        if value.translation.height < -50 {
                            withAnimation { manager.sVt7blcSwH = false }
                        }
                        offsetY = 0
                    }
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .transition(.move(edge: .top).combined(with: .opacity))
            .animation(.spring(), value: manager.sVt7blcSwH)
        }
    }
}
