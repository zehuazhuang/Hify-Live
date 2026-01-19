import SwiftUI
import SwiftfulRouting

//国家选择页面
struct zpPt6HEcUfuVXHI2CXtIaD1P: View {
    @ObservedObject var hAgiZOpZ = UfmQhHA1doHKs.bHNA2Amheuq0
    @ObservedObject var lr7J7X4retLhiZiJuwDo7 = Y4x7FkE3Q18iArhSXlC4Q5Z9.rGZrJ0Qgm4
    
    @State private var pbPeJ: String = ""
    @FocusState private var dJ6wwhY5aezAaUY7ATD2: Bool
    
    @Environment(\.router) var vlmreWUQbQrsDKFfZtM3Niti
    
    var uJmhiqFsRDGzvObN4Bi4: [[String: Any]] {
        guard let h4YQfCFpFLXxKPTWuGWvRUeHFog = hAgiZOpZ.o6Ex5Lgp7q46dDOd3db else { return [] }
        
        let g4QlgUdQ5k = pbPeJ
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .lowercased()
        
        // 没输入搜索词 → 全部返回
        if g4QlgUdQ5k.isEmpty {
            return h4YQfCFpFLXxKPTWuGWvRUeHFog
        }
        
        return h4YQfCFpFLXxKPTWuGWvRUeHFog.filter { iesn0od46 in
            let oNQi0QZO4gWUQvtrgMieNumbaAf = (iesn0od46["eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu()] as? String)?.lowercased() ?? ""
            return oNQi0QZO4gWUQvtrgMieNumbaAf.contains(g4QlgUdQ5k)
        }
    }
    
    var body: some View {
        ZStack(){
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    Button{
                        vlmreWUQbQrsDKFfZtM3Niti.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    Text("IIcD4XUcyOX7TLBvuArCSA==".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                }
                .padding(.top,58)
                .padding(.leading,16)
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        Color(red: 34/255, green: 34/255, blue: 38/255)
                    )
                    .overlay {
                        HStack(spacing: 0) {
                            ZStack(alignment: .leading) {
                                if pbPeJ.isEmpty {
                                    Text("5RcmlzkDxZCW74E2DPoqwQ==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            color: Color.white.opacity(0.4)
                                        )
                                        .padding(.horizontal,16)
                                }
                                TextField("", text: $pbPeJ)
                                    .font(.custom("gz4QHFqRS4dH1OeOv3Zirg==".bFHEatcgE4zzU9TCfDonsu(), size: CGFloat(16)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal,16)
                                    .tint(Color.white)
                                    .focused($dJ6wwhY5aezAaUY7ATD2)
                            }
                            HStack(spacing: 14) {
                                if !pbPeJ.isEmpty {
                                    Button{
                                        pbPeJ = ""
                                    }label:{
                                        ZJ7h766mz(tMmEWWlfgUag: "zFOucRMExHz70IQ9HN054")
                                            .frame(width: 20,height: 20)
                                    }
                                }
                                ZJ7h766mz(tMmEWWlfgUag: "dISVC2NZGVkMSRHxkVy2")
                                    .frame(width: 36,height: 36)
                            }
                            .padding(.trailing,4)
                        }
                    }
                    .frame(height: 46)
                    .padding(.top,23)
                    .padding(.bottom,3)
                    .padding(.horizontal,16)
                ScrollView {
                    VStack(spacing: 0) {
                        
                        ForEach(uJmhiqFsRDGzvObN4Bi4.indices, id: \.self) { qZBXpP5XfUZ05ynY3kNq in
                            let cuiITaXSxQgvX2NWtFmfnBxf = uJmhiqFsRDGzvObN4Bi4[qZBXpP5XfUZ05ynY3kNq]
                            
                            Button{
                                lr7J7X4retLhiZiJuwDo7.kQ6M6hDLcPaNgkYCfus4bl1ZLX0k4 = cuiITaXSxQgvX2NWtFmfnBxf
                                vlmreWUQbQrsDKFfZtM3Niti.dismissScreen()
                            } label: {
                                VStack(spacing: 0) {
                                    HStack(spacing: 8) {
                                        Text(cuiITaXSxQgvX2NWtFmfnBxf["sJ+fChO1rg/NVE75PZP9PA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "")
                                            .g0LIIcoZQsOjyND9(size: 26)
                                        
                                        if pbPeJ.count > 0 {
                                            i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l(cuiITaXSxQgvX2NWtFmfnBxf["eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "", eu35TPnxbaJLOeFBDIjy5: pbPeJ)
                                        } else {
                                            Text(cuiITaXSxQgvX2NWtFmfnBxf["eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "")
                                                .g0LIIcoZQsOjyND9(size: 16)
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.top, 20)
                                    .padding(.bottom, 12)
                                    
                                    RoundedRectangle(cornerRadius: 0)
                                        .fill(Color.white.opacity(0.15))
                                        .frame(height: 1)
                                }
                                .contentShape(Rectangle())
                            }
                        }
                        
                        if uJmhiqFsRDGzvObN4Bi4.isEmpty {
                            ZJ7h766mz(tMmEWWlfgUag: "npIyAxb6vfM073130T9MwCJY8")
                                .frame(width: 343,height: 248)
                                .padding(.top,32)
                        }
                    }
                }
                .padding(.top,3)
                .padding(.bottom,34)
                .padding(.horizontal,16)
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            dJ6wwhY5aezAaUY7ATD2 = false
        }
    }
}

#Preview {
    zpPt6HEcUfuVXHI2CXtIaD1P()
}

//输入框文案匹配高亮封装
func i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l(
    _ vUeVIOkVaRSFzObuz66J6So9yvO: String,
    eu35TPnxbaJLOeFBDIjy5: String
) -> Text {
    guard !eu35TPnxbaJLOeFBDIjy5.isEmpty else {
        return Text(vUeVIOkVaRSFzObuz66J6So9yvO)
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(16), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: .regular))
            .foregroundColor(Color.white.opacity(0.39))
    }
    
    let vx3s2E = vUeVIOkVaRSFzObuz66J6So9yvO.lowercased()
    let oVMhziB6OmY0gDaersopLLX = eu35TPnxbaJLOeFBDIjy5.lowercased()
    
    var i4QHWViornHFbNtopokxnPmTCc = Text("")
    var yLoKBY6KcYz8UZ1ccAnrLd5 = vUeVIOkVaRSFzObuz66J6So9yvO.startIndex
    
    while let xc7TQXs8LbSaIYO4P4zIZf = vx3s2E.range(
        of: oVMhziB6OmY0gDaersopLLX,
        range: yLoKBY6KcYz8UZ1ccAnrLd5..<vUeVIOkVaRSFzObuz66J6So9yvO.endIndex
    ) {
        // 普通文本
        i4QHWViornHFbNtopokxnPmTCc = i4QHWViornHFbNtopokxnPmTCc + Text(vUeVIOkVaRSFzObuz66J6So9yvO[yLoKBY6KcYz8UZ1ccAnrLd5..<xc7TQXs8LbSaIYO4P4zIZf.lowerBound])
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(16), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: .regular))
            .foregroundColor(Color.white.opacity(0.39))
        
        // 高亮文本
        i4QHWViornHFbNtopokxnPmTCc = i4QHWViornHFbNtopokxnPmTCc + Text(vUeVIOkVaRSFzObuz66J6So9yvO[xc7TQXs8LbSaIYO4P4zIZf])
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(16), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: .regular))
            .foregroundColor(Color.white)
        
        
        yLoKBY6KcYz8UZ1ccAnrLd5 = xc7TQXs8LbSaIYO4P4zIZf.upperBound
    }
    
    // 剩余文本
    i4QHWViornHFbNtopokxnPmTCc = i4QHWViornHFbNtopokxnPmTCc + Text(vUeVIOkVaRSFzObuz66J6So9yvO[yLoKBY6KcYz8UZ1ccAnrLd5..<vUeVIOkVaRSFzObuz66J6So9yvO.endIndex])
        .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(16), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: .regular))
        .foregroundColor(Color.white.opacity(0.39))
    
    return i4QHWViornHFbNtopokxnPmTCc
}
