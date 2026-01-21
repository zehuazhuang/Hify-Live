//点击扫把
import SwiftUI
struct ZV6K3W8qN5re: View {
    @Binding var sE92F3V9XA: Bool
    @State private var isxM8ZxQb = false
    let qkS5hN2V8 : () -> Void
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .onTapGesture {
                    cW2kJ7C1e()
                }

            ZStack{
                // 你的弹框内容
                
                ZJ7h766mz(tMmEWWlfgUag: "M8Q7ZP1H2Tb")
                                   .frame(width: 178, height: 166)
                                   .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                VStack(spacing:20){
                    
                    xD6bLM9VWBut(tC4mJ1P6X: 0, L7sB2F9ac: {
                        // 1️⃣ 标记所有会话已读
                        RecentSessionStore.shared.markAllSessionsRead()
                        GlobalUnreadStore.shared.clearAllUnread()
                        sE92F3V9XA = false
                    }, st5T2kH9L1Y: "Mark all read")
                    xD6bLM9VWBut(tC4mJ1P6X: 0, L7sB2F9ac: {
                        isxM8ZxQb = false
                       
                        sE92F3V9XA = false
                        qkS5hN2V8()
                    }, st5T2kH9L1Y: "Clear message")
                    xD6bLM9VWBut(tC4mJ1P6X: 1, L7sB2F9ac: {
                        cW2kJ7C1e()
                    }, st5T2kH9L1Y: "Cancel")
                    Spacer()
                }
                .padding(.top,32)
                .padding(.horizontal,36)
            }
            .frame(height: 251)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(
                    colors: [Color(red: 17 / 255, green: 31 / 255, blue: 46 / 255),
                             Color(red: 21 / 255, green: 12 / 255, blue: 38 / 255)],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(s7q2ZC1S9A4tM8L3(radius: 24, corners: [.topLeft,.topRight]))
            
            .offset(y: isxM8ZxQb ? 0 : 300)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .onAppear {
                isxM8ZxQb = false
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.25)) {
                        isxM8ZxQb = true
                    }
                }
            }
        }
    }
    func cW2kJ7C1e(){
        withAnimation(.easeOut(duration: 0.25)) {
            isxM8ZxQb = false
        }
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            sE92F3V9XA = false
        }
    }
}

struct xD6bLM9VWBut: View {
    let tC4mJ1P6X: Int
    let L7sB2F9ac: () -> Void
    let st5T2kH9L1Y: String

    var body: some View {
        Button(action: L7sB2F9ac) {
            Text(st5T2kH9L1Y)
                .g0LIIcoZQsOjyND9(
                    size: 16,
                    weight: .regular
                )
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
        }
        .frame(height: 46)
       
        .background(
            LinearGradient(
                colors: [
                    tC4mJ1P6X == 0
                        ? Color(red: 173 / 255, green: 192 / 255, blue: 255 / 255, opacity: 0.32)
                        : .white.opacity(0.1),
                    tC4mJ1P6X == 0
                        ? Color(red: 255 / 255, green: 255 / 255, blue: 255 / 255, opacity: 0.25)
                        : .white.opacity(0.1)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(325)
    }
}
