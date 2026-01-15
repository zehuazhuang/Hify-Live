//
//  D1MZC8S7q4Liv.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//

import UIKit
import SnapKit
import AgoraRtcKit

final class LiveViewController: UIViewController {

    // MARK: - UI
    private let localVideoView = UIView()
    private var remoteVideoViews: [UInt: UIView] = [:] // 远端用户 UID -> UIView

    // MARK: - Properties
    var roomId: String = "test_room_001"
    var rtcToken: String = "声网token"
    var isBroadcaster: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        startLive()
    }

    // MARK: - UI Setup
    private func setupUI() {
        // 本地视频
        view.addSubview(localVideoView)
        localVideoView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 占满全屏
        }

        // 可以预先创建一个小窗口用来显示远端用户
        // 真实项目可以动态创建
        let remoteView = UIView()
        view.addSubview(remoteView)
        remoteView.backgroundColor = .darkGray
        remoteView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.right.equalToSuperview().inset(20)
        }
        remoteVideoViews[12345] = remoteView // 假设远端 UID = 12345
        AgoraManager.shared.bindRemoteView(remoteView, for: 12345)
    }

    // MARK: - Start Live
    private func startLive() {
        // 1️⃣ 初始化声网引擎
        AgoraManager.shared.setup()

        // 2️⃣ 加入频道
        AgoraManager.shared.joinChannel(
            roomId: roomId,
            token: rtcToken,
            isBroadcaster: isBroadcaster,
            preview: isBroadcaster ? localVideoView : nil
        )
    }

    // MARK: - Helpers
    func addRemoteUser(uid: UInt) {
        // 动态创建远端视频窗口
        let remoteView = UIView()
        view.addSubview(remoteView)
        remoteView.backgroundColor = .darkGray
        remoteView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
            make.top.right.equalToSuperview().inset(20)
        }

        remoteVideoViews[uid] = remoteView
        AgoraManager.shared.bindRemoteView(remoteView, for: uid)
    }

    func removeRemoteUser(uid: UInt) {
        if let view = remoteVideoViews[uid] {
            view.removeFromSuperview()
            remoteVideoViews.removeValue(forKey: uid)
        }
    }

    deinit {
        // 离开频道，清理远端视图
        AgoraManager.shared.leaveChannel()
        remoteVideoViews.forEach { $0.value.removeFromSuperview() }
        remoteVideoViews.removeAll()
    }
}
