//
//  EM8bV9Y42C0zh.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//

import SwiftUI

struct LiveViewControllerWrapper: UIViewControllerRepresentable {
    let roomId: String
    let rtcToken: String
    let isBroadcaster: Bool

    func makeUIViewController(context: Context) -> LiveViewController {
        let vc = LiveViewController()
        vc.roomId = roomId
        vc.rtcToken = rtcToken
        vc.isBroadcaster = isBroadcaster
        return vc
    }

    func updateUIViewController(_ uiViewController: LiveViewController, context: Context) {}
}



//LiveViewControllerWrapper(roomId: "test_room_001", rtcToken: "声网token", isBroadcaster: true) 调用
