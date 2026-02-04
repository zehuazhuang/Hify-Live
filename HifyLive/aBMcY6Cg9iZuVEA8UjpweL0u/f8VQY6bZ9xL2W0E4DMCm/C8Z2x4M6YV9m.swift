import SwiftUI
import SwiftfulRouting

//国旗UI
struct CountryFlagView: View {
    var countryCode: String = ""

    
    var flagEmoji: String {
        let base: UInt32 = 127397 // Regional Indicator Symbol Letter A 的 Unicode
        var scalarView = String.UnicodeScalarView()
        for scalar in countryCode.uppercased().unicodeScalars {
            if let uni = UnicodeScalar(base + scalar.value) {
                scalarView.append(uni)
            }
        }
        return String(scalarView)
    }

    var body: some View {
        Text(flagEmoji)
            .font(.system(size: 16))
    }
}

//个人首页
struct C8Z2x4M6YV9m: View {
    
    @Environment(\.router) var f3gXkYHZIUAUWNv5SX2nZKCo
    
    @StateObject private var qVi2QJ0SeDluhZ9xoQ8V7 = IyfdHMdY.bTa3L6BoprG
    //通知
    @StateObject private var xycvz = NOHpxY.j9lChKVFzjtP37aeBd
    @Environment(\.scenePhase) private var cOVPp3
    //退出登录提示
    @State private var deZMvhJctiSoCj78YDk: Bool = false
    
