//
//  RQUp9Wr94Y34oJ.swift
//  HifyLive
//
//  Created by yangyang on 2026/1/31.
//

import SwiftUI

enum DragDirection {
    case horizontal
    case vertical
}

struct SwipeRow<Content: View, ID: Hashable>: View {

    let id: ID
    let content: Content
    let onDelete: () -> Void
    @Binding var openRowId: ID?

    @State private var offsetX: CGFloat = 0
    private let threshold: CGFloat = 60
    
    @GestureState private var dragDirection: DragDirection?

    init(
        id: ID,
        openRowId: Binding<ID?>,
        @ViewBuilder content: () -> Content,
        onDelete: @escaping () -> Void
    ) {
        self.id = id
        self._openRowId = openRowId
        self.content = content()
        self.onDelete = onDelete
    }

    var body: some View {
        ZStack(alignment: .trailing) {

            // 底层删除按钮（始终存在）
            Button(action: onDelete) {
                ZJ7h766mz(tMmEWWlfgUag: "zJNmgI4BkuG6ca")
                    .frame(width: 24, height: 24)
                    .frame(width: 60, height: 76)
                    .background(Color.red)
            }

            // 前景内容
            content
                .background(Color(red: 13/255, green: 13/255, blue: 18/255))
                .offset(x: offsetX)
                .simultaneousGesture(
                    DragGesture(minimumDistance: 8)
                        .updating($dragDirection) { value, state, _ in
                            guard state == nil else { return }

                            let dx = abs(value.translation.width)
                            let dy = abs(value.translation.height)

                            if dx > dy * 1.2 {
                                state = .horizontal
                            } else if dy > dx * 1.2 {
                                state = .vertical
                            }
                        }
                        .onChanged { value in
                            guard dragDirection == .horizontal else { return }

                            let translation = value.translation.width

                            if offsetX == 0 {
                                   // 初次左滑
                                   guard translation < 0 else { return }
                                   offsetX = max(translation, -threshold) // ❌ 不会超过 -threshold
                                   openRowId = id
                               } else {
                                   // 已经展开，再次拖动
                                   let newOffset = -threshold + translation
                                   offsetX = min(0, max(newOffset, -threshold)) // 🔹 保证范围 [-threshold, 0]
                               }
                        }
                        .onEnded { _ in
                            guard dragDirection == .horizontal else { return }

                            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                                if offsetX < -threshold / 2 {
                                    offsetX = -threshold
                                    openRowId = id
                                } else {
                                    offsetX = 0
                                    openRowId = nil
                                }
                            }
                        }
                )
                
                // ⭐️ 监听“别人被打开”
                .onChange(of: openRowId) { newValue in
                    if newValue != id && offsetX != 0 {
                        withAnimation(.spring()) {
                            offsetX = 0
                        }
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .clipped()
        .animation(.interactiveSpring(), value: offsetX)
    }
}
