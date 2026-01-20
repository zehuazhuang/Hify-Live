import SwiftUI
import SwiftfulRouting
import Combine

//黑名单
struct bfoXTzIM4dlkv07MZv45zoMZVs23: View {
    
    @StateObject private var nd55l6NRwWuVUnbReUhjS3d1Ivg = TPb21z0U.eDNcFBMyyi
    
    @Environment(\.router) var ivHIH8tMIw2gJg4o
    
    @State private var uT6eHPE0Of05afFQdv9n: Bool = false
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 24) {
                HStack(spacing: 12) {
                    Button{
                        ivHIH8tMIw2gJg4o.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    Text("1DvzZzsH5HkmS0//ed72fg==".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                }
                .padding(.top,58)
                .padding(.leading,16)
                if nd55l6NRwWuVUnbReUhjS3d1Ivg.isLoading {
                    BMTU5LVVTQYLXCZaN()
                } else if nd55l6NRwWuVUnbReUhjS3d1Ivg.users.isEmpty{
                    VStack(spacing: 0,){
                        ZJ7h766mz(tMmEWWlfgUag: "npIyAxb6vfM073130T9MwCJY8")
                            .frame(width: 343,height: 248)
                            .padding(.top,90)
                        Spacer()
                    }
                } else {
                    ScrollView {
                        VStackLayout(spacing: 12) {
                            ForEach(nd55l6NRwWuVUnbReUhjS3d1Ivg.users.indices, id: \.self) { opa5o0dODUVnIW2kkdf in
                                let mnnVXxRXFee1ZJ8ehOc9UwA = nd55l6NRwWuVUnbReUhjS3d1Ivg.users[opa5o0dODUVnIW2kkdf]
                                HStack(spacing: 0) {
                                    HStack(spacing: 10) {
                                        Circle()
                                            .fill(Color.white.opacity(0.19))
                                            .frame(width: 48)
                                            .overlay(alignment: .center) {
                                                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: mnnVXxRXFee1ZJ8ehOc9UwA.string("epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()))
                                                    .frame(width: 44,height: 44)
                                                    .clipShape(Circle())
                                            }
                                        VStack(alignment: .leading, spacing: 7) {
                                            Text(mnnVXxRXFee1ZJ8ehOc9UwA.string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()))
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16,
                                                    weight: .semibold
                                                )
                                                .lineLimit(1)
                                                .truncationMode(.tail)
                                            Text("zJ15CvylxUyAMrGGzo0H4Q==".bFHEatcgE4zzU9TCfDonsu() + mnnVXxRXFee1ZJ8ehOc9UwA.string("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()))
                                                .g0LIIcoZQsOjyND9(
                                                    color: Color.white.opacity(0.6)
                                                )
                                        }
                                    }
                                    Spacer()
                                    Button{
                                        Task {
                                            uT6eHPE0Of05afFQdv9n = true
                                            let ehiJO3: Int = Int(mnnVXxRXFee1ZJ8ehOc9UwA.string("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())) ?? 0
                                            let vutSbVgrqVlU9: String = mnnVXxRXFee1ZJ8ehOc9UwA.string("HKd/L3NovhrAFZdHjyoJDg==".bFHEatcgE4zzU9TCfDonsu())
                                            let wiCvWb: Bool =  await nd55l6NRwWuVUnbReUhjS3d1Ivg.hxEXXV2aWMNka7HM2qhr1Qccen3rB(iN2NID: ehiJO3, lCOFD: vutSbVgrqVlU9)
                                            if !wiCvWb, let pPBGkix66avlJS7b9 = nd55l6NRwWuVUnbReUhjS3d1Ivg.errorMessage {
                                                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz(pPBGkix66avlJS7b9, z2E1geUN5miQ95SpoCG: false)
                                            } else {
                                                //
                                            }
                                            uT6eHPE0Of05afFQdv9n = false
                                        }
                                    } label: {
                                        RoundedRectangle(cornerRadius: 325)
                                            .fill(
                                                LinearGradient(colors: [Color(red: 211/255, green: 75/255, blue: 117/255),Color(red: 237/255, green: 168/255, blue: 102/255)], startPoint: .leading, endPoint: .trailing)
                                            )
                                            .frame(width: 92,height: 33)
                                            .overlay(alignment: .center) {
                                                if uT6eHPE0Of05afFQdv9n {
                                                    sEzi1icPpNqqO()
                                                } else {
                                                    Text("kYFAuWrCeDmlqT7m07Eslw==".bFHEatcgE4zzU9TCfDonsu())
                                                        .g0LIIcoZQsOjyND9(
                                                            weight: .medium,
                                                            color: Color.white
                                                        )
                                                }
                                            }
                                    }
                                }
                                .padding(.horizontal,8)
                                .padding(.vertical,14)
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(
                                            LinearGradient(colors: [Color(red: 120/255, green: 223/255, blue: 1, opacity: 0.1),Color(red: 84/255, green: 105/255, blue: 199/255, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)
                                        )
                                )
                                .padding(.horizontal,16)
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .task {
            await nd55l6NRwWuVUnbReUhjS3d1Ivg.loadBlacklist()
        }
    }
}

//按钮loading
struct sEzi1icPpNqqO: View {
    
    @State private var yvBsL4r4wydkRPEBSAxc = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.4), style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .frame(width: 20, height: 20)
            Circle()
                .trim(from: 0.0, to: 0.25)
                .stroke(Color.white,style: StrokeStyle(lineWidth: 2, lineCap: .round))
                .frame(width: 20, height: 20)
                .rotationEffect(.degrees(yvBsL4r4wydkRPEBSAxc ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: yvBsL4r4wydkRPEBSAxc)
                .onAppear {
                    yvBsL4r4wydkRPEBSAxc = true
                }
        }
    }
}


#Preview {
    bfoXTzIM4dlkv07MZv45zoMZVs23()
}

@MainActor
class TPb21z0U: ObservableObject {
    
    static let eDNcFBMyyi = TPb21z0U()
    
    @Published var users: [[String: Any]] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    private var hasLoadedOnce = true
    
    // MARK: - 异步加载黑名单
    func loadBlacklist() async {
        if !hasLoadedOnce { return }
        isLoading = true
        defer { isLoading = false }
        do {
            // 调用封装的 async/await 请求
            let response: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "JsjRNSam5UvtKQJEQpC4RvzWSwNp4rlcpzY4woCOr7Q=".bFHEatcgE4zzU9TCfDonsu(),
                tD5tEJZTT0NlaIX7eMREG92BhO3n: [String: String](),
            )
            
            if response.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                guard let encrypted = response.result else {
                    self.users = []
                    return
                }
                
                // 解密，得到 JSON 字符串
                let decryptedString = encrypted.hL9dV3bQ2fK6sJ8p() // String
                
                // 转成 [[String: Any]]
                if let data = decryptedString.data(using: .utf8),
                   let array = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] {
                    self.users = array
                    self.hasLoadedOnce = false
                } else {
                    self.users = []
                }
            } else {
                errorMessage = response.message
            }
        } catch {
            errorMessage = "获取黑名单失败"
            print("请求失败:", error)
        }
    }
    
    // MARK: - 取消拉黑（userId、yxAccid）
    func hxEXXV2aWMNka7HM2qhr1Qccen3rB(iN2NID: Int, lCOFD: String) async -> Bool {
        do {
            let otSFfF0QgnGZCEXuL0RMm0RAtV2RZUV: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "Z53mkVKRc+/3aEy88R1ziVjUXb5ZXXyoGLM0HtCaN3g=".bFHEatcgE4zzU9TCfDonsu(),
                tD5tEJZTT0NlaIX7eMREG92BhO3n: wZA6oIowbVae5FtrdTTFAaiz3WYirkvI(sjNradeQwuW02y7kiF6ozTd: 1, qRdFOAhW7ayZvfxQCha: iN2NID, eTf1z86aGoFMNQJUV7Tx: lCOFD)
            )
            print(otSFfF0QgnGZCEXuL0RMm0RAtV2RZUV.code)
            if otSFfF0QgnGZCEXuL0RMm0RAtV2RZUV.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                self.users.removeAll { ($0.string("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())) == String(iN2NID) }
                self.hasLoadedOnce = true
                return true
            } else {
                errorMessage = otSFfF0QgnGZCEXuL0RMm0RAtV2RZUV.message
                return false
            }
        } catch {
            errorMessage = "取消拉黑失败"
            print("取消拉黑失败:", error)
            return false
        }
    }
    
    // MARK: - 拉黑（userId、yxAccid）
    func ngIp5pudxny8o0Mdsqv(fnLUzabLaul9Cx: Int, mwNKAPngt: String) async -> Bool {
        do {
            
            let qBiYBwzAdHAVgLTRNxn0QPPieDHjrKj: JUsmLn3i59tKLD7RL294I0nAG = try await WOKmjUjM.dq0JZ94RcmDb3.j36UQlXa0(
                xH0OPzEYR4M5ewWkZQAveq6Vy7: "CfhquXmyZHp3DW0wpE2+Fr38IYBhI3i+2pTnmmC0zfk=".bFHEatcgE4zzU9TCfDonsu(),
                tD5tEJZTT0NlaIX7eMREG92BhO3n: wZA6oIowbVae5FtrdTTFAaiz3WYirkvI(sjNradeQwuW02y7kiF6ozTd: 1, qRdFOAhW7ayZvfxQCha: fnLUzabLaul9Cx, eTf1z86aGoFMNQJUV7Tx: mwNKAPngt)
            )
            print(qBiYBwzAdHAVgLTRNxn0QPPieDHjrKj.code)
            if qBiYBwzAdHAVgLTRNxn0QPPieDHjrKj.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                // 成功加入黑名单
                self.hasLoadedOnce = true
                return true
            } else {
                errorMessage = qBiYBwzAdHAVgLTRNxn0QPPieDHjrKj.message
                return false
            }
        } catch {
            errorMessage = "拉黑失败"
            print("Sph7QjtQ9wyBx41H5XhztLHkavBN9bomvy8v5zW0vxk=".bFHEatcgE4zzU9TCfDonsu(), error)
            return false
        }
    }
}

//拉黑参数配置
struct wZA6oIowbVae5FtrdTTFAaiz3WYirkvI: Codable {
    
    let sjNradeQwuW02y7kiF6ozTd: Int //type
    let qRdFOAhW7ayZvfxQCha: Int //userId
    let eTf1z86aGoFMNQJUV7Tx: String //yxAccid
    
    func encode(to encoder: Encoder) throws {
        var e8I3p = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        try e8I3p.encode(
            sjNradeQwuW02y7kiF6ozTd,
            forKey: bonDyqD2YnaVJW(
                "LwIiTP4Kb0lJgLdJnsi2xQ==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
        
        try e8I3p.encode(
            qRdFOAhW7ayZvfxQCha,
            forKey: bonDyqD2YnaVJW(
                "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
        
        try e8I3p.encode(
            eTf1z86aGoFMNQJUV7Tx,
            forKey: bonDyqD2YnaVJW(
                "HKd/L3NovhrAFZdHjyoJDg==".bFHEatcgE4zzU9TCfDonsu()
            )
        )
    }
}
