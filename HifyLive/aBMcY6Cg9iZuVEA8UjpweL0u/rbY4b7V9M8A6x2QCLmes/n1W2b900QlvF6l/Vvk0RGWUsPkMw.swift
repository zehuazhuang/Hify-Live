////
////  Vvk0RGWUsPkMw.swift
////  HifyLive
////
////  Created by yangyang on 2026/2/7.
////
//
//import RealmSwift
//
//class DBChatMessage: Object {
//    @Persisted(primaryKey: true) var messageId: String
//
//    @Persisted var sessionId: String
//    @Persisted var isOutgoingMsg: Bool
// //   @Persisted var timestamp: TimeInterval
//    @Persisted var avatarURL: String?
//
//    // content
//    @Persisted var type: String // "text" / "image"
//    @Persisted var text: String?
//    @Persisted var imageURL: String?
//    @Persisted var imageWidth: Double
//    @Persisted var imageHeight: Double
//
//    // status
//    @Persisted var sendStatus: String
//    @Persisted var failReason: String?
//
//    // 本地图片路径（只存路径！）
//    @Persisted var localImagePath: String?
//}
