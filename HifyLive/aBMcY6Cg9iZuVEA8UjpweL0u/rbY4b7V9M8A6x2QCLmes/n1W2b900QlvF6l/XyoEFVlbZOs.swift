import Combine
import Foundation
import NIMSDK
//状态
enum SendStatus {
    case sending
    case success
    case failed(reason: FailReason)
}

enum FailReason {
    case sensitive
    case network
    case unknown
    
    var message: String {
        switch self {
        case .sensitive:
            return "发送失败：包含敏感内容"
        case .network:
            return "发送失败：网络异常"
        case .unknown:
            return "发送失败"
        }
    }
}
    
    //私聊模型
    enum ChatMessageContent {
        case text(String)
        case image(url: String?, size: CGSize)
    }
    
class ChatMessage: Identifiable, ObservableObject {
    let id = UUID()
    let messageId: String
    let isOutgoingMsg: Bool
    let timestamp: TimeInterval
    let avatarURL: String?
    
    @Published var content: ChatMessageContent
    @Published var showTime: Bool = false
    @Published var sendStatus: SendStatus = .success

    // 🔥 新增：本地图片缓存
    var localImage: UIImage?

    init(
        messageId: String,
        content: ChatMessageContent,
        isOutgoingMsg: Bool,
        timestamp: TimeInterval,
        avatarURL: String?,
        sendStatus: SendStatus = .success,
        localImage: UIImage? = nil
    ) {
        self.messageId = messageId
        self.content = content
        self.isOutgoingMsg = isOutgoingMsg
        self.timestamp = timestamp
        self.avatarURL = avatarURL
        self.sendStatus = sendStatus
        self.localImage = localImage
    }
}
    //操作私聊
    final class ChatViewModel: NSObject, ObservableObject, NIMChatManagerDelegate {
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
        
        func updateRecentSession(_ message: ChatMessage) {
                guard let recent = RecentSessionStore.shared.cache.first(where: { $0.sessionId == session.sessionId }) else {
                    return
                }

                switch message.content {
                case .text(let text):
                    recent.lastMessageText = text
                case .image:
                    recent.lastMessageText = "[Picture]"
                }

                recent.timestamp = message.timestamp
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
                guard let self = self else { return }

                Task { @MainActor in
                    let lastTimestamp = self.messages.last?.timestamp ?? 0

                    let status: SendStatus
                    if let err = error as NSError? {
                        switch err.code {
                        case 801:
                            status = .failed(reason: FailReason.sensitive)
                        case NSURLErrorNotConnectedToInternet:
                            status = .failed(reason: FailReason.network)
                        default:
                            status = .failed(reason: FailReason.unknown)
                        }
                    } else {
                        status = .success
                    }

                    let chatMsg = ChatMessage(
                        messageId: message.messageId,
                        content: .text(self.inputText),
                        isOutgoingMsg: true,
                        timestamp: message.timestamp,
                        avatarURL: self.myAvatarURL,
                        sendStatus: status
                    )

                    chatMsg.showTime = (message.timestamp - lastTimestamp > 300)
                    self.messages.append(chatMsg)
                    self.updateRecentSession(chatMsg)
                    
                    switch status {
                    case .success:
                        self.inputText = ""
                    case .failed, .sending:
                        break
                    }

                }
            }
        }
        
        func sendImage(_ image: UIImage) {
            guard let data = image.jpegData(compressionQuality: 0.8) else { return }

            // 占位消息对象
            let placeholderMsg = ChatMessage(
                messageId: UUID().uuidString, // 可以用 UUID
                content: .image(url: nil, size: image.size),
                isOutgoingMsg: true,
                timestamp: Date().timeIntervalSince1970,
                avatarURL: myAvatarURL,
                sendStatus: .sending,
                localImage: image
            )

            // 先显示占位消息
            Task { @MainActor in
                self.messages.append(placeholderMsg)
                self.updateRecentSession(placeholderMsg)
            }

            // 上传 + 鉴黄 + 发送消息
            Task {
                do {
                    // 1️⃣ 上传并鉴黄
                    guard let url = try await pt5uxFoWaSL6Aj2i9XTDnpHDrEQ08I(image) else {
                        print("❌ 上传失败或图片不合规")
                        Task { @MainActor in
                            placeholderMsg.sendStatus = .failed(reason: .sensitive)
                            placeholderMsg.objectWillChange.send()
                        }
                        return
                    }

                    print("✅ 图片通过鉴黄，URL:", url)

                    // 2️⃣ 构建 NIMMessage
                    let imageObject = NIMImageObject(data: data, extension: "jpg")
                    let message = NIMMessage()
                    message.messageObject = imageObject

                    // 3️⃣ 异步发送消息
                    do {
                        try await NIMSDK.shared().chatManager.send(message, to: session)
                        Task { @MainActor in
                            placeholderMsg.sendStatus = .success
                            placeholderMsg.objectWillChange.send()
                        }
                    } catch {
                        Task { @MainActor in
                            placeholderMsg.sendStatus = .failed(reason: .unknown)
                            placeholderMsg.objectWillChange.send()
                        }
                        print("❌ 消息发送失败:", error)
                    }

                } catch {
                    Task { @MainActor in
                        placeholderMsg.sendStatus = .failed(reason: .unknown)
                        placeholderMsg.objectWillChange.send()
                    }
                    print("❌ 上传或鉴黄失败:", error)
                }
            }
        }
        
        

    }

//switch status {
//case .success:
//    if let imageObject = message.messageObject as? NIMImageObject {
//        // 🔥 强制触发刷新
//        placeholderMsg.objectWillChange.send()
//        placeholderMsg.content = .image(url: imageObject.url, size: imageObject.size)
//    }
//case .failed, .sending:
//    break
//}

// MARK: - 接收消息
    extension ChatViewModel {
        nonisolated func onRecvMessages(_ messages: [NIMMessage]) {
            Task { @MainActor in
                var lastTimestamp = self.messages.last?.timestamp ?? 0

                for msg in messages {
                    guard let session = msg.session,
                          session.sessionId == self.session.sessionId else { continue }

                    let avatar = msg.isOutgoingMsg ? myAvatarURL : opponentAvatarURL
                    let timestamp = msg.timestamp

                    var chatMsg: ChatMessage? // 注意这里 var，方便修改状态

                    if let text = msg.text {
                        chatMsg = ChatMessage(
                            messageId: msg.messageId,
                            content: .text(text),
                            isOutgoingMsg: msg.isOutgoingMsg,
                            timestamp: timestamp,
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
                            timestamp: timestamp,
                            avatarURL: avatar
                        )
                    }

                    if let chatMsg = chatMsg { // ✅ 明确绑定类型
                        chatMsg.showTime = (timestamp - lastTimestamp > 300)
                        lastTimestamp = timestamp
                        self.messages.append(chatMsg)
                    }
                }
            }
        }
    }