    var body: some View {
        ZStack {
            ZJ7h766mz(tMmEWWlfgUag: "ziFHlaHt9TDT8JNoUekRk7yFke")
            ScrollView(showsIndicators: false) {
                VStack(spacing: 72) {
                    VStack(spacing: 20) {
                        VStack(spacing: 12) {
                            HStack(spacing: 16) {
                                Button{
                                    f3gXkYHZIUAUWNv5SX2nZKCo.showScreen(.fullScreenCover) { _ in
                                        WUjfoptOKs8pZfhSAH0duplG {
                                            zQIRqHb1rSOJJ0wopZa8qxCs(areoloaUid: IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.int("userId"))
                                        }
                                    }
                                } label: {
                                    Circle()
                                        .fill(Color.white.opacity(0.2))
                                        .frame(width: 76)
                                        .overlay(alignment: .center) {
                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.string("icon"))
                                                .frame(width: 68,height: 68)
                                                .clipShape(Circle())
                                                .allowsHitTesting(false)
                                        }
                                }
                                VStack(alignment: .leading,spacing: 4) {
                                    HStack(spacing: 16) {
                                        Text(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()))
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .semibold,
                                            )
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                        CountryFlagView(countryCode: qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.string("countryId"))
                                    }
                                    HStack(spacing: 16) {
                                        HStack(spacing: 4) {
                                            if let x3r45aKu1Bx = (qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7["L5n0qfdvZqNQucJVPr5TZg==".bFHEatcgE4zzU9TCfDonsu()] as? Int) {
                                                ZJ7h766mz(tMmEWWlfgUag: x3r45aKu1Bx == 0 ? "vK1PV3wuy5o4JGId" : x3r45aKu1Bx == 1 ? "h8bx8HHiJD1BodEG8Zfzl" : "aSUqulEy")
                                                    .frame(width: 24,height: 24)
                                            } else {
                                                ZJ7h766mz(tMmEWWlfgUag: "vK1PV3wuy5o4JGId")
                                                    .frame(width: 24,height: 24)
                                            }
                                            Text(String(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("df7WLEb5hNmaUSKmCrDbbw==".bFHEatcgE4zzU9TCfDonsu(),default: 22)))
                                                .g0LIIcoZQsOjyND9()
                                        }
                                        RoundedRectangle(cornerRadius: 0)
                                            .fill(Color.white.opacity(0.4))
                                            .frame(width: 1,height: 13)
                                        HStack(spacing: 4) {
                                            Text("zJ15CvylxUyAMrGGzo0H4Q==".bFHEatcgE4zzU9TCfDonsu()+String(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())))
                                                .g0LIIcoZQsOjyND9()
                                            Button{
                                                let gjikAoPvX = String(
                                                    qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int(
                                                        "oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu()
                                                    )
                                                )
                                                UIPasteboard.general.string = gjikAoPvX
                                                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("REb1QH5U5jRdbMUtHMwvWQ==")
                                            } label: {
                                                ZJ7h766mz(tMmEWWlfgUag: "gnuwJqMH3sA8Hce5wxEX")
                                                    .frame(width: 16,height: 16)
                                            }
                                        }
                                    }
                                }
                                Spacer()
                            }
                            HStack(spacing: 128) {
                                Button{
                                    f3gXkYHZIUAUWNv5SX2nZKCo.showScreen(.fullScreenCover){ _ in
                                        WUjfoptOKs8pZfhSAH0duplG {
                                            kaBpQbGjZ(c8WYppF6mHU: 3)
                                        }
                                    }
                                } label: {
                                    VStack(spacing: 4) {
                                        Text(String(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("upsNum")))
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .black
                                            )
                                        Text("Following")
                                            .g0LIIcoZQsOjyND9(
                                                color: Color.white.opacity(0.4)
                                            )
                                    }
                                }
                                Button{
                                    f3gXkYHZIUAUWNv5SX2nZKCo.showScreen(.fullScreenCover){ _ in
                                        WUjfoptOKs8pZfhSAH0duplG {
                                            kaBpQbGjZ(c8WYppF6mHU: 2, )
                                        }
                                    }
                                } label: {
                                    VStack(spacing: 4) {
                                        Text(String(qVi2QJ0SeDluhZ9xoQ8V7.iBmPfFGfxu5JV7Aii7.int("fansNum")))
                                            .g0LIIcoZQsOjyND9(
                                                size: 18,
                                                weight: .black
                                            )
                                        Text("Followers")
                                            .g0LIIcoZQsOjyND9(
                                                color: Color.white.opacity(0.4)
                                            )
                                    }
                                }
                            }
                        }
                        VStack(spacing: 16) {
                            //vip
//                            HStack(spacing: 8) {
//                                RoundedRectangle(cornerRadius: 12)
//                                    .stroke(
//                                        Color.white.opacity(0.1),
//                                        lineWidth: 1
//                                    )
//                                    .frame(height: 78)
//                                    .overlay {
//                                        ZJ7h766mz(tMmEWWlfgUag: "ewkwdg82JnajVffQKKJvEzzGNHepKO")
//                                        VStack(alignment: .leading, spacing: 5) {
//                                            Text("nXEiXqpDerOIK9cIltOdYw==".bFHEatcgE4zzU9TCfDonsu())
//                                                .g0LIIcoZQsOjyND9(
//                                                    color: Color.white.opacity(0.6)
//                                                )
//                                            HStack(spacing: 8) {
//                                                Text("9999")
//                                                    .g0LIIcoZQsOjyND9(
//                                                        size: 18,
//                                                        weight: .black
//                                                    )
//                                                ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
//                                                    .frame(width: 24,height: 24)
//                                                Spacer()
//                                            }
//                                        }
//                                        .padding(.leading,16)
//                                    }
//                                RoundedRectangle(cornerRadius: 12)
//                                    .frame(width: 127,height: 78)
//                                    .overlay {
//                                        ZJ7h766mz(tMmEWWlfgUag: "dNYdnd")
//                                        VStack(alignment: .leading, spacing: 5) {
//                                            Text("Vip")
//                                                .g0LIIcoZQsOjyND9(
//                                                    color: Color.white.opacity(0.6)
//                                                )
//                                            HStack(spacing: 8) {
//                                                ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
//                                                    .frame(width: 24,height: 24)
//                                                Spacer()
//                                            }
//                                        }
//                                        .padding(.leading,16)
//                                    }
//                            }
                            //vip  end
                            VStack(spacing: 0) {
                                Button{
                                    f3gXkYHZIUAUWNv5SX2nZKCo.showScreen(.fullScreenCover){ _ in
                                        WUjfoptOKs8pZfhSAH0duplG {
                                            bfoXTzIM4dlkv07MZv45zoMZVs23()
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 0) {
                                        HStack(spacing: 8) {
                                            ZJ7h766mz(tMmEWWlfgUag: "mC8m48bHtb35cMV")
                                                .frame(width: 26,height: 26)
                                            Text("1DvzZzsH5HkmS0//ed72fg==".bFHEatcgE4zzU9TCfDonsu())
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16
                                                )
                                        }
                                        Spacer()
                                        ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
                                            .frame(width: 24,height: 24)
                                    }
                                    .padding(.all,12)
                                }
                                //通知
//                                HStack(spacing: 0) {
//                                    HStack(spacing: 8) {
//                                        ZJ7h766mz(tMmEWWlfgUag: "dRXAyI")
//                                            .frame(width: 26,height: 26)
//                                        Text("u6ofXMGtiahsJ31KIcRvuw==".bFHEatcgE4zzU9TCfDonsu())
//                                            .g0LIIcoZQsOjyND9(
//                                                size: 16
//                                            )
//                                    }
//                                    Spacer()
//                                    Button {
//                                        xycvz.mYSDCpljHEidX6JhjetF()
//                                    } label: {
//                                        RoundedRectangle(cornerRadius: 325)
//                                            .fill(Color(red: 13/255, green: 13/255, blue: 18/255))
//                                            .frame(width: 49,height: 27)
//                                            .overlay {
//                                                ZStack {
//                                                    RoundedRectangle(cornerRadius: 325)
//                                                        .stroke(Color.white.opacity(0.35), lineWidth: 1)
//                                                    HStack {
//                                                        if xycvz.wgQztju2ChP5 { Spacer() }
//                                                        Circle()
//                                                            .fill(
//                                                                xycvz.wgQztju2ChP5
//                                                                ? LinearGradient(
//                                                                    colors: [
//                                                                        Color(red: 16/255, green: 227/255, blue: 1),
//                                                                        Color(red: 217/255, green: 28/255, blue: 1)
//                                                                    ],
//                                                                    startPoint: .topLeading,
//                                                                    endPoint: .bottomTrailing
//                                                                )
//                                                                : LinearGradient(
//                                                                    colors: [Color.white.opacity(0.4), Color.white.opacity(0.4)],
//                                                                    startPoint: .leading,
//                                                                    endPoint: .trailing
//                                                                )
//                                                            )
//                                                            .frame(width: 20, height: 20)
//                                                            .animation(.easeInOut(duration: 0.25), value: xycvz.wgQztju2ChP5)
//                                                        if !xycvz.wgQztju2ChP5 { Spacer() }
//                                                    }
//                                                    .padding(.horizontal, 4)
//                                                }
//                                            }
//                                    }
//                                }
//                                .padding(.all,12)
                            }
                            .padding(.vertical,4)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 24/255, green: 22/255, blue: 33/255))
                            )
                            VStack(spacing: 0) {
                                //Language
//                                HStack(spacing: 0) {
//                                    HStack(spacing: 8) {
//                                        ZJ7h766mz(tMmEWWlfgUag: "rcwkty")
//                                            .frame(width: 26,height: 26)
//                                        Text("Language")
//                                            .g0LIIcoZQsOjyND9(
//                                                size: 16
//                                            )
//                                    }
//                                    Spacer()
//                                    HStack(spacing: 8) {
//                                        Text("LmTqf817hoDCuEQqeDFtXw==".bFHEatcgE4zzU9TCfDonsu())
//                                            .g0LIIcoZQsOjyND9(
//                                                color: Color.white.opacity(0.6)
//                                            )
//                                        ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
//                                            .frame(width: 24,height: 24)
//                                    }
//                                }
//                                .padding(.all,12)
                                Button{
                                    f3gXkYHZIUAUWNv5SX2nZKCo.showScreen(.fullScreenCover) { _ in
                                        WUjfoptOKs8pZfhSAH0duplG {
                                            yDO7bVocx9JH0msGgIyRUs6e()
                                        }
                                    }
                                } label: {
                                    HStack(spacing: 0) {
                                        HStack(spacing: 8) {
                                            ZJ7h766mz(tMmEWWlfgUag: "bI3wkNyzCyPXGCpro")
                                                .frame(width: 26,height: 26)
                                            Text("k8e57l1EWt3riG/LDFHXfA==".bFHEatcgE4zzU9TCfDonsu())
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16
                                                )
                                        }
                                        Spacer()
                                        ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
                                            .frame(width: 24,height: 24)
                                    }
                                    .padding(.all,12)
                                }
                                Button{
                                    withAnimation{
                                        deZMvhJctiSoCj78YDk = true
                                    }
                                    
                                } label: {
                                    HStack(spacing: 0) {
                                        HStack(spacing: 8) {
                                            ZJ7h766mz(tMmEWWlfgUag: "uLpQEr9hLtV3BavMXPgLNJJrPiTF")
                                                .frame(width: 26,height: 26)
                                            Text("Log out")
                                                .g0LIIcoZQsOjyND9(
                                                    size: 16
                                                )
                                        }
                                        Spacer()
                                        ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
                                            .frame(width: 24,height: 24)
                                    }
                                    .padding(.all,12)
                                    .contentShape(Rectangle())
                                }
                            }
                            .padding(.vertical,4)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(red: 24/255, green: 22/255, blue: 33/255))
                            )
                        }
                    }
                    Text("T61SbTU+0q90Ny7Mxr7V2g==".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            size: 12,
                            color: Color.white.opacity(0.4)
                        )
                }
                .padding(.horizontal,16)
                .padding(.top,68)
                .padding(.bottom,29)
            }
            ZStack {
                if deZMvhJctiSoCj78YDk {
                    Color.black.opacity(0.7)
                        .onTapGesture {
                            deZMvhJctiSoCj78YDk = false
                        }
                    edUaA4t78 { lXBkygXXlhgeh963y8DmW in
                        deZMvhJctiSoCj78YDk = false
                        if lXBkygXXlhgeh963y8DmW == 1 {
                            ZRsco2bysq39NmLBBhFtU044p.i4WviDgqenaDYvEMcIY9fsb4smXSQb1.lVl52wvq4fL2AjD8MczeYD9FTXtw()
                            f3gXkYHZIUAUWNv5SX2nZKCo.showScreen(.fullScreenCover){ _ in
                                WUjfoptOKs8pZfhSAH0duplG {
                                    zkaqn9Jn()
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onChange(of: cOVPp3) { eGPIJc7hlg9zdF in
            if eGPIJc7hlg9zdF == .active {
                xycvz.s1UvUY5jDYFvHb3j0() // 再次检查权限状态
            }
        }
        .onAppear {
            vf0AD3wYQxpfxxjs2pE7PuO66Wls(2)
        }
    }
    
}

func vf0AD3wYQxpfxxjs2pE7PuO66Wls(_ tfKmqT:Int) -> Void {
    let hsiIAmjydsN5mMcG9 = hQ3WIqHVGH7oTmiDkGXDUO5HL9GjhFQ4(daFmc3QiCLth5mq3q1: tfKmqT, iQZrp8Zk6afD: ZoJOsS30O6aFGB936Oc0s.ahhr4vY6c0BLPJuChjgiYlBUhZHI())
    WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(tk5afnKIwTiQL5Ai79O0AnK3f5G: "/api/user/newLive/userFriend", b3q0LlCSk: hsiIAmjydsN5mMcG9) { (wF5G6xKQo: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
        switch wF5G6xKQo {
        case .success(let s5TNBPiUhvB0j2sNDBUXeqj0SxJ):
            print(s5TNBPiUhvB0j2sNDBUXeqj0SxJ.code)
            if s5TNBPiUhvB0j2sNDBUXeqj0SxJ.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                guard
                    let mT0s4u = s5TNBPiUhvB0j2sNDBUXeqj0SxJ.result,
                    !mT0s4u.isEmpty
                else {
                    return
                }
                let dcGZKkYUKbJNZZgk2 = mT0s4u.hL9dV3bQ2fK6sJ8p()
                print(dcGZKkYUKbJNZZgk2)
                if let f76DZRisVsTFhewp7jgbppPvZJ4p7cIq = dcGZKkYUKbJNZZgk2.niBylJAjsTHPDww() {
                    if tfKmqT == 3 {
                        IyfdHMdY.bTa3L6BoprG.n1G8RlzpcQK = f76DZRisVsTFhewp7jgbppPvZJ4p7cIq
                    }
                    if tfKmqT == 2 {
                        IyfdHMdY.bTa3L6BoprG.iF2ouR0gHFDSr3GJ = f76DZRisVsTFhewp7jgbppPvZJ4p7cIq
                    }
                }
            }
        case .failure(_):
            if tfKmqT == 3 {
                IyfdHMdY.bTa3L6BoprG.n1G8RlzpcQK = []
            }
            if tfKmqT == 2 {
                IyfdHMdY.bTa3L6BoprG.iF2ouR0gHFDSr3GJ = []
            }
        }
    }
}

extension String {
    func niBylJAjsTHPDww() -> [[String: Any]]? {
        guard let uuYJRbs = self.data(using: .utf8) else { return nil }
        let jbXpUFOiH0fNOYRjmaimu = try? JSONSerialization.jsonObject(with: uuYJRbs)
        return jbXpUFOiH0fNOYRjmaimu as? [[String: Any]]
    }
}

enum ZoJOsS30O6aFGB936Oc0s {
    
    static let ixRNOE7gBpmJGHp: DateFormatter = {
        let sQv8aCqzS2OzG3LsGkrS = DateFormatter()
        sQv8aCqzS2OzG3LsGkrS.locale = Locale(identifier: "5UGNfNCfUnlKjHijDy8KpQ==".bFHEatcgE4zzU9TCfDonsu())
        sQv8aCqzS2OzG3LsGkrS.timeZone = TimeZone.current
        sQv8aCqzS2OzG3LsGkrS.dateFormat = "aO7Rf1K8YJt1cfj9tevnWpdqGXdmj/n4xD7WZrm4l2w=".bFHEatcgE4zzU9TCfDonsu()
        return sQv8aCqzS2OzG3LsGkrS
    }()
    
    static func ahhr4vY6c0BLPJuChjgiYlBUhZHI() -> String {
        ixRNOE7gBpmJGHp.string(from: Date())
    }
}

#Preview {
    C8Z2x4M6YV9m()
}

//关注、粉丝列表查询接口参数配置
struct hQ3WIqHVGH7oTmiDkGXDUO5HL9GjhFQ4: Codable {
    
    let daFmc3QiCLth5mq3q1: Int //type
    let iQZrp8Zk6afD: String //searchTime
    
    func encode(to encoder: Encoder) throws {
        var lDTriJymDAyxAIgR8AKHUnVmeo = encoder.container(keyedBy: bonDyqD2YnaVJW.self)
        
        try lDTriJymDAyxAIgR8AKHUnVmeo.encode(
            daFmc3QiCLth5mq3q1,
            forKey: bonDyqD2YnaVJW(
                "type"
            )
        )
        
        try lDTriJymDAyxAIgR8AKHUnVmeo.encode(
            iQZrp8Zk6afD,
            forKey: bonDyqD2YnaVJW(
                "searchTime"
            )
        )
    }
}
