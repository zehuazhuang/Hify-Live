import SwiftUI
import Photos
import Combine
import SwiftfulRouting

//个人详情页面
struct zQIRqHb1rSOJJ0wopZa8qxCs: View {
    //背景图index
    @State private var fQAcgipdIEvxLs5OpaG0: Int = 0
    
    @Environment(\.router) var ftgPSmzMVe
    
    @StateObject private var m1nKfP0PAkzYaDvH15D4fsshmC = IyfdHMdY.bTa3L6BoprG
    
    //点击放大的图片
    @State private var pVzCUaYBcF5CZ1: String? = nil
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
            ScrollView {
                LazyVStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        ZStack(alignment: .bottomTrailing,){
                            RoundedRectangle(cornerRadius: 0)
                                .fill(Color.clear)
                                .frame(height: 282)
                                .overlay {
                                        if m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi.isEmpty {
                                            ZJ7h766mz(tMmEWWlfgUag: "aahgbEc4eZP6p4gEMGcYjWv")
                                        } else {
                                            TabView(selection: $fQAcgipdIEvxLs5OpaG0) {
                                                ForEach(m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi.indices, id: \.self) { x56Wv in
                                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi[x56Wv]) {
                                                        ZJ7h766mz(tMmEWWlfgUag: "aahgbEc4eZP6p4gEMGcYjWv")
                                                    }
                                                    .onTapGesture {
                                                        pVzCUaYBcF5CZ1 = m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi[x56Wv]
                                                    }
                                                }
                                            }
                                            .tabViewStyle(.page(indexDisplayMode: .never))
                                        }
                                }
                                .clipped()
                            ZJ7h766mz(tMmEWWlfgUag: "jlvIw3ryygxHNI")
                                .frame(height: 119)
                        }
                        VStack(spacing: 0) {
                            HStack(spacing: 0) {
                                Button{
                                    ftgPSmzMVe.dismissScreen()
                                } label: {
                                    ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                                        .frame(width: 24,height: 24)
                                }
                                Spacer()
                            }
                            .padding(.top,58)
                            .padding(.leading,16)
                            .padding(.bottom,156)
                            VStack(spacing:8) {
                                HStack(spacing: 10) {
                                    Circle()
                                        .fill(Color.white.opacity(0.2))
                                        .frame(width: 88, height: 88)
                                        .overlay(alignment: .center) {
                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: m1nKfP0PAkzYaDvH15D4fsshmC.iBmPfFGfxu5JV7Aii7.string("epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()))
                                                .frame(width: 80,height: 80)
                                                .clipShape(Circle())
                                        }
                                    Spacer()
                                    VStack(alignment: .trailing, spacing: 28){
                                        GeometryReader { j2ISkikaHFezqwHcZmm in
                                            HStack(spacing: 0){
                                                ScrollView(.horizontal, showsIndicators: false) {
                                                    HStack(spacing: 6){
                                                        Button{
                                                            ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                                WUjfoptOKs8pZfhSAH0duplG {
                                                                    o95HINW4DpHIAT()
                                                                }
                                                            }
                                                        } label: {
                                                            RoundedRectangle(cornerRadius: 10)
                                                                .fill(Color.white.opacity(0.32))
                                                                .frame(width: 42,height: 32)
                                                                .overlay(alignment: .center) {
                                                                    ZJ7h766mz(tMmEWWlfgUag: "yJv1l88NyCjeIR2yve6vkxIHscdO")
                                                                        .frame(width: 16,height: 16)
                                                                }
                                                        }
                                                        ForEach(m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi, id: \.self) { zcPI03pbcA in
                                                            Button {
                                                                if let zvI1jA4wuQeGrx0krc0 = m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi.firstIndex(of: zcPI03pbcA) {
                                                                    fQAcgipdIEvxLs5OpaG0 = zvI1jA4wuQeGrx0krc0
                                                                }
                                                            } label: {
                                                                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: zcPI03pbcA)
                                                                    .frame(width: 42, height: 32)
                                                                    .clipShape(RoundedRectangle(cornerRadius: 4))
                                                                    .overlay(
                                                                        RoundedRectangle(cornerRadius: 4)
                                                                            .stroke(Color.white.opacity(m1nKfP0PAkzYaDvH15D4fsshmC.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi.firstIndex(of: zcPI03pbcA) == fQAcgipdIEvxLs5OpaG0 ? 0.4 : 0), lineWidth: 2)
                                                                    )
                                                            }
                                                        }
                                                        .frame(height:36)
                                                    }.frame(minWidth: j2ISkikaHFezqwHcZmm.size.width, alignment: .trailing)
                                                }
                                            }
                                        }
                                        Button{
                                            ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                WUjfoptOKs8pZfhSAH0duplG {
                                                    lhOJY7byauJZOO6Kfr3SaKy6()
                                                }
                                            }
                                        } label: {
                                            RoundedRectangle(cornerRadius: 325)
                                                .stroke(Color.white.opacity(0.4), lineWidth: 1)
                                                .frame(width: 92,height: 33)
                                                .overlay(alignment: .center) {
                                                    HStack(spacing: 4) {
                                                        ZJ7h766mz(tMmEWWlfgUag: "yzujDXmvOUTLyKz")
                                                            .frame(width: 16,height: 16)
                                                        Text("Ccvm8p3pd2vMGRI7eiMqPA==".bFHEatcgE4zzU9TCfDonsu())
                                                            .g0LIIcoZQsOjyND9(
                                                                weight: .medium
                                                            )
                                                    }
                                                }
                                        }
                                    }
                                }
                                .padding(.horizontal,16)
                                VStack(spacing: 4){
                                    HStack(spacing: 0){
                                        Text(m1nKfP0PAkzYaDvH15D4fsshmC.iBmPfFGfxu5JV7Aii7.string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()))
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .semibold
                                            )
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        Spacer()
                                    }
                                    HStack(spacing: 16){
                                        HStack(spacing: 4){
                                            if let weCGKx4ftmOdrhQnvJeTrHKg = (m1nKfP0PAkzYaDvH15D4fsshmC.iBmPfFGfxu5JV7Aii7["L5n0qfdvZqNQucJVPr5TZg==".bFHEatcgE4zzU9TCfDonsu()] as? Int) {
                                                ZJ7h766mz(tMmEWWlfgUag: weCGKx4ftmOdrhQnvJeTrHKg == 0 ? "vK1PV3wuy5o4JGId" : weCGKx4ftmOdrhQnvJeTrHKg == 1 ? "h8bx8HHiJD1BodEG8Zfzl" : "aSUqulEy")
                                                    .frame(width: 24,height: 24)
                                            } else {
                                                ZJ7h766mz(tMmEWWlfgUag: "vK1PV3wuy5o4JGId")
                                                    .frame(width: 24,height: 24)
                                            }
                                            Text(String(m1nKfP0PAkzYaDvH15D4fsshmC.iBmPfFGfxu5JV7Aii7.int("df7WLEb5hNmaUSKmCrDbbw==".bFHEatcgE4zzU9TCfDonsu(),default: 22)))
                                                .g0LIIcoZQsOjyND9()
                                        }
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.4))
                                            .frame(width: 1, height: 13)
                                        AkKkhrVKXgV7pdSjWNgPrAjgIK()
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.4))
                                            .frame(width: 1, height: 13)
                                        HStack(spacing: 4) {
                                            Text("zJ15CvylxUyAMrGGzo0H4Q==".bFHEatcgE4zzU9TCfDonsu()+String(m1nKfP0PAkzYaDvH15D4fsshmC.iBmPfFGfxu5JV7Aii7.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())))
                                                .g0LIIcoZQsOjyND9()
                                            Button{
                                                let coaRRjVtVOXNbcGZNUa43 = String(
                                                    m1nKfP0PAkzYaDvH15D4fsshmC.iBmPfFGfxu5JV7Aii7.int(
                                                        "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()
                                                    )
                                                )
                                                UIPasteboard.general.string = coaRRjVtVOXNbcGZNUa43
                                                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("REb1QH5U5jRdbMUtHMwvWQ==")
                                            } label: {
                                                ZJ7h766mz(tMmEWWlfgUag: "gnuwJqMH3sA8Hce5wxEX")
                                                    .frame(width: 16,height: 16)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                                .padding(.horizontal,16)
                                VStack(spacing: 16) {
                                    HStack(spacing: 83) {
                                        Button{
                                            ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                WUjfoptOKs8pZfhSAH0duplG {
                                                    kaBpQbGjZ(c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U: 0, )
                                                }
                                            }
                                        } label: {
                                            VStack(spacing: 4) {
                                                Text(String(m1nKfP0PAkzYaDvH15D4fsshmC.n1G8RlzpcQK.count))
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 18,
                                                        weight: .black
                                                    )
                                                Text("j6N2OHmBLAbXPzqOtT0sAA==".bFHEatcgE4zzU9TCfDonsu())
                                                    .g0LIIcoZQsOjyND9(
                                                        color: Color.white.opacity(0.4)
                                                    )
                                            }
                                        }
                                        Button{
                                            ftgPSmzMVe.showScreen(.fullScreenCover){ _ in
                                                WUjfoptOKs8pZfhSAH0duplG {
                                                    kaBpQbGjZ(c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U: 1, )
                                                }
                                            }
                                        } label: {
                                            VStack(spacing: 4) {
                                                Text(String(m1nKfP0PAkzYaDvH15D4fsshmC.iF2ouR0gHFDSr3GJ.count))
                                                    .g0LIIcoZQsOjyND9(
                                                        size: 18,
                                                        weight: .black
                                                    )
                                                Text("OKtvWktdeG2+akdspLRpzw==".bFHEatcgE4zzU9TCfDonsu())
                                                    .g0LIIcoZQsOjyND9(
                                                        color: Color.white.opacity(0.4)
                                                    )
                                            }
                                        }
                                        Spacer()
                                    }
                                    .padding(.horizontal,16)
                                    RoundedRectangle(cornerRadius: 0)
                                        .fill(
                                            Gradient(colors: [Color(red: 34/255, green: 25/255, blue: 96/255),Color(red: 43/255, green: 38/255, blue: 29/255, opacity: 0.62)])
                                        )
                                        .frame(height: 2)
                                    HStack(spacing: 0) {
                                        Text("C6fgnSMnCKhJZmWhV/8+GA==".bFHEatcgE4zzU9TCfDonsu())
                                            .g0LIIcoZQsOjyND9(
                                                size: 16,
                                                weight: .medium
                                            )
                                        Spacer()
                                    }
                                    .padding(.horizontal,16)
                                    ZJ7h766mz(tMmEWWlfgUag: "fHQWK")
                                        .frame(height: 95)
                                        .frame(maxWidth: .infinity)
                                        .overlay(content: {
                                            ZStack(alignment: .bottomTrailing) {
                                                Rectangle()
                                                    .fill(Color.white.opacity(0.15))
                                                    .frame(width: 69, height: 25)
                                                    .clipShape(CustomCorners(radius: 12, corners: [.topLeft, .bottomRight]))
                                                    .overlay {
                                                        HStack(spacing: 0) {
                                                            ZJ7h766mz(tMmEWWlfgUag: "owgxknGzqKWaH0DI3F5")
                                                                .frame(width: 20,height: 20)
                                                            Text("12")
                                                                .g0LIIcoZQsOjyND9(
                                                                    size: 16,
                                                                    color: Color.white.opacity(0.6)
                                                                )
                                                            Spacer()
                                                        }
                                                        .padding(.horizontal,6)
                                                    }
                                                HStack(alignment: .top,spacing: 8) {
                                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: "https://img.js.design/assets/img/692d4e10b5e8b987e5416d49.png#5538bf5f6501f791c85a6172ab6af9f6")
                                                        .frame(width: 148,height: 87)
                                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                                        .overlay(alignment: .topLeading) {
                                                            Rectangle()
                                                                .fill(Color.black.opacity(0.6))
                                                                .frame(width: 74,height: 19)
                                                                .clipShape(CustomCorners(radius: 7, corners: [.topLeft, .bottomRight]))
                                                                .overlay {
                                                                    HStack(spacing: 2) {
                                                                        ZJ7h766mz(tMmEWWlfgUag: "hJnx7spPyFWB8ebrE8P11QImyLKy")
                                                                            .frame(width: 16,height: 16)
                                                                        Text("Make Friends")
                                                                            .g0LIIcoZQsOjyND9(
                                                                                size: 12
                                                                            )
                                                                            .lineLimit(1)
                                                                            .truncationMode(.tail)
                                                                    }
                                                                    .padding(.horizontal,4)
                                                                }
                                                        }
                                                    VStack(alignment: .leading,spacing: 8) {
                                                        HStack(spacing: 0) {
                                                            Text("Let's all sing.")
                                                                .g0LIIcoZQsOjyND9(
                                                                    size: 16,
                                                                    weight: .semibold
                                                                )
                                                                .lineLimit(1)
                                                                .truncationMode(.tail)
                                                            Spacer()
                                                        }
                                                        Text("Introduction to the live...")
                                                            .g0LIIcoZQsOjyND9(
                                                                color: Color.white.opacity(0.6)
                                                            )
                                                            .lineLimit(1)
                                                            .truncationMode(.tail)
                                                    }
                                                    .padding(.top,7)
                                                    .padding(.trailing,20)
                                                }
                                                .padding(.horizontal,4)
                                            }
                                        })
                                        .padding(.horizontal,16)
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        // 全屏显示被点击的图片
        .fullScreenCover(isPresented: Binding(
            get: { pVzCUaYBcF5CZ1 != nil },
            set: { if !$0 { pVzCUaYBcF5CZ1 = nil } }
        )) {
            if let nolocnCeMJw14L = pVzCUaYBcF5CZ1 {
                rfVAcKuWDyI1Ig3cm2bMxplImn70D(eOzSTDS: nolocnCeMJw14L) {
                    pVzCUaYBcF5CZ1 = nil
                }
            }
        }
    }
}

