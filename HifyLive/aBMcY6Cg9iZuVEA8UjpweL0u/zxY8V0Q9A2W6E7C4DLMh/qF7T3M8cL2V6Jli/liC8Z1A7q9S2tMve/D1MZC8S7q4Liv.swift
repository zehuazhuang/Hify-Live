//
//  D1MZC8S7q4Liv.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//
import UIKit
import SnapKit

final class LiveViewController: UIViewController {

    // MARK: - UI
    private let remoteVideoView = UIView()

    // MARK: - Params
    var channelId: String = ""
    var rtcToken: String = ""
    var uid: UInt = 0
    
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        startWatching()
    }

    private func setupUI() {
        view.addSubview(remoteVideoView)
        remoteVideoView.backgroundColor = .black

        remoteVideoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func startWatching() {
        
        
        AgoraManager.shared.setup()
        AgoraManager.shared.joinChannel(
            channelId: channelId,
            token: rtcToken,
            uid: uid,
            remoteView: remoteVideoView
        )
    }

    deinit {
        AgoraManager.shared.leaveChannel()
    }
}
