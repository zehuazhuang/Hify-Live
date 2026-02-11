import SwiftUI
import UIPilot


//国家选择页面
struct zpPt6HEcUfuVXHI2CXtIaD1P: View {
    @ObservedObject var hAgiZOpZ = UfmQhHA1doHKs.bHNA2Amheuq0
    @ObservedObject var lr7J7X4retLhiZiJuwDo7 = Y4x7FkE3Q18iArhSXlC4Q5Z9.rGZrJ0Qgm4
    
    @State private var pbPeJ: String = ""
    @State private var filteredCountries: [[String: Any]] = []
    
    @FocusState private var dJ6wwhY5aezAaUY7ATD2: Bool
    @EnvironmentObject var pilot: UIPilot<APPTJuHVkDYORXa>

    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 顶部导航
                HStack(spacing: 12) {
                    Button {
                        pilot.pop()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24, height: 24)
                    }
                    Text("IIcD4XUcyOX7TLBvuArCSA==".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(size: 18, weight: .semibold)
                    Spacer()
                }
                
                .padding(.leading, 16)
                
                // 搜索框
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(red: 34/255, green: 34/255, blue: 38/255))
                    .overlay {
                        HStack(spacing: 0) {
                            ZStack(alignment: .leading) {
                                if pbPeJ.isEmpty {
                                    Text("5RcmlzkDxZCW74E2DPoqwQ==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(size: 16, color: Color.white.opacity(0.4))
                                        .padding(.horizontal, 16)
                                }
                                TextField("", text: $pbPeJ)
                                    .font(.custom("gz4QHFqRS4dH1OeOv3Zirg==".bFHEatcgE4zzU9TCfDonsu(), size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 16)
                                    .tint(Color.white)
                                    .focused($dJ6wwhY5aezAaUY7ATD2)
                                    .onChange(of: pbPeJ) { newValue in
                                        filterCountries()
                                    }
                            }
                            HStack(spacing: 14) {
                                if !pbPeJ.isEmpty {
                                    Button {
                                        pbPeJ = ""
                                        filterCountries()
                                    } label: {
                                        ZJ7h766mz(tMmEWWlfgUag: "zFOucRMExHz70IQ9HN054")
                                            .frame(width: 20, height: 20)
                                    }
                                }
                                ZJ7h766mz(tMmEWWlfgUag: "dISVC2NZGVkMSRHxkVy2")
                                    .frame(width: 36, height: 36)
                            }
                            .padding(.trailing, 4)
                        }
                    }
                    .frame(height: 46)
                    .padding(.top, 23)
                    .padding(.bottom, 3)
                    .padding(.horizontal, 16)
                
                // 国家列表
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        if filteredCountries.isEmpty {
                            ZJ7h766mz(tMmEWWlfgUag: "npIyAxb6vfM073130T9MwCJY8")
                                .frame(width: 343, height: 248)
                                .padding(.top, 32)
                        } else {
                            ForEach(filteredCountries.indices, id: \.self) { index in
                                let country = filteredCountries[index]
                                CountryRow(item: country, searchText: pbPeJ)
                                    .onTapGesture {
                                        lr7J7X4retLhiZiJuwDo7.kQ6M6hDLcPaNgkYCfus4bl1ZLX0k4 = country
                                        pilot.pop()
                                    }
                            }
                        }
                    }
                    .padding(.top, 3)
                    .padding(.bottom, 34)
                    .padding(.horizontal, 16)
                }
                .gesture(
                    DragGesture().onChanged { _ in
                        dJ6wwhY5aezAaUY7ATD2 = false
                    }
                )
            }
        }
        .onAppear {
            filterCountries()
        }
        .onTapGesture {
            dJ6wwhY5aezAaUY7ATD2 = false
        }
    }
    
    // MARK: - 过滤国家
    private func filterCountries() {
        guard let allCountries = hAgiZOpZ.o6Ex5Lgp7q46dDOd3db else {
            filteredCountries = []
            return
        }
        let keyword = pbPeJ.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        if keyword.isEmpty {
            filteredCountries = allCountries
        } else {
            filteredCountries = allCountries.filter {
                let name = ($0["eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "").lowercased()
                return name.contains(keyword)
            }
        }
    }
}

// MARK: - 单个国家行
struct CountryRow: View {
    let item: [String: Any]
    let searchText: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                Text(item["sJ+fChO1rg/NVE75PZP9PA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "")
                    .g0LIIcoZQsOjyND9(size: 26)
                
                if !searchText.isEmpty {
                    i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l(
                        item["eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "",
                        eu35TPnxbaJLOeFBDIjy5: searchText
                    )
                } else {
                    Text(item["eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu()] as? String ?? "")
                        .g0LIIcoZQsOjyND9(size: 16)
                }
                
                Spacer()
            }
            .padding(.vertical, 16)
            
            RoundedRectangle(cornerRadius: 0)
                .fill(Color.white.opacity(0.15))
                .frame(height: 1)
        }
        .contentShape(Rectangle())
    }
}



//输入框文案匹配高亮封装
func i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l(
    _ vUeVIOkVaRSFzObuz66J6So9yvO: String,
    eu35TPnxbaJLOeFBDIjy5: String,
    hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj: Color = Color.white.opacity(0.39), //普通颜色
    jNlN8bWwqoxxy8YmVpUqcusW6NqAV: Color = Color.white, //高亮颜色
    mY0c7aJw0GJoOZ1dbL8eaEi: Int = 16, //字号
    zV5GeEg: Font.Weight = .regular, //字重
) -> Text {
    guard !eu35TPnxbaJLOeFBDIjy5.isEmpty else {
        return Text(vUeVIOkVaRSFzObuz66J6So9yvO)
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(mY0c7aJw0GJoOZ1dbL8eaEi), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: zV5GeEg))
            .foregroundColor(hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj)
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
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(mY0c7aJw0GJoOZ1dbL8eaEi), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: zV5GeEg))
            .foregroundColor(hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj)
        
        // 高亮文本
        i4QHWViornHFbNtopokxnPmTCc = i4QHWViornHFbNtopokxnPmTCc + Text(vUeVIOkVaRSFzObuz66J6So9yvO[xc7TQXs8LbSaIYO4P4zIZf])
            .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(mY0c7aJw0GJoOZ1dbL8eaEi), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: zV5GeEg))
            .foregroundColor(jNlN8bWwqoxxy8YmVpUqcusW6NqAV)
        
        
        yLoKBY6KcYz8UZ1ccAnrLd5 = xc7TQXs8LbSaIYO4P4zIZf.upperBound
    }
    
    // 剩余文本
    i4QHWViornHFbNtopokxnPmTCc = i4QHWViornHFbNtopokxnPmTCc + Text(vUeVIOkVaRSFzObuz66J6So9yvO[yLoKBY6KcYz8UZ1ccAnrLd5..<vUeVIOkVaRSFzObuz66J6So9yvO.endIndex])
        .font(JqA1kMoFobuvplkZO5w4FWsenOf.yVvo9b0xKtZE0(gpMpmhPhxS73zlFX24e2W5x8ZNX6q: CGFloat(mY0c7aJw0GJoOZ1dbL8eaEi), iAYoV6kRMI2dAT8yrwHd0S47GmuZB6: zV5GeEg))
        .foregroundColor(hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj)
    
    return i4QHWViornHFbNtopokxnPmTCc
}
