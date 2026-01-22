import SwiftUI

struct DraggableGridWithFrameDemo: View {

    struct ColorItem: Identifiable, Equatable {
        let id = UUID()
        let color: Color
    }

    @State private var items: [ColorItem] = [
        .init(color: .red),
        .init(color: .green),
        .init(color: .blue),
        .init(color: .orange),
        .init(color: .purple),
        .init(color: .pink),
        .init(color: .yellow),
        .init(color: .teal)
    ]

    @State private var draggingItem: ColorItem? = nil
    @State private var dragOffset: CGSize = .zero
    @State private var dragStartIndex: Int? = nil

    @State private var itemFrames: [UUID: CGRect] = [:]

    private let columns = [GridItem(.flexible(), spacing: 12),
                           GridItem(.flexible(), spacing: 12)]
    private let itemSize = CGSize(width: 100, height: 100)
    private let swapThreshold: CGFloat = 50

    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(items) { item in
                        ColorItemView(item: item)
                            .frame(width: itemSize.width, height: itemSize.height)
                            .opacity(draggingItem?.id == item.id ? 0.3 : 1)
                            .background(
                                GeometryReader { geo in
                                    Color.clear
                                        .preference(
                                            key: ItemFrameKey.self,
                                            value: [item.id: geo.frame(in: .named("grid"))]
                                        )
                                }
                            )
                            .gesture(dragGesture(for: item))
                    }
                }
                .padding(16)
            }
            .coordinateSpace(name: "grid")
            .onPreferenceChange(ItemFrameKey.self) { value in
                itemFrames = value
            }

            // 顶层拖动格子
            if let draggingItem = draggingItem,
               let frame = itemFrames[draggingItem.id] {
                ColorItemView(item: draggingItem)
                    .frame(width: itemSize.width, height: itemSize.height)
                    .cornerRadius(8)
                    .position(
                        x: frame.midX + dragOffset.width,
                        y: frame.midY + dragOffset.height
                    )
                    .zIndex(100)
            }
        }
    }

    private func dragGesture(for item: ColorItem) -> some Gesture {
        LongPressGesture(minimumDuration: 0.2)
            .sequenced(before: DragGesture())
            .onChanged { value in
                switch value {
                case .first(true):
                    draggingItem = item
                    dragStartIndex = items.firstIndex(of: item)
                    dragOffset = .zero
                case .second(true, let drag?):
                    guard draggingItem?.id == item.id else { return }
                    dragOffset = drag.translation
                default: break
                }
            }
            .onEnded { _ in
                endDrag()
            }
    }

    private func endDrag() {
        guard let draggingItem = draggingItem,
              let fromIndex = dragStartIndex else { return }

        guard let frame = itemFrames[draggingItem.id] else { return }
        let dragCenter = CGPoint(
            x: frame.midX + dragOffset.width,
            y: frame.midY + dragOffset.height
        )

        if let toIndex = nearestIndex(to: dragCenter, excluding: draggingItem) {
            let fromCenter = CGPoint(x: frame.midX, y: frame.midY)
            let distance = hypot(dragCenter.x - fromCenter.x, dragCenter.y - fromCenter.y)
            if distance >= swapThreshold && toIndex != fromIndex {
                withAnimation {
                    items.move(fromOffsets: IndexSet(integer: fromIndex),
                               toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
                }
            }
        }

        dragOffset = .zero
        dragStartIndex = nil
        self.draggingItem = nil
    }

    private func nearestIndex(to point: CGPoint, excluding item: ColorItem) -> Int? {
        return items.enumerated()
            .filter { $0.element.id != item.id }
            .map { idx, otherItem -> (Int, CGFloat) in
                guard let frame = itemFrames[otherItem.id] else { return (idx, .infinity) }
                let center = CGPoint(x: frame.midX, y: frame.midY)
                let distance = hypot(point.x - center.x, point.y - center.y)
                return (idx, distance)
            }
            .min(by: { $0.1 < $1.1 })?.0
    }
}

struct ItemFrameKey: PreferenceKey {
    static var defaultValue: [UUID: CGRect] = [:]
    static func reduce(value: inout [UUID : CGRect], nextValue: () -> [UUID : CGRect]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

struct ColorItemView: View {
    let item: DraggableGridWithFrameDemo.ColorItem
    var body: some View {
        Rectangle()
            .fill(item.color)
            .cornerRadius(8)
    }
}

#Preview {
    DraggableGridWithFrameDemo()
}
