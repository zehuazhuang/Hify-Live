import Combine
import Foundation
import NIMSDK

//私聊模型
class ChatMessage: Identifiable, ObservableObject {
    let id = UUID()
    let messageId: String
    let text: String?
    let isOutgoingMsg: Bool
    let timestamp: TimeInterval
    let avatarURL: String?
    
    @Published var showTime: Bool = false

    init(messageId: String, text: String?, isOutgoingMsg: Bool, timestamp: TimeInterval, avatarURL: String? = nil) {
        self.messageId = messageId
        self.text = text
        self.isOutgoingMsg = isOutgoingMsg
        self.timestamp = timestamp
        self.avatarURL = avatarURL
    }
}
//操作私聊
final class ChatViewModel: NSObject, ObservableObject {
    let session: NIMSession

    @Published var messages: [ChatMessage] = []
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
        var lastTimestamp: TimeInterval = 0
        self.messages = msgs.map { msg in
            let chatMsg = ChatMessage(
                messageId: msg.messageId,
                text: msg.text,
                isOutgoingMsg: msg.isOutgoingMsg,
                timestamp: msg.timestamp,
            )
            chatMsg.showTime = (msg.timestamp - lastTimestamp > 300)
            lastTimestamp = msg.timestamp
            return chatMsg
        }
    }

    func sendText() {
        guard !inputText.isEmpty else { return }

        let message = NIMMessage()
        message.text = inputText

        NIMSDK.shared().chatManager.send(message, to: session) { [weak self] error in
            guard let self else { return }

            if error == nil {
                Task { @MainActor in
                    let lastTimestamp = self.messages.last?.timestamp ?? 0
                    let chatMsg = ChatMessage(
                        messageId: message.messageId,
                        text: message.text,
                        isOutgoingMsg: true,
                        timestamp: message.timestamp,
                    )
                    chatMsg.showTime = (message.timestamp - lastTimestamp > 300)
                    self.messages.append(chatMsg)
                    self.inputText = ""

                    // 更新最近会话缓存
                    RecentSessionManager.shared.updateCache(with: message, session: self.session)
                }
            }
        }
    }
}

// MARK: - 接收消息
extension ChatViewModel: NIMChatManagerDelegate {
    nonisolated func onRecvMessages(_ messages: [NIMMessage]) {
        Task { @MainActor in
            var lastTimestamp = self.messages.last?.timestamp ?? 0
            for msg in messages {
                guard let session = msg.session, session.sessionId == self.session.sessionId else { continue }

                let chatMsg = ChatMessage(
                    messageId: msg.messageId,
                    text: msg.text,
                    isOutgoingMsg: msg.isOutgoingMsg,
                    timestamp: msg.timestamp
                )
                chatMsg.showTime = (msg.timestamp - lastTimestamp > 300)
                lastTimestamp = msg.timestamp
                self.messages.append(chatMsg)

                // 更新最近会话缓存
                RecentSessionManager.shared.updateCache(with: msg, session: session)
            }
        }
    }
}
