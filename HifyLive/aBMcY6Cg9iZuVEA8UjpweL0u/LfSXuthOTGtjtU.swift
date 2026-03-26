//
//  LfSXuthOTGtjtU.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/26.
//

import Foundation
import NIMSDK

// MARK: - 全局公共聊天室管理器
@objc
final class GlobalPublicChatroom: NSObject, NIMChatroomManagerDelegate {
    
    static let shared = GlobalPublicChatroom()
    
    // 当前公共聊天室ID
    private(set) var roomId: String?
    

    
    private override init() {
        super.init()
        NIMSDK.shared().chatroomManager.add(self)
    }
    
    deinit {
        NIMSDK.shared().chatroomManager.remove(self)
    }
    
    // MARK: - 加入公共聊天室
    func enterRoom() async {
        do {
            // 这里调用你自己的接口获取房间信息
            let response = try await iowHG20TQQco()
            let roomId = response.string("roomId")
            if roomId.isEmpty {
                print("获取房间ID失败")
                return
            }
            self.roomId = roomId
            
            let request = NIMChatroomEnterRequest()
            request.roomId = roomId
            
            try await NIMSDK.shared().chatroomManager.enterChatroom(request)
            
            print("✅ 已加入公共聊天室: \(roomId)")
            
        } catch {
            print("❌ 进入公共聊天室失败: \(error)")
        }
    }
    
    // MARK: - 消息回调
    nonisolated func onRecv(_ messages: [NIMMessage], from chatroom: NIMChatroom) {
        Task { @MainActor in
            // 安全解包 roomId
            guard let roomId = chatroom.roomId else { return }
            Self.handleIncoming(messages, roomId: roomId)
        }
    }
    
    @MainActor
    private static func handleIncoming(_ messages: [NIMMessage], roomId: String) {
        print("roomId 回调: \(roomId), 当前 roomId: \(shared.roomId ?? "")")
        
        guard let currentRoomId = shared.roomId, currentRoomId == roomId else {
            return
        }
        
        for message in messages {
            print("公共聊天室消息完整对象: \(message)")
            if let text = message.text {
                print("文本消息: \(text)")
            } else if let custom = message.messageObject as? NIMCustomObject {
                print("自定义消息: \(custom)")
            } else {
                print("其他类型消息: \(message.messageType.rawValue)")
            }
        }
    }
}
