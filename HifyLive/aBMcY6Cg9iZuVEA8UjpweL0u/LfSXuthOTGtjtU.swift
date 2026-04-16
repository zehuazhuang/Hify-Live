

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
    @Published var noticeId = UUID()   // 用来强制刷新视图，重新触发动画
    
    var currentStay: Double = 3.0
    
    private var queue: [(model: GiftNoticeModel, stay: Double)] = []
    private var isPlaying: Bool = false
    private var hideWorkItem: DispatchWorkItem?
    
    private init() {}
    
    /// 外部调用：加入队列
    func show(_ model: GiftNoticeModel, stay: Double = 3.0) {
        DispatchQueue.main.async {
               self.queue.append((model, stay))
               self.playNextIfNeeded()
           }
    }
    
    /// 清空队列（可选）
    func clearAll() {
        hideWorkItem?.cancel()
        hideWorkItem = nil
        queue.removeAll()
        model = nil
        isShowing = false
        isPlaying = false
    }
    
    private func playNextIfNeeded() {
        guard !isPlaying, !queue.isEmpty else { return }
        
        isPlaying = true
        
        let item = queue.removeFirst()
        self.model = item.model
        self.currentStay = item.stay
        self.noticeId = UUID()
        
        withAnimation(.easeInOut(duration: 0.25)) {
            self.isShowing = true
        }
        
        // 总时长：飞入1秒 + 停留stay秒 + 飞出1秒
        let totalDuration = 1.0 + item.stay + 1.0
        
        hideWorkItem?.cancel()
        let work = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            
            withAnimation(.easeInOut(duration: 0.25)) {
                self.isShowing = false
            }
            
            // 给 SwiftUI 一点时间完成隐藏和移除
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.model = nil
                self.isPlaying = false
                self.playNextIfNeeded()
            }
        }
        
        hideWorkItem = work
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration, execute: work)
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
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>

    var body: some View {
        if let model = manager.model, manager.isShowing {
            ZStack {
                HStack {
                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: model.giftImage)
                        .frame(width: 58, height: 58)
                    Spacer()
                }
                
                HStack(spacing: 8) {
                    MarqueeContent {
                        buildText(model: model)
                    }
                    .id(manager.noticeId)
                    .offset(y: 20)

                    if model.roomId != currentRoomId {
                        ZJ7h766mz(tMmEWWlfgUag: "nPiyjyCZ2")
                            .frame(width: 48, height: 22)
                            .onTapGesture {
                                jumpToRoom(model.roomId)
                            }
                    }
                }
                .padding(.leading, 60)
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
                if manager.isShowing {
                    animateInOut(stay: manager.currentStay)
                }
            }
            .onChange(of: manager.noticeId) { _ in
                animateInOut(stay: manager.currentStay)
            }
            .onDisappear {
                xOffset = UIScreen.main.bounds.width
            }
        }
    }

    func animateInOut(stay: Double) {
        xOffset = UIScreen.main.bounds.width

        withAnimation(.easeOut(duration: 1)) {
            xOffset = 0
        }

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

