

import Foundation
import NIMSDK

final class NIMManager {

    static let shared = NIMManager()
    private init() {}
    
    

    func login(account: String, token: String, completion: @escaping (Bool) -> Void) {
        // 新版 SDK 登录
        NIMSDK.shared().loginManager.login(account, token: token) { error in
            completion(error == nil)
        }
    }
    
    
    
    // MARK: - 获取最近会话列表
      func fetchRecentSessions() -> [NIMRecentSession] {
          let sessions = NIMSDK.shared().conversationManager.allRecentSessions() ?? []
          return sessions
      }

    // MARK: - 获取聊天记录
    func fetchMessages(sessionId: String, type: NIMSessionType = .P2P, limit: Int = 20) -> [NIMMessage] {
        let session = NIMSession(sessionId, type: type)
        let messages = NIMSDK.shared().conversationManager.messages(in: session, message: nil, limit: limit) ?? []
        return messages
    }

        // MARK: - 发送文本消息
    func sendTextMessage(to sessionId: String, text: String, type: NIMSessionType = .P2P, completion: ((Error?) -> Void)? = nil) {
        let session = NIMSession(sessionId, type: type)
        let message = NIMMessage()
        message.text = text
        NIMSDK.shared().chatManager.send(message, to: session) { error in
            completion?(error)
        }
    }
    
    // MARK: - 创建对话
    func createP2PSession(with accid: String) -> NIMSession {
        // type: .P2P 表示单聊
        let session = NIMSession(accid, type: .P2P)
        return session
    }
}

