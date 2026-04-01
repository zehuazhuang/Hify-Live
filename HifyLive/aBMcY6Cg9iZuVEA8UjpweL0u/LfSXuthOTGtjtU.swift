//
//  LfSXuthOTGtjtU.swift
//  HifyLive
//
//  Created by yangyang on 2026/3/26.
//

import Foundation
import NIMSDK
import Combine
import SwiftUI
import UIPilot
//全服公告
struct GiftNoticeModel {
    let senderName: String      // 送礼人
    let receiverName: String    // 被送人
    let giftName: String        // 礼物名
    let giftCount: Int          // 数量
    let giftImage: String       // 图片URL or 本地名
    let roomId: Int             // 房间ID
}
final class GlobalNoticeManager: ObservableObject {
    static let shared = GlobalNoticeManager()
    
    @Published var model: GiftNoticeModel?
    @Published var isShowing: Bool = false
    var currentStay: Double = 3.0
    
    private var cancellable: AnyCancellable?
    
    func show(_ model: GiftNoticeModel, stay: Double = 3.0) {
        self.model = model
        self.currentStay = stay
        withAnimation(.easeInOut(duration: 1)) {
            isShowing = true
        }
        
        cancellable?.cancel()
        cancellable = Just(())
            .delay(for: .seconds(stay + 2), scheduler: RunLoop.main)
            .sink { [weak self] in
                withAnimation(.easeInOut(duration: 1)) {
                    self?.isShowing = false
                }
            }
    }
}
struct MarqueeContent<Content: View>: View {
    let content: Content
    let speed: Double
    let maxWidth: CGFloat? // ✅ 新增最大宽度参数
    
    @State private var offset: CGFloat = 0
    @State private var contentWidth: CGFloat = 0
    
    init(speed: Double = 30,
         maxWidth: CGFloat? = nil,
         @ViewBuilder content: () -> Content) {
        self.content = content()
        self.speed = speed
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        GeometryReader { geo in
            let containerWidth = maxWidth ?? geo.size.width 
            HStack(spacing: 0) {
                content
                    .fixedSize(horizontal: true, vertical: false)
                    .background(
                        GeometryReader { inner in
                            Color.clear.onAppear {
                                contentWidth = inner.size.width
                                start(container: containerWidth)
                            }
                        }
                    )
                    .offset(x: offset)
                
                if contentWidth > containerWidth {
                    content
                        .frame(width: contentWidth)
                        .offset(x: offset + contentWidth + 20)
                }
            }
            .frame(width: containerWidth, alignment: .leading)
            .clipped()
        }
    }
    
    private func start(container: CGFloat) {
        guard contentWidth > container else { return }
        
        offset = 0
        let duration = (contentWidth + container) / speed
        
        DispatchQueue.main.async {
            withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                offset = -(contentWidth + 20)
            }
        }
    }
}

    
struct GlobalGiftNoticeView: View {

    @ObservedObject var manager = GlobalNoticeManager.shared
    var currentRoomId: Int

    @State private var xOffset: CGFloat = UIScreen.main.bounds.width
    @State private var showNotice: Bool = false
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>
    

    var body: some View {
        if let model = manager.model,
           manager.isShowing {

            ZStack {
                HStack {
                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: model.giftImage)
                        .frame(width: 58, height: 58)
                    Spacer()
                }
                
                HStack(spacing: 8) {
                    MarqueeContent {
                        buildText(model: model)
                    }.offset(y:20)

                   
                    if model.roomId != currentRoomId {
                        ZJ7h766mz(tMmEWWlfgUag: "nPiyjyCZ2")
                            .frame(width: 48, height: 22)
                            .onTapGesture {
                                jumpToRoom(model.roomId)
                            }
                    }
                    
                }.padding(.leading,60)

                   
                
               
            }
            .padding(.horizontal, 16)
            .frame(height: 59)
            .frame(maxWidth: .infinity)
            .background(
                ZJ7h766mz(tMmEWWlfgUag: "dOtJzip3FNW2")
                    .frame(height: 58)
                    .frame(maxWidth: .infinity)
            )
            .cornerRadius(18)
            .padding(.horizontal, 16)
            .padding(.top, 58)
            .offset(x: xOffset)
            .onAppear {
                animateInOut(stay: manager.currentStay)
            }
        }
    }

    func animateInOut(stay: Double) {
        // 初始位置屏幕右侧
        xOffset = UIScreen.main.bounds.width

        // 飞入 1s
        withAnimation(.easeOut(duration: 1)) {
            xOffset = 0
        }

        // 停留 stay 秒后飞出
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 + stay) {
            withAnimation(.easeIn(duration: 1)) {
                xOffset = -UIScreen.main.bounds.width
            }
        }
    }

    @ViewBuilder
    func buildText(model: GiftNoticeModel) -> some View {
        HStack(spacing: 0) {
            Text(model.senderName)
                .g0LIIcoZQsOjyND9(size: 14, weight: .medium,
                                  color: Color(red: 23/255, green: 220/255, blue: 255/255))

            Text(" Send ")
                .g0LIIcoZQsOjyND9(size: 14, weight: .medium)

            Text(model.receiverName)
                .g0LIIcoZQsOjyND9(size: 14, weight: .medium,
                                  color: Color(red: 89/255, green: 247/255, blue: 255/255))

            Text(" \(model.giftName) X\(model.giftCount).")
                .g0LIIcoZQsOjyND9(size: 14, weight: .medium)
        }
        .padding(.leading, 60)
        .lineLimit(1)
        .fixedSize(horizontal: true, vertical: false)
    }
    
    private func jumpToRoom(_ id: Int) {
        print("跳转房间: \(id)")
        LiveSessionManager.shared.currentChannelUserId = UInt(id)
        pilot.push(
            .zhwyzs0gELive(
              
                localUid: UInt(IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId")),
                zA9Y4W6LUid: UInt(id)
            )
        )
    }
}

