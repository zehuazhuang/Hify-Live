//
//  ReNZogD0IJFIB.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/19.
//

import NIMSDK
import Combine

final class ChatViewModel: NSObject, ObservableObject {

    // ⭐ 非隔离安全字段
    let sessionId: String
    let sessionType: NIMSessionType

    @MainActor
    let session: NIMSession

    @Published var messages: [NIMMessage] = []
    @Published var inputText: String = ""

    init(session: NIMSession) {
        self.session = session
        self.sessionId = session.sessionId
        self.sessionType = session.sessionType

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
                }
            }
        }
    }
    
    func fetchUserInfo(userId: String, completion: @escaping (NIMUser?) -> Void) {
            NIMSDK.shared().userManager.fetchUserInfos([userId]) { users, error in
                guard error == nil else {
                    completion(nil)
                    return
                }
                let user = users?.first
                completion(user)
            }
        }
}

extension ChatViewModel: NIMChatManagerDelegate {

    nonisolated func onRecvMessages(_ messages: [NIMMessage]) {

        let newMsgs = messages.filter {
            $0.session?.sessionId == sessionId &&
            $0.session?.sessionType == sessionType
        }

        guard !newMsgs.isEmpty else { return }

        Task { @MainActor in
            self.messages.append(contentsOf: newMsgs)
        }
    }
}