//点击放大图片、支持长按保存
struct rfVAcKuWDyI1Ig3cm2bMxplImn70D: View {
    let eOzSTDS: String
    let vjzAERk78sLuW96: () -> Void
    
    @State private var gmmOONihfuH0vjheHiqm9Prv872HI: CGFloat = 1.0
    @State private var pzxxrsR6esxySYadQAv2LlYlH5 = false
    @State private var kznmaN03f3hYXK8LgB02R3 = false
    @State private var xW19zC4gQsqvkXilNJmg = ""
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: eOzSTDS)
                .scaledToFit()
                .scaleEffect(gmmOONihfuH0vjheHiqm9Prv872HI)
                // 同时支持缩放和长按
                .gesture(
                    MagnificationGesture()
                        .onChanged { phcCmKzVelvGgSHdmwexFw924qY in
                            gmmOONihfuH0vjheHiqm9Prv872HI = phcCmKzVelvGgSHdmwexFw924qY
                        }
                        .simultaneously(
                            with: LongPressGesture(minimumDuration: 0.2)
                                .onEnded { _ in
                                    // 长按达到阈值立即弹框
                                    pzxxrsR6esxySYadQAv2LlYlH5 = true
                                }
                        )
                )
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    vjzAERk78sLuW96()
                }
        )
        .confirmationDialog("JC5qWNHChYw1hjsiBDLojIWxcbXx+TE9hGAq76AK+cqY4g2Yq9rE+vz3FUIjZMBLWfX7SxBFxgdvM7X7M5nbSw==".bFHEatcgE4zzU9TCfDonsu(), isPresented: $pzxxrsR6esxySYadQAv2LlYlH5, titleVisibility: .visible) {
            Button("hZ5+j3VKZ8mtaGSA5ogSvw==".bFHEatcgE4zzU9TCfDonsu()) {
                af2DH(i49bp3YNTEyesczfgOJii3zbqjeXApt: eOzSTDS)
            }
            Button("ughEnrHH8idFaI0NbZK2QA==".bFHEatcgE4zzU9TCfDonsu(), role: .cancel) {}
        }
        .alert(xW19zC4gQsqvkXilNJmg, isPresented: $kznmaN03f3hYXK8LgB02R3) {
            Button("UXfiaTZmQdnv9gXzLOufzw==".bFHEatcgE4zzU9TCfDonsu(), role: .cancel) {}
        }
    }
    
    private func af2DH(i49bp3YNTEyesczfgOJii3zbqjeXApt: String) {
        let nFV03vDFM9If = PHPhotoLibrary.authorizationStatus(for: .addOnly)
        switch nFV03vDFM9If {
        case .authorized, .limited:
            i2oZywRv3fhPcBlvM8ml4dz5(ni14a: i49bp3YNTEyesczfgOJii3zbqjeXApt)
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization(for: .addOnly) { nYkd6xuUHzijDAdP in
                if nYkd6xuUHzijDAdP == .authorized || nYkd6xuUHzijDAdP == .limited {
                    i2oZywRv3fhPcBlvM8ml4dz5(ni14a: i49bp3YNTEyesczfgOJii3zbqjeXApt)
                } else {
                    vWus4E3fwNIVpJGZbcB()
                }
            }
        default:
            vWus4E3fwNIVpJGZbcB()
        }
    }
    
    private func i2oZywRv3fhPcBlvM8ml4dz5(ni14a: String) {
        guard let c2oREmYI7DkXdnqfurb1U4 = URL(string: ni14a) else { return }
        URLSession.shared.dataTask(with: c2oREmYI7DkXdnqfurb1U4) { oFTNH0CP7k, _, _ in
            if let oFTNH0CP7k, let uHBvCQzy982wg9hSHzpBjY8lunavC = UIImage(data: oFTNH0CP7k) {
                DispatchQueue.main.async {
                    UIImageWriteToSavedPhotosAlbum(uHBvCQzy982wg9hSHzpBjY8lunavC, nil, nil, nil)
                    xW19zC4gQsqvkXilNJmg = "EBn6aBwfE17pqlwkPFNQZaLxZLCQGt/XOqRSs3uEZPs=".bFHEatcgE4zzU9TCfDonsu()
                    kznmaN03f3hYXK8LgB02R3 = true
                }
            } else {
                DispatchQueue.main.async {
                    xW19zC4gQsqvkXilNJmg = "v6rFdwNBJ9KWYSiBoV1IDg==".bFHEatcgE4zzU9TCfDonsu()
                    kznmaN03f3hYXK8LgB02R3 = true
                }
            }
        }.resume()
    }
    
    private func vWus4E3fwNIVpJGZbcB() {
        DispatchQueue.main.async {
            xW19zC4gQsqvkXilNJmg = "C5uVA0twhOLqb5a0pzEegd38MZJvkWFLCAacQhAD3xt2/Vk4FvCNYgVcDE4n3e45YPI2u/TUVhewOrHJlyE/mw==".bFHEatcgE4zzU9TCfDonsu()
            kznmaN03f3hYXK8LgB02R3 = true
        }
    }
}

