import Combine
import Foundation
import NIMSDK
//状态
enum SendStatus: Equatable {
    case sending
    case success
    case failed(reason: FailReason)
}

enum FailReason: Equatable {
    case sensitive
    case network
    case unknown
    case wTiahblock
    
    var message: String {
        switch self {
        case .sensitive:
            return "发送失败：包含敏感内容"
        case .network:
            return "发送失败：网络异常"
        case .unknown:
            return "发送失败"
        case .wTiahblock:
            return "被拉黑发不出"
        }
    }
}

//礼物模型
struct GiftAttachment: Codable {
    let giftId: Int
    let giftNum: Int
    let giftPrice: Int
    let giftIcon: String
    let giftImg: String
}
    
    //私聊模型
    enum ChatMessageContent {
        case text(String)
        case image(url: String?, size: CGSize)
        case gift(GiftAttachment)
    }
    
class ChatMessage: Identifiable, ObservableObject {
    let id = UUID()
    let messageId: String
    let isOutgoingMsg: Bool
    let timestamp: TimeInterval
    let avatarURL: String?
    
    var nimMessage: NIMMessage?
    
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
        localImage: UIImage? = nil,
        nimMessage: NIMMessage? = nil
    ) {
        self.messageId = messageId
        self.content = content
        self.isOutgoingMsg = isOutgoingMsg
        self.timestamp = timestamp
        self.avatarURL = avatarURL
        self.sendStatus = sendStatus
        self.localImage = localImage
        self.nimMessage = nimMessage
    }
}
    //操作私聊
    final class ChatViewModel: NSObject, ObservableObject, NIMChatManagerDelegate {
        let session: NIMSession
        
        @Published var messages: [ChatMessage] = []
        @Published var inputText: String = ""
        
        var onMessageUpdated: (() -> Void)?
        
        var onReceiveGift: ((_ giftImg: String,_ giftNum:Int,_ giftId:Int,_ msg: ChatMessage) -> Void)?
        
        
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
                case .gift:
                    recent.lastMessageText = "[Gift messages]"
                }
           

                recent.timestamp = message.timestamp
            
            Task{
               await RecentSessionStore.shared.fetchRecentSessions()
            }
            }
        
        //加载历史消息
        @MainActor
        func loadHistory() {
            let msgs = NIMSDK.shared()
                .conversationManager
                .messages(in: session, message: nil, limit: 1000) ?? []
            
            var lastTimestamp: TimeInterval = 0
            var result: [ChatMessage] = []
            
            for msg in msgs {
              
           
                let avatar = msg.isOutgoingMsg ? myAvatarURL : opponentAvatarURL
                
                let chatMsg: ChatMessage?
                
                // 🔹 发送状态只有两种
                        let sendStatus: SendStatus = (msg.isOutgoingMsg && msg.isBlackListed)
                            ? .failed(reason: .wTiahblock)
                            : .success
                
                if let text = msg.text {
                    chatMsg = ChatMessage(
                        messageId: msg.messageId,
                        content: .text(text),
                        isOutgoingMsg: msg.isOutgoingMsg,
                        timestamp: msg.timestamp,
                        avatarURL: avatar,
                        sendStatus: sendStatus,
                        nimMessage : msg
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
                        avatarURL: avatar,
                        sendStatus: sendStatus,
                        nimMessage : msg
                    )
                }
                else if msg.messageType == .custom {
                    guard let customObject = msg.messageObject as? NIMCustomObject,
                          let attachment = customObject.attachment else {
                        
                        chatMsg = nil
                        continue
                    }
                    let jsonString = attachment.encode()
                    
                    guard let data = jsonString.data(using: .utf8) else {
                       
                        chatMsg = nil
                        continue
                    }
                    
                    do {
                        guard let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                              let type = dict["attachType"] as? String, type == "SEND_GIFT" else {
                          
                            chatMsg = nil
                            continue
                        }
                      

                        guard let giftId = dict["giftId"] as? Int,
                              let giftNum = dict["giftNum"] as? Int,
                              let giftPrice = dict["giftPrice"] as? Int,
                              let giftIcon = dict["smallImg"] as? String,
                              let giftImg = dict["giftIcon"] as? String else {
                          
                            chatMsg = nil
                            continue
                        }
                        
                        let gift = GiftAttachment(
                            giftId: giftId,
                            giftNum: giftNum,
                            giftPrice: giftPrice,
                            giftIcon: giftIcon,
                            giftImg: giftImg
                        )
                        chatMsg = ChatMessage(
                            messageId: msg.messageId,
                            content: .gift(gift),
                            isOutgoingMsg: msg.isOutgoingMsg,
                            timestamp: msg.timestamp,
                            avatarURL: avatar,
                            sendStatus: sendStatus,
                            nimMessage: msg
                        )
                        
                    } catch {
                        chatMsg = nil
                        continue
                    }
                }
                else {
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
        //敏感词拦截
        func canSendMessage(_ text: String) -> Bool {
            let result = V2NIMClientAntispamUtil.checkTextAntispam(text, replace: nil)

          
            if result.operateType.rawValue == 1 {
                return false
            }

           
            if result.replacedText != text {
                return false
            }

            return true
        }
        
        //发送文本
        func sendText(qAiRzAlJType: Int)  {// qAiRzAlJType: Int 0未被拉黑 1被拉黑
            guard !inputText.isEmpty else { return }
            
            
            
            if EwNwNujEwMzTHX.shared.y8smb1UywDB5G3(inputText) {
                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("HhzzOA2eHTNz8JANI+0SRU+WQxpWarJBlpyksmOWZzwSq+7uMt/CRKetmZWH5thv",type: 1)
                     self.inputText = ""
                    return
                }
           
            
            
            let message = NIMMessage()

           
            
            message.text = inputText
           
            // 先创建本地 ChatMessage，状态为 sending
            let chatMsg = ChatMessage(
                messageId: message.messageId,
                content: .text(inputText),
                isOutgoingMsg: true,
                timestamp: message.timestamp,
                avatarURL: self.myAvatarURL,
                sendStatus:.sending,//qAiRzAlJType == 0 ? .sending : .failed(reason: .wTiahblock),
                nimMessage: message
            )
            
            let lastTimestamp = self.messages.last?.timestamp ?? 0
            chatMsg.showTime = (message.timestamp - lastTimestamp > 300)
            
            self.messages.append(chatMsg)
            self.updateRecentSession(chatMsg)
            
            
            
            

             NIMSDK.shared().chatManager.send(message, to: session) { error in
                
                if let err = error as NSError? {
                   
                    Task { @MainActor in
                        if let index = self.messages.firstIndex(where: { $0.nimMessage === message }) {
                            switch err.code {
                            case 801:
                                self.messages[index].sendStatus = .failed(reason: .sensitive)
                            case NSURLErrorNotConnectedToInternet:
                                self.messages[index].sendStatus = .failed(reason: .network)
                            default:
                                self.messages[index].sendStatus = .failed(reason: .unknown)
                            }
                        }
                    }
                }
                 
                 
                 
                 
              
                 
                 if let index = self.messages.firstIndex(where: { $0.messageId == message.messageId }) {
                     self.messages[index].sendStatus = qAiRzAlJType == 1 ? .failed(reason: .wTiahblock) :  .success
                 }
                 self.inputText = ""
                 
                
            }
        }
        //发送图片
        func sendImage(_ image: UIImage,qAiRzAlJType: Int) {
            guard let data = image.jpegData(compressionQuality: 0.8) else { return }
            let message = NIMMessage()
            
            let placeholderMsg = ChatMessage(
                messageId: UUID().uuidString,
                content: .image(url: nil, size: image.size),
                isOutgoingMsg: true,
                timestamp: Date().timeIntervalSince1970,
                avatarURL: myAvatarURL,
                sendStatus: qAiRzAlJType == 0 ? .sending : .failed(reason: .wTiahblock),
                localImage: image,
                nimMessage: message
            )
            
            let lastTimestamp = self.messages.last?.timestamp ?? 0
            placeholderMsg.showTime = (message.timestamp - lastTimestamp > 300)

            
            Task { @MainActor in
                self.messages.append(placeholderMsg)
                self.updateRecentSession(placeholderMsg)
            }
            
   

            
            Task {
                do {
                    
                    guard let url = try await pt5uxFoWaSL6Aj2i9XTDnpHDrEQ08I(image, isIA8MTA: true) else {
                      
                        Task { @MainActor in
                            placeholderMsg.sendStatus = .failed(reason: .sensitive)
                        }
                        return
                    }

                    

                    // 2️⃣ 构建 NIMMessage
                    let imageObject = NIMImageObject(data: data, extension: "jpg")
                    let message = NIMMessage()
                    message.messageObject = imageObject

                    
                    do {
                        try await NIMSDK.shared().chatManager.send(message, to: session)
                        Task { @MainActor in
                            placeholderMsg.sendStatus = qAiRzAlJType == 0 ? .success : .failed(reason: .wTiahblock)
                        }
                    } catch {
                        Task { @MainActor in
                            placeholderMsg.sendStatus = .failed(reason: .unknown)
                        }
                    }

                } catch {
                    Task { @MainActor in
                        placeholderMsg.sendStatus = .failed(reason: .unknown)
                    }
                }
            }
        }
        
        
        @MainActor
        func resendMessage(_ message: ChatMessage) async {
            
           
            
            guard message.isOutgoingMsg else { return }
            guard case .failed = message.sendStatus else { return }
            guard let nimMsg = message.nimMessage else { return }

            message.sendStatus = .sending
            
            do {

                // 是否被拉黑
                let result = await T0viKk.wSremNeLspPkPRHBJnlVCs5w
                    .ngI7Y2A8C4E0ZQ9W6xL(wTEEJpZz0iGVK: session.sessionId)

                let blocked = result.int("beBlocked") == 1

                try NIMSDK.shared().chatManager.resend(nimMsg)

                message.sendStatus = blocked
                    ? .failed(reason: .wTiahblock)
                    : .success

                if !blocked {
                  
                    if let index = messages.firstIndex(where: { $0 === message }) {
                       
                        let item = messages.remove(at: index)
                        self.messages.append(item)
                        messages = Array(messages)
                        onMessageUpdated?()
                    }
                }

            } catch {

                message.sendStatus = .failed(reason: .unknown)
 
            }
        }
        



    }



// MARK: - 接收消息
    extension ChatViewModel {
        nonisolated func onRecvMessages(_ messages: [NIMMessage]) {
            
            
            Task { @MainActor in
                var lastTimestamp = self.messages.last?.timestamp ?? 0
                
              

                for msg in messages {
                   
                    guard let session = msg.session,
                          session.sessionType == .P2P,
                          session.sessionId == self.session.sessionId else { continue }

                    let avatar = msg.isOutgoingMsg ? myAvatarURL : opponentAvatarURL
                    let timestamp = msg.timestamp

                    var chatMsg: ChatMessage?

                    if let text = msg.text {
                        chatMsg = ChatMessage(
                            messageId: msg.messageId,
                            content: .text(text),
                            isOutgoingMsg: msg.isOutgoingMsg,
                            timestamp: timestamp,
                            avatarURL: avatar,
                            nimMessage: msg
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
                            avatarURL: avatar,
                            nimMessage: msg
                        )
                    }else if msg.messageType == .custom {
                        guard let customObject = msg.messageObject as? NIMCustomObject,
                              let attachment = customObject.attachment else {
                            chatMsg = nil
                            continue
                        }
                        let jsonString = attachment.encode()
                        guard let data = jsonString.data(using: .utf8) else {
                            chatMsg = nil
                            continue
                        }
                        do {
                            guard let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                                  let type = dict["attachType"] as? String,
                                  type == "SEND_GIFT" else {
                                chatMsg = nil
                                continue
                            }
                            

                            
                            guard let giftId = dict["giftId"] as? Int,
                                  let giftNum = dict["giftNum"] as? Int,
                                  let giftPrice = dict["giftPrice"] as? Int,
                                  let smallImg = dict["smallImg"] as? String,
                                  let giftIcon = dict["giftIcon"] as? String else {
                                chatMsg = nil
                                continue
                            }
                            
                            //渲染动画
                            

                            let gift = GiftAttachment(
                                giftId: giftId,
                                giftNum: giftNum,
                                giftPrice: giftPrice,
                                giftIcon: smallImg,
                                giftImg: giftIcon
                            )

                            chatMsg = ChatMessage(
                                messageId: msg.messageId,
                                content: .gift(gift),
                                isOutgoingMsg: msg.isOutgoingMsg,
                                timestamp: msg.timestamp,
                                avatarURL: avatar,
                                sendStatus: .success,
                                nimMessage: msg
                            )
                            
                            if let chatMsg = chatMsg {
                                onReceiveGift?(giftIcon, giftNum, giftId, chatMsg)
                            }
                        } catch {
                            chatMsg = nil
                        }
                    }
                    
                    if let chatMsg = chatMsg {
                       

                       
                        
                        
                        chatMsg.showTime = (timestamp - lastTimestamp > 300)
                        lastTimestamp = timestamp
                        
                        
                        if case .gift = chatMsg.content {
                            
                        } else {
                            
                            self.messages.append(chatMsg)
                            self.updateRecentSession(chatMsg)
                        }
                    }
                }
            }
        }
        

    }
