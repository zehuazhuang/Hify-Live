import SwiftUI
import SwiftfulRouting

//关注/粉丝列表
struct kaBpQbGjZ: View {
    
    let c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U: Int //0关注、1粉丝
    
    @Environment(\.router) var dgD3jliHY9U
    
    @State private var dAsuesK7LowSkyAjz: String = ""
    @FocusState private var iOEqt: Bool
    
    @StateObject private var s6RhFDX = IyfdHMdY.bTa3L6BoprG
    
    @StateObject private var uWyMj6qXc3DuK1NpQqqS59xjYUilI = NeTAPtsq1c()
    
    //搜素关注
    @State private var pLdM79zXX: [[String: Any]] = []
    
    //搜素粉丝
    @State private var u8b4S4CxlBmjAAjnGdB3: [[String: Any]] = []
    @State private var hiuUPDXVJqunzb2wCtYuiPUwKTV: String = ""
    
    func eG5Z9M3xJS2UOsSIUbPHAn6bXyk(x2m3J0yO0Lr8TIQbjIepNTy: String) -> [[String: Any]] {
        let oHSAcKFdkWbK5pgZF1Da: [[String:Any]] = c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 0 ? s6RhFDX.n1G8RlzpcQK : s6RhFDX.iF2ouR0gHFDSr3GJ
        guard !x2m3J0yO0Lr8TIQbjIepNTy.isEmpty else {
            return oHSAcKFdkWbK5pgZF1Da
        }
        let mSb4uaUQGklnRv2DPDITGog4tG: String = x2m3J0yO0Lr8TIQbjIepNTy.lowercased()
        return oHSAcKFdkWbK5pgZF1Da.filter { bMTXPjmu6TYVN5pjsmuxYsvaSw0VbbU1 in
            let fjX3oLVpOe9ZtCCpbhh2rHAud5 = bMTXPjmu6TYVN5pjsmuxYsvaSw0VbbU1
                .string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu())
                .lowercased()
            
            let kvYqvVC = String(
                bMTXPjmu6TYVN5pjsmuxYsvaSw0VbbU1.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())
            )
            return fjX3oLVpOe9ZtCCpbhh2rHAud5.contains(mSb4uaUQGklnRv2DPDITGog4tG) || kvYqvVC.contains(mSb4uaUQGklnRv2DPDITGog4tG)
        }
    }
    
    //取关弹框
    @State private var hENfpzM: Bool = false
    @State private var mAHhG: [String:Any] = [:]
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 24) {
                HStack(spacing: 12) {
                    Button{
                        dgD3jliHY9U.dismissScreen()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    Text((c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 0 ? "j6N2OHmBLAbXPzqOtT0sAA==" : "OKtvWktdeG2+akdspLRpzw==").bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                }
                .padding(.top,58)
                .padding(.leading,16)
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(red: 34/255, green: 34/255, blue: 38/255))
                    .frame(height: 46)
                    .overlay {
                        HStack(spacing: 0) {
                            ZStack(alignment: .leading) {
                                if dAsuesK7LowSkyAjz.isEmpty {
                                    Text("JALs87f+I/wMwfTm2r+TlF6F/Q9rx5JDoMs2mcPWPXM=".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            color: Color.white.opacity(0.4)
                                        )
                                        .padding(.horizontal,16)
                                }
                                TextField("", text: $dAsuesK7LowSkyAjz)
                                    .font(.custom("gz4QHFqRS4dH1OeOv3Zirg==".bFHEatcgE4zzU9TCfDonsu(), size: CGFloat(16)))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .padding(.horizontal,16)
                                    .tint(Color.white)
                                    .focused($iOEqt)
                            }
                            HStack(spacing: 14) {
                                if !dAsuesK7LowSkyAjz.isEmpty {
                                    Button{
                                        dAsuesK7LowSkyAjz = ""
                                    }label:{
                                        ZJ7h766mz(tMmEWWlfgUag: "zFOucRMExHz70IQ9HN054")
                                            .frame(width: 20,height: 20)
                                    }
                                }
                                Button{
                                    zAlD9caHrFnndX8hA5m8IsStFf()
                                } label: {
                                    ZJ7h766mz(tMmEWWlfgUag: "dISVC2NZGVkMSRHxkVy2")
                                        .frame(width: 36,height: 36)
                                }
                            }
                            .padding(.trailing,4)
                        }
                    }
                    .padding(.horizontal,16)
                ScrollView {
                    LazyVStack(spacing: 12) {
                        if c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 0 {
                            if pLdM79zXX.isEmpty {
                                ZJ7h766mz(tMmEWWlfgUag: "npIyAxb6vfM073130T9MwCJY8")
                                    .frame(width: 343,height: 248)
                                    .padding(.top,32)
                            } else {
                                ForEach(pLdM79zXX.indices, id: \.self) { x9p85C9Xgat in
                                    let wzTLNzTr08g9JO63zwCvus7cyCEG = pLdM79zXX[x9p85C9Xgat]
                                    HStack(spacing: 0) {
                                        HStack(spacing: 10) {
                                            Circle()
                                                .fill(Color.white.opacity(0.19))
                                                .frame(width: 48)
                                                .overlay(alignment: .center) {
                                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1:wzTLNzTr08g9JO63zwCvus7cyCEG.string("epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()))
                                                        .frame(width: 44,height: 44)
                                                        .clipShape(Circle())
                                                }
                                            VStack(alignment: .leading, spacing: 7) {
                                                i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l(wzTLNzTr08g9JO63zwCvus7cyCEG.string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()), eu35TPnxbaJLOeFBDIjy5: hiuUPDXVJqunzb2wCtYuiPUwKTV, hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj: Color.white, jNlN8bWwqoxxy8YmVpUqcusW6NqAV: Color(red: 23/255, green: 220/255, blue: 1), mY0c7aJw0GJoOZ1dbL8eaEi: 16, zV5GeEg: .semibold)
                                                    .lineLimit(1)
                                                    .truncationMode(.tail)
                                                i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l("zJ15CvylxUyAMrGGzo0H4Q==".bFHEatcgE4zzU9TCfDonsu() + String(wzTLNzTr08g9JO63zwCvus7cyCEG.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())), eu35TPnxbaJLOeFBDIjy5: hiuUPDXVJqunzb2wCtYuiPUwKTV, hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj: Color.white.opacity(0.6), jNlN8bWwqoxxy8YmVpUqcusW6NqAV: Color.white, mY0c7aJw0GJoOZ1dbL8eaEi: 14, zV5GeEg: .regular)
                                            }
                                        }
                                        Spacer()
                                        Button{
                                            mAHhG = wzTLNzTr08g9JO63zwCvus7cyCEG
                                            withAnimation(.spring()) {
                                                hENfpzM = true
                                            }
                                        } label: {
                                            RoundedRectangle(cornerRadius: 325)
                                                .fill(
                                                    LinearGradient(colors: [Color(red: 120/255, green: 223/255, blue: 1, opacity: 0.32),Color(red: 84/255, green: 105/255, blue: 199/255, opacity: 0.25)], startPoint: .leading, endPoint: .trailing)
                                                )
                                                .frame(width: 92,height: 33)
                                                .overlay(alignment: .center) {
                                                    Text("j6N2OHmBLAbXPzqOtT0sAA==".bFHEatcgE4zzU9TCfDonsu())
                                                        .g0LIIcoZQsOjyND9(
                                                            weight: .medium,
                                                            color: Color.white.opacity(0.6)
                                                        )
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
                        } else {
                            if u8b4S4CxlBmjAAjnGdB3.isEmpty {
                                ZJ7h766mz(tMmEWWlfgUag: "npIyAxb6vfM073130T9MwCJY8")
                                    .frame(width: 343,height: 248)
                                    .padding(.top,32)
                            } else {
                                ForEach(u8b4S4CxlBmjAAjnGdB3.indices, id: \.self) { vyckP62hgB in
                                    let vJ0Cj2TIZ2tsy5XuP = u8b4S4CxlBmjAAjnGdB3[vyckP62hgB]
                                    HStack(spacing: 0) {
                                        HStack(spacing: 10) {
                                            Circle()
                                                .fill(Color.white.opacity(0.19))
                                                .frame(width: 48)
                                                .overlay(alignment: .center) {
                                                    rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1:vJ0Cj2TIZ2tsy5XuP.string("epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()))
                                                        .frame(width: 44,height: 44)
                                                        .clipShape(Circle())
                                                }
                                            VStack(alignment: .leading, spacing: 7) {
                                                i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l(vJ0Cj2TIZ2tsy5XuP.string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()), eu35TPnxbaJLOeFBDIjy5: hiuUPDXVJqunzb2wCtYuiPUwKTV, hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj: Color.white, jNlN8bWwqoxxy8YmVpUqcusW6NqAV: Color(red: 23/255, green: 220/255, blue: 1), mY0c7aJw0GJoOZ1dbL8eaEi: 16, zV5GeEg: .semibold)
                                                    .lineLimit(1)
                                                    .truncationMode(.tail)
                                                i8WLc5e4KQTLECD3Dkpj8whZ53zXoA5l("zJ15CvylxUyAMrGGzo0H4Q==".bFHEatcgE4zzU9TCfDonsu() + String(vJ0Cj2TIZ2tsy5XuP.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())), eu35TPnxbaJLOeFBDIjy5: hiuUPDXVJqunzb2wCtYuiPUwKTV, hOJZ7I0DrjWv4jM8nKyK1Sq6ESUnj: Color.white.opacity(0.6), jNlN8bWwqoxxy8YmVpUqcusW6NqAV: Color.white, mY0c7aJw0GJoOZ1dbL8eaEi: 14, zV5GeEg: .regular)
                                            }
                                        }
                                        Spacer()
                                        Button{
                                            let id3csiFYCaPKeRS1La1E6mGVK:Bool = vJ0Cj2TIZ2tsy5XuP.bool("SHM2Ud0AqHkO1arpirqXyQ==".bFHEatcgE4zzU9TCfDonsu())
                                            if id3csiFYCaPKeRS1La1E6mGVK {
                                                mAHhG = vJ0Cj2TIZ2tsy5XuP
                                                withAnimation(.spring()) {
                                                    hENfpzM = true
                                                }
                                            } else {
                                                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                                                let hPPb4w4nrf1bmonWMIhfuG71v08jm: Int = vJ0Cj2TIZ2tsy5XuP.int("oPJJrP0sgO34aN0D8qwL6Q==".bFHEatcgE4zzU9TCfDonsu())
                                                let to2euxgE6BDP = iAQGZYygdyyJC5cW20cVOjDGrxll(iDvQ1aN: hPPb4w4nrf1bmonWMIhfuG71v08jm, isFAeSORfKB3YZS: 1)
                                                WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(tk5afnKIwTiQL5Ai79O0AnK3f5G: "Ax+One5OZLxypA3n9ZqrTHJJ1ZEzLjrxPPGLBCuA4W4=".bFHEatcgE4zzU9TCfDonsu(), b3q0LlCSk: to2euxgE6BDP) { (yDpLszKoUwzctSMlEiW2Hxu: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
                                                    switch yDpLszKoUwzctSMlEiW2Hxu {
                                                    case .success(let pkyX4qOexk6Z9mXhhQU8HnVQw):
                                                        print(pkyX4qOexk6Z9mXhhQU8HnVQw.code)
                                                        if pkyX4qOexk6Z9mXhhQU8HnVQw.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
                                                            Task {
                                                                await s6RhFDX.vf0AD3wYQxpfxxjs2pE7PuO66Wls(2)
                                                                await s6RhFDX.vf0AD3wYQxpfxxjs2pE7PuO66Wls(3)
                                                                EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("j6N2OHmBLAbXPzqOtT0sAA==")
                                                                zAlD9caHrFnndX8hA5m8IsStFf()
                                                            }
                                                        } else {
                                                            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz(pkyX4qOexk6Z9mXhhQU8HnVQw.message,z2E1geUN5miQ95SpoCG: false)
                                                        }
                                                    case .failure(let u0lXlYLQiGrjGGOpB9Mp):
                                                        var uArr57u4wCFEBiObMWHD5lidt7K:String = ""
                                                        if let lceNSIyqcTobVEYEgAQrxBBYhBKmg5B = u0lXlYLQiGrjGGOpB9Mp as? UVvaHCnbKWNk4KQPzW5aJDt {
                                                            uArr57u4wCFEBiObMWHD5lidt7K = lceNSIyqcTobVEYEgAQrxBBYhBKmg5B.eUJLh
                                                        } else {
                                                            uArr57u4wCFEBiObMWHD5lidt7K = u0lXlYLQiGrjGGOpB9Mp.localizedDescription
                                                        }
                                                        QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz(uArr57u4wCFEBiObMWHD5lidt7K)
                                                        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                                    }
                                                }
                                            }
                                        } label: {
                                            RoundedRectangle(cornerRadius: 325)
                                                .fill(
                                                    LinearGradient(colors: [Color(red: 120/255, green: 223/255, blue: 1, opacity: 0.32),Color(red: 84/255, green: 105/255, blue: 199/255, opacity: 0.25)], startPoint: .leading, endPoint: .trailing)
                                                )
                                                .frame(width: 92,height: 33)
                                                .overlay(alignment: .center) {
                                                    Text((vJ0Cj2TIZ2tsy5XuP.bool("SHM2Ud0AqHkO1arpirqXyQ==".bFHEatcgE4zzU9TCfDonsu()) ? "j6N2OHmBLAbXPzqOtT0sAA==" : "Arz11zRhkv0Nuf/+eUHRBQ==").bFHEatcgE4zzU9TCfDonsu())
                                                        .g0LIIcoZQsOjyND9(
                                                            weight: .medium,
                                                            color: Color.white.opacity(0.6)
                                                        )
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
                    .padding(.bottom, uWyMj6qXc3DuK1NpQqqS59xjYUilI.oAKQXVlwN80w73 + 20)
                }
            }
            ZStack(alignment: .center) {
                if hENfpzM {
                    Color.black.opacity(0.7)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                hENfpzM = false
                            }
                        }
                    t96hhl54U8f049(lOkofaLm73: mAHhG) { e50zaIpAoVytFU7APOZYurzf2jzXi2OI in
                        if e50zaIpAoVytFU7APOZYurzf2jzXi2OI == 1 {
                            zAlD9caHrFnndX8hA5m8IsStFf()
                        }
                        withAnimation(.spring()) {
                            hENfpzM = false
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            iOEqt = false
        }
        .onAppear {
            if c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 0 {
                pLdM79zXX = eG5Z9M3xJS2UOsSIUbPHAn6bXyk(x2m3J0yO0Lr8TIQbjIepNTy: "")
            }
            if c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 1 {
                u8b4S4CxlBmjAAjnGdB3 = eG5Z9M3xJS2UOsSIUbPHAn6bXyk(x2m3J0yO0Lr8TIQbjIepNTy: "")
            }
        }
    }
    
    func zAlD9caHrFnndX8hA5m8IsStFf() {
        let fYc4JL0vRj2uo: String = dAsuesK7LowSkyAjz.trimmingCharacters(in: .whitespaces)
        hiuUPDXVJqunzb2wCtYuiPUwKTV = dAsuesK7LowSkyAjz
        if c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 0 {
            pLdM79zXX = eG5Z9M3xJS2UOsSIUbPHAn6bXyk(x2m3J0yO0Lr8TIQbjIepNTy: fYc4JL0vRj2uo)
        }
        if c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U == 1 {
            u8b4S4CxlBmjAAjnGdB3 = eG5Z9M3xJS2UOsSIUbPHAn6bXyk(x2m3J0yO0Lr8TIQbjIepNTy: fYc4JL0vRj2uo)
        }
    }
}

#Preview {
    kaBpQbGjZ(c8WYppF6mHUmAV7PWfRx1p5rGFOwx46U: 1)
}
