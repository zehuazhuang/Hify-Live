import Combine
import Foundation
import NIMSDK

//私聊模型
enum ChatMessageContent {
    case text(String)
    case image(url: String?, size: CGSize)
}

class ChatMessage: Identifiable, ObservableObject {
    let id = UUID()
    let messageId: String
    let content: ChatMessageContent
    let isOutgoingMsg: Bool
    let timestamp: TimeInterval
    let avatarURL: String?

    @Published var showTime: Bool = false

    init(
        messageId: String,
        content: ChatMessageContent,
        isOutgoingMsg: Bool,
        timestamp: TimeInterval,
        avatarURL: String?
    ) {
        self.messageId = messageId
        self.content = content
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

    // ✅ 自己头像和对方头像
    let myAvatarURL: String
    let opponentAvatarURL: String

    init(session: NIMSession, myAvatarURL: String, opponentAvatarURL: String) {
        self.session = session
        self.myAvatarURL = myAvatarURL
        self.opponentAvatarURL = opponentAvatarURL
        super.init()
        NIMSDK.shared().chatManager.add(self)
    }

    deinit {
        NIMSDK.shared().chatManager.remove(self)
    }

    @MainActor
    func loadHistory() {
        let msgs = NIMSDK.shared()
            .conversationManager
            .messages(in: session, message: nil, limit: 50) ?? []

        var lastTimestamp: TimeInterval = 0
        var result: [ChatMessage] = []

        for msg in msgs {
            let avatar = msg.isOutgoingMsg ? myAvatarURL : opponentAvatarURL

            let chatMsg: ChatMessage?

            if let text = msg.text {
                chatMsg = ChatMessage(
                    messageId: msg.messageId,
                    content: .text(text),
                    isOutgoingMsg: msg.isOutgoingMsg,
                    timestamp: msg.timestamp,
                    avatarURL: avatar
                )
            } else if let imageObject = msg.messageObject as? NIMImageObject {
                let size = CGSize(
                    width: imageObject.size.width,
                    height: imageObject.size.height
                )

                chatMsg = ChatMessage(
                    messageId: msg.messageId,
                    content: .image(
                        url: imageObject.url,
                        size: size
                    ),
                    isOutgoingMsg: msg.isOutgoingMsg,
                    timestamp: msg.timestamp,
                    avatarURL: avatar
                )
            } else {
                chatMsg = nil
            }

            if let chatMsg {
                chatMsg.showTime = (msg.timestamp - lastTimestamp > 300)
                lastTimestamp = msg.timestamp
                result.append(chatMsg)
            }
        }

        self.messages = result
    }

    func sendText() {
        guard !inputText.isEmpty else { return }

        let message = NIMMessage()
        message.text = inputText

        NIMSDK.shared().chatManager.send(message, to: session) { [weak self] error in
            guard let self, error == nil else { return }

            Task { @MainActor in
                let lastTimestamp = self.messages.last?.timestamp ?? 0

                let chatMsg = ChatMessage(
                    messageId: message.messageId,
                    content: .text(self.inputText),
                    isOutgoingMsg: true,
                    timestamp: message.timestamp,
                    avatarURL: self.myAvatarURL
                )

                chatMsg.showTime = (message.timestamp - lastTimestamp > 300)

                self.messages.append(chatMsg)
                self.inputText = ""

                RecentSessionManager.shared.updateCache(with: message, session: self.session)
            }
        }
    }
    
    func sendImage(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return }

        // ✅ 这里必须有 extension
        let imageObject = NIMImageObject(
            data: data,
            extension: "jpg"
        )

        let message = NIMMessage()
        message.messageObject = imageObject

        NIMSDK.shared().chatManager.send(message, to: session) { [weak self] error in
            guard let self, error == nil else { return }

            Task { @MainActor in
                let size = CGSize(
                    width: imageObject.size.width,
                    height: imageObject.size.height
                )

                let chatMsg = ChatMessage(
                    messageId: message.messageId,
                    content: .image(
                        url: imageObject.url,   // 可能暂时是 nil
                        size: size
                    ),
                    isOutgoingMsg: true,
                    timestamp: message.timestamp,
                    avatarURL: self.myAvatarURL
                )

                self.messages.append(chatMsg)
                RecentSessionManager.shared.updateCache(with: message, session: self.session)
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
                guard let session = msg.session,
                      session.sessionId == self.session.sessionId else { continue }

                let avatar = msg.isOutgoingMsg ? myAvatarURL : opponentAvatarURL

                if let text = msg.text {
                    // 文本
                    let chatMsg = ChatMessage(
                        messageId: msg.messageId,
                        content: .text(text),
                        isOutgoingMsg: msg.isOutgoingMsg,
                        timestamp: msg.timestamp,
                        avatarURL: avatar
                    )
                    self.messages.append(chatMsg)

                } else if let imageObject = msg.messageObject as? NIMImageObject {
                    // 图片
                    let size = CGSize(
                        width: imageObject.size.width,
                        height: imageObject.size.height
                    )

                    let chatMsg = ChatMessage(
                        messageId: msg.messageId,
                        content: .image(
                            url: imageObject.url,
                            size: size
                        ),
                        isOutgoingMsg: msg.isOutgoingMsg,
                        timestamp: msg.timestamp,
                        avatarURL: avatar
                    )

                    chatMsg.showTime = (msg.timestamp - lastTimestamp > 300)
                    lastTimestamp = msg.timestamp

                    self.messages.append(chatMsg)
                }
            }
        }
    }
}
