
//反馈上传图片弹框
import SwiftUI
struct JD5bDC8yFXT7UL: View {
    @Binding var bDAxsMgfM: Bool //关闭弹框
    @State private var v3UsYWx4y = false //控制动画
    let tfYmBPP : (Int) -> Void //0是相册 1是拍照
    var body: some View {
        ZStack{
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    bDAxsMgfM = false
                }

            ZStack{
                ZJ7h766mz(tMmEWWlfgUag: "M8Q7ZP1H2Tb")
                                   .frame(width: 178, height: 166)
                                   .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .topLeading)
                VStack(spacing:20){
                    
                    xD6bLM9VWBut(tC4mJ1P6X: 0, L7sB2F9ac: {
                        bDAxsMgfM = false
                        tfYmBPP(0)
                        
                    }, st5T2kH9L1Y: "Photo Library")
                    xD6bLM9VWBut(tC4mJ1P6X: 0, L7sB2F9ac: {
                        bDAxsMgfM = false
                        tfYmBPP(1)
                    }, st5T2kH9L1Y: "Take Photo")
                    xD6bLM9VWBut(tC4mJ1P6X: 1, L7sB2F9ac: {
                        bDAxsMgfM = false
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
            
            .offset(y: v3UsYWx4y ? 0 : 300)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .onAppear {
                v3UsYWx4y = false
                DispatchQueue.main.async {
                    withAnimation(.easeOut(duration: 0.25)) {
                        v3UsYWx4y = true
                    }
                }
            }
        }
    }

}


