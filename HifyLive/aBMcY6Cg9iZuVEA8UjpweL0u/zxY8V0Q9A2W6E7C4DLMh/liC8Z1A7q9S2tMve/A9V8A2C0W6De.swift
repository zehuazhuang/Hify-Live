//
//  A9V8A2C0W6De.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/15.
//
//初始化云信
import UIKit
import NIMSDK


class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // 1️⃣ 初始化云信
        // 如果暂时不需要推送证书，传空字符串 ""
        NIMSDK.shared().register(withAppID: "你的云信AppKey", cerName: "")

        return true
    }
}
