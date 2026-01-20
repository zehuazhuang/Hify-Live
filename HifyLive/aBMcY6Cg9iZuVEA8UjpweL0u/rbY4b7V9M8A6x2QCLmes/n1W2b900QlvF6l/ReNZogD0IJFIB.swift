//
//  ReNZogD0IJFIB.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/19.
//

import NIMSDK
import Combine

class CachedRecentSession: Identifiable, ObservableObject {
    let id = UUID()
    let session: NIMSession
    let sessionId: String
    let sessionType: NIMSessionType
    @Published var lastMessageText: String
    @Published var timestamp: TimeInterval
    @Published var unreadCount: Int
    @Published var nickname: String
    @Published var avatarUrl: String

    init(session: NIMSession,
         sessionId: String,
         sessionType: NIMSessionType,
         lastMessageText: String,
         timestamp: TimeInterval,
         unreadCount: Int,
         nickname: String,
         avatarUrl: String) {
        self.session = session
        self.sessionId = sessionId
        self.sessionType = sessionType
        self.lastMessageText = lastMessageText
        self.timestamp = timestamp
        self.unreadCount = unreadCount
        self.nickname = nickname
        self.avatarUrl = avatarUrl
    }
}

final class ChatViewModel: NSObject, ObservableObject {
    let session: NIMSession

    @Published var messages: [NIMMessage] = []
    @Published var inputText: String = ""

    init(session: NIMSession) {
        self.session = session
        super.init()
        NIMSDK.shared().chatManager.add(self)
    }

    deinit {
        NIMSDK.shared().chatManager.remove(self)
    }

    @MainActor
    func loadHistory() {
        let msgs = NIMSDK.shared().conversationManager.messages(in: session, message: nil, limit: 50) ?? []
        messages = msgs
    }

    func sendText() {
        guard !inputText.isEmpty else { return }

        let message = NIMMessage()
        message.text = inputText

        NIMSDK.shared().chatManager.send(message, to: session) { [weak self] error in
            guard let self else { return }

            if error == nil {
                Task { @MainActor in
                    self.messages.append(message)
                    self.inputText = ""

                    // ✅ 更新最近会话缓存
                    RecentSessionManager.shared.updateCache(with: message, session: self.session)
                }
            }
        }
    }
    
    //模拟对方发消息
    func simulateIncomingMessage() {
        
        let session = NIMSession("对方accid", type: .P2P)
        let message = NIMMessage()
        message.text = "你好，我是模拟消息"
        message.from = "对方accid"
        message.timestamp = Date().timeIntervalSince1970

        RecentSessionManager.shared.updateCache(with: message, session: session)
    }
}

extension ChatViewModel: NIMChatManagerDelegate {
    nonisolated func onRecvMessages(_ messages: [NIMMessage]) {
        Task { @MainActor in
            let newMsgs = messages.filter { $0.session?.sessionId == self.session.sessionId }

            guard !newMsgs.isEmpty else { return }

            self.messages.append(contentsOf: newMsgs)

            // 收到消息时同步缓存
            for msg in newMsgs {
                if let s = msg.session {
                    RecentSessionManager.shared.updateCache(with: msg, session: s)
                }
            }
        }
    }
}
