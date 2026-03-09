import SwiftUI
import Combine

class XQAQvuU6cZLbgE: ObservableObject {
    static let shared = XQAQvuU6cZLbgE()
    
    @Published var uKbjaEGR: String? = nil
    @Published var sVt7blcSwH: Bool = false
    
    private var nextMessage: String? = nil
    private var currentWorkItem: DispatchWorkItem? = nil
    
    private init() {}
    
    // 显示通知（新消息有动画切换）
    func vEnu5pS9V(xcZmXTC0: String, duration: Double = 3.0) {
        // 如果当前有通知在显示，把新消息暂存
        if sVt7blcSwH {
            nextMessage = xcZmXTC0
            // 动画先让当前通知消失
            currentWorkItem?.cancel()
            withAnimation {
                sVt7blcSwH = false
            }
            // 动画完成后显示新通知
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
                guard let self = self else { return }
                if let message = self.nextMessage {
                    self.nextMessage = nil
                    self.showMessage(message, duration: duration)
                }
            }
        } else {
            // 当前没有通知，直接显示
            showMessage(xcZmXTC0, duration: duration)
        }
    }
    
    private func showMessage(_ message: String, duration: Double) {
        uKbjaEGR = message
        withAnimation {
            sVt7blcSwH = true
        }
        
        let workItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            withAnimation {
                self.sVt7blcSwH = false
            }
        }
        currentWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: workItem)
    }
}

struct XQAQvuU6cZLbgEView: View {
    @ObservedObject var manager = XQAQvuU6cZLbgE.shared
    @State private var offsetY: CGFloat = 0 // 手势偏移量
    
    var body: some View {
        if manager.sVt7blcSwH, let message = manager.uKbjaEGR {
            HStack{
                Text(message)
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .semibold
                                )
            }.frame(height: 76)
                .frame(maxWidth: .infinity)
                .background(
                    Color(red: 13/255, green: 27/255, blue: 41/255)
                        .cornerRadius(12)
                )
                .overlay(
                    
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 17/255, green: 226/255, blue: 255/255),
                                    Color(red: 217/255, green: 28/255, blue: 255/255),
                                    Color(red: 217/255, green: 28/255, blue: 255/255),
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ),
                            lineWidth: 1
                        )
                )
                .padding(.horizontal,16)
                .padding(.top, 10)
                .offset(y: offsetY) // 根据手势偏移
                            .gesture(
                                DragGesture(minimumDistance: 10)
                                    .onChanged { value in
                                        // 只允许向上拖动
                                        if value.translation.height < 0 {
                                            offsetY = value.translation.height
                                        }
                                    }
                                    .onEnded { value in
                                        if value.translation.height < -50 { // 超过阈值关闭
                                            withAnimation {
                                                manager.sVt7blcSwH = false
                                            }
                                        }
                                        offsetY = 0 // 重置偏移
                                    }
                            )
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .transition(.move(edge: .top).combined(with: .opacity))
                .animation(.spring(), value: manager.sVt7blcSwH)
        }
    }
}