//左上角&&右下角圆角
struct CustomCorners: Shape {
    var radius: CGFloat = 10
    var corners: UIRectCorner = []
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

#Preview {
    zQIRqHb1rSOJJ0wopZa8qxCs()
}

//yxAccid
struct gStC2A9Z6Y8Qx0E7W4ML: Codable {
    
    
    let sGOM5LYyLVsTQ1mHEFJD1CJtq: String //yxAccid
    
    func encode(to encoder: Encoder) throws {
        var iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1 = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        
        
        try iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1.encode(
            sGOM5LYyLVsTQ1mHEFJD1CJtq,
            forKey: bonDyqD2YnaVJW(
                "HKd/L3NovhrAFZdHjyoJDg==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
    }
}

//userId
struct g8C6xW7A2userId: Codable {
    
    
    let uC8Z4Y7WxELId: Int //yxAccid
    
    func encode(to encoder: Encoder) throws {
        var iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1 = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        
        
        try iwwnkLDNwkRL7SOZJNcNJf1VdVoUL1.encode(
            uC8Z4Y7WxELId,
            forKey: bonDyqD2YnaVJW(
                "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
    }
}

//获取用户信息（userId、yxAccid）

@MainActor
class T0viKk: ObservableObject {
    static let wSremNeLspPkPRHBJnlVCs5w = T0viKk()
    
    // 获取用户信息（yxAccid）
    func ngI7Y2A8C4E0ZQ9W6xL( wTEEJpZz0iGVK: String) async -> [String:Any]? {
        do {
            let bSn9YS: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6pl/MNKQk2tbd1jWycWL1eQ=".bFHEatcgE4zzU9TCfDonsu(),
                tD5tEJZTT0NlaIX7eMREG92BhO3n: gStC2A9Z6Y8Qx0E7W4ML( sGOM5LYyLVsTQ1mHEFJD1CJtq: wTEEJpZz0iGVK)
            )
            print(bSn9YS.code)
            if bSn9YS.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                // 成功
                guard
                    let wvhfld = bSn9YS.result,
                    !wvhfld.isEmpty
                else {
                    return nil
                }
                let atXeZc0tWzWWpIN8DRa5DB = wvhfld.hL9dV3bQ2fK6sJ8p()
                print(atXeZc0tWzWWpIN8DRa5DB)
                if let nQ4WzLmrneR1qX8c9nRwkH = atXeZc0tWzWWpIN8DRa5DB.kPOR9FHwcEZJv9YDf4W01D() {
                    return nQ4WzLmrneR1qX8c9nRwkH
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } catch {
            print("Sph7QjtQ9wyBx41H5XhztLHkavBN9bomvy8v5zW0vxk=".bFHEatcgE4zzU9TCfDonsu(), error)
            return nil
        }
    }
    
    // 获取用户信息（userId）
    func ngI7E4C9A0xWML6xL( wTEEJpZz0iGVK: Int) async -> [String:Any]? {
        do {
            let bSn9YS: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "gwkJDSPvuIdbiSZMMSMa6pl/MNKQk2tbd1jWycWL1eQ=".bFHEatcgE4zzU9TCfDonsu(),
                tD5tEJZTT0NlaIX7eMREG92BhO3n: g8C6xW7A2userId( uC8Z4Y7WxELId: wTEEJpZz0iGVK)
            )
            print(bSn9YS.code)
            if bSn9YS.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                // 成功
                guard
                    let wvhfld = bSn9YS.result,
                    !wvhfld.isEmpty
                else {
                    return nil
                }
                let atXeZc0tWzWWpIN8DRa5DB = wvhfld.hL9dV3bQ2fK6sJ8p()
                print(atXeZc0tWzWWpIN8DRa5DB)
                if let nQ4WzLmrneR1qX8c9nRwkH = atXeZc0tWzWWpIN8DRa5DB.kPOR9FHwcEZJv9YDf4W01D() {
                    return nQ4WzLmrneR1qX8c9nRwkH
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } catch {
            print("Sph7QjtQ9wyBx41H5XhztLHkavBN9bomvy8v5zW0vxk=".bFHEatcgE4zzU9TCfDonsu(), error)
            return nil
        }
    }
}

