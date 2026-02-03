import SwiftUI
import SwiftfulRouting
import PhotosUI

//国家名字
struct fjCgSDoOldKaA: View {
    
    var qvuJdMyEoxSDbyUy89dfE6jkoi: String = ""
    
    init(){
        if let e7wktq = UfmQhHA1doHKs.bHNA2Amheuq0.o6Ex5Lgp7q46dDOd3db {
            if let tQkQk6 = e7wktq.first(where: { ($0.string("sAocvCi8BLuHyjCjoxpviQ==".bFHEatcgE4zzU9TCfDonsu()) == IyfdHMdY.bTa3L6BoprG.iBmPfFGfxu5JV7Aii7.string("n5PP0bel6KDkIOVbFb+EYg==".bFHEatcgE4zzU9TCfDonsu())) }) {
                self.qvuJdMyEoxSDbyUy89dfE6jkoi = tQkQk6.string("eISSNYutN9jGiUUhHjL8DA==".bFHEatcgE4zzU9TCfDonsu())
            }
        }
    }
    
    var body: some View {
        Text(qvuJdMyEoxSDbyUy89dfE6jkoi)
            .g0LIIcoZQsOjyND9(
                size: 16,
                weight: .semibold,
            )
    }
}

enum JLHug8N7xnb123ngKc8C {
    case t42WkstAqbIacYIvoRlzE4YEpY6JiwPx
    case fnXMsUt6AcIUuyRfG
    case kXA5i81OrpNUNwCVu91MucnOHjhpWzFf
}

//个人信息编辑页面
struct lhOJY7byauJZOO6Kfr3SaKy6: View {
    
    @Environment(\.router) var qciToKO5nZO70
    
    @StateObject private var fFCUrf3NXxibojTjOBF2N = IyfdHMdY.bTa3L6BoprG
    
    @State private var cGwoByGGy860Qj8Gwd1XFLwLkuX4Ygom: String = "" //头像
    @State private var dYtaf6JUPaCMMjuFfq5DTi: String = "" //名字
    @State private var d4cSuyvEpjLSv: Int = 0 //性别
    @State private var st8tFmDYghEYtqM1ZqCn6B61n0: String = "" //生日
    
    @State private var qk4UVuR2yFy20wWW: Bool = false
    @State private var w7bdExan00WxzXNw1ApKTkPF: Bool = false
    @StateObject private var gld9V = wfrOCsB6K47hZMq0BpaueTp1()
    @State private var rJkszCycI4OgT2AtFSxiecEBil: Bool = false
    @State private var tWao3BI: Date = Date()
    
    //相册选择头像
    @State private var df0TAS = false
    @State private var zXjJXt0y0w4l2UBKD: PhotosPickerItem? = nil
    
    //相机拍摄头像
    @State private var fLHDoyZnVjNfsF6: JLHug8N7xnb123ngKc8C = .t42WkstAqbIacYIvoRlzE4YEpY6JiwPx
    @State private var pQ76tb1f1h7CVdkYFz6zZiZOShvPg: UIImage?
    @State private var sJ7lIFbdf = false
    let updeUsttncmI: ()-> Void
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                HStack(spacing: 12) {
                    Button{
                        qciToKO5nZO70.dismissScreen()
                        updeUsttncmI()
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                            .frame(width: 24,height: 24)
                    }
                    Text("Edit Profile")
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .semibold
                        )
                    Spacer()
                }.padding(.leading,16)
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        VStack(spacing: 24) {
                            Button{
                                withAnimation (.spring()) {
                                    qk4UVuR2yFy20wWW = true
                                }
                            } label: {
                                ZStack(alignment: .bottomTrailing) {
                                    Circle()
                                        .fill(Color.white.opacity(0.2))
                                        .frame(width: 88)
                                        .overlay(alignment: .center) {
                                            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: cGwoByGGy860Qj8Gwd1XFLwLkuX4Ygom)
                                                .frame(width: 80,height: 80)
                                                .clipShape(Circle())
                                        }
                                    ZJ7h766mz(tMmEWWlfgUag: "f4Z7BwqXpqnf2Tep")
                                        .frame(width: 24,height: 24)
                                }.allowsHitTesting(false)
                            }
                            VStack(spacing: 12) {
                                VStack(alignment: .leading, spacing: 14) {
                                    Text("Basic info")
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .medium
                                        )
                                    VStack(spacing: 0) {
                                        Button {
                                            withAnimation (.spring()) {
                                                w7bdExan00WxzXNw1ApKTkPF = true
                                            }
                                        } label: {
                                            HStack(spacing: 0) {
                                                HStack(spacing: 4) {
                                                    ZJ7h766mz(tMmEWWlfgUag: "sKP34phYCj0iQ5XvfUcjm")
                                                        .frame(width: 24,height: 24)
                                                        .opacity(0.6)
                                                    Text("Nickname:")
                                                        .g0LIIcoZQsOjyND9(
                                                            color: Color.white.opacity(0.6)
                                                        )
                                                }
                                                Spacer()
                                                HStack(spacing: 8) {
                                                    Text(dYtaf6JUPaCMMjuFfq5DTi)
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 16,
                                                            weight: .semibold,
                                                        )
                                                        .lineLimit(1)
                                                        .truncationMode(.tail)
                                                    ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
                                                        .frame(width: 20,height: 20)
                                                }
                                            }
                                            .padding(.vertical,12)
                                        }
                                       
                                            HStack(spacing: 0) {
                                                HStack(spacing: 4) {
                                                    ZJ7h766mz(tMmEWWlfgUag: "qGv3QVCHp5")
                                                        .frame(width: 24,height: 24)
                                                        .opacity(0.6)
                                                    Text("Gender:")
                                                        .g0LIIcoZQsOjyND9(
                                                            color: Color.white.opacity(0.6)
                                                        )
                                                }
                                                Spacer()
                                                HStack(spacing: 0) {
                                                    Text((d4cSuyvEpjLSv == 0 ? "9oqUCKDdH7g2d1tzqh3Kjw==" : d4cSuyvEpjLSv == 1 ? "LmkN2QmpsDt/RNDYrWqCww==" : "xhrWYspSsmKPD+0ke6yevQ==").bFHEatcgE4zzU9TCfDonsu())
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 16,
                                                            weight: .semibold
                                                        )
                                                }
                                                .padding(.trailing, 28)
                                            }
                                            .padding(.vertical,12)
                                            .onTapGesture {
                                                
                                            }
                                        
                                        
                                        Button {
                                            tWao3BI = st8tFmDYghEYtqM1ZqCn6B61n0.a5JBR() ?? Date()
                                            withAnimation (.spring()) {
                                                rJkszCycI4OgT2AtFSxiecEBil = true
                                            }
                                        } label: {
                                            HStack(spacing: 0) {
                                                HStack(spacing: 4) {
                                                    ZJ7h766mz(tMmEWWlfgUag: "j1GtPWGpGXrkZWpZEifKWjZWaz2")
                                                        .frame(width: 24,height: 24)
                                                        .opacity(0.6)
                                                    Text("vySCbBGonoa5qd8IaXr4Iw==".bFHEatcgE4zzU9TCfDonsu())
                                                        .g0LIIcoZQsOjyND9(
                                                            color: Color.white.opacity(0.6)
                                                        )
                                                }
                                                Spacer()
                                                HStack(spacing: 8) {
                                                    Text(st8tFmDYghEYtqM1ZqCn6B61n0)
                                                        .g0LIIcoZQsOjyND9(
                                                            size: 16,
                                                            weight: .semibold,
                                                        )
                                                    ZJ7h766mz(tMmEWWlfgUag: "yiO9qy150CqyRo4D1IsfV6wA35SVV")
                                                        .frame(width: 20,height: 20)
                                                }
                                            }
                                            .padding(.vertical,12)
                                        }
                                      
                                            HStack(spacing: 0) {
                                                HStack(spacing: 4) {
                                                    ZJ7h766mz(tMmEWWlfgUag: "zppAkkGNNw2NqWyov3l1PcB")
                                                        .frame(width: 24,height: 24)
                                                        .opacity(0.6)
                                                    Text("Country:")
                                                        .g0LIIcoZQsOjyND9(
                                                            color: Color.white.opacity(0.6)
                                                        )
                                                }
                                                Spacer()
                                                HStack(spacing: 8) {
                                                    CountryFlagView(countryCode: fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7.string("countryId"))
                                                    fjCgSDoOldKaA()
                                                }
                                                .padding(.trailing, 28)
                                            }
                                            .padding(.vertical,12)
                                            .onTapGesture {
                                                
                                            }
                                        
                                     
                                    }
                                }
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("1N2ddOVmw5NEAI+hoY/QTw==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(
                                            size: 16,
                                            weight: .medium
                                        )
                                    ScrollView(.horizontal,showsIndicators: false) {
                                        LazyHStack(spacing: 12) {
                                            Button {
                                                qciToKO5nZO70.showScreen(.fullScreenCover){ _ in
                                                    WUjfoptOKs8pZfhSAH0duplG {
                                                        o95HINW4DpHIAT(updplVCKiB4I: {
                                                           // asd
                                                        })
                                                    }
                                                }
                                            } label: {
                                                ZStack(alignment: .center) {
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .fill(Color(red: 34/255, green: 34/255, blue: 38/255))
                                                        .frame(width: 123, height: 96)
                                                    RoundedRectangle(cornerRadius: 8)
                                                        .stroke(
                                                            Color.white.opacity(0.4),
                                                            style: StrokeStyle(
                                                                lineWidth: 1,
                                                                lineCap: .round,
                                                                dash: [8, 6]
                                                            )
                                                        )
                                                        .frame(width: 122, height: 95)
                                                    ZJ7h766mz(tMmEWWlfgUag: "yJv1l88NyCjeIR2yve6vkxIHscdO")
                                                        .frame(width: 16,height: 16)
                                                }
                                            }
                                            ForEach(0..<fFCUrf3NXxibojTjOBF2N.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi.count, id: \.self) { nPN5iSalop65BxGw2PyLLabD in
                                                rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: fFCUrf3NXxibojTjOBF2N.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi[nPN5iSalop65BxGw2PyLLabD])
                                                    .frame(width: 123, height: 96)
                                                    .clipShape(RoundedRectangle(cornerRadius: 8))
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal,16)
                        }
                    }
                    .padding(.top, 23)
                }
            }
            //头像修改选择
            
                if qk4UVuR2yFy20wWW {
                   
                    f52Zxoy0vfJtZQ8pdH9SQ(eQLvijjIGA: $qk4UVuR2yFy20wWW, p6JuwoLebzf2SwHZu: { vZgIb in
                        withAnimation (.spring()) {
                            qk4UVuR2yFy20wWW = false
                        }
                        if vZgIb == 0 {
                            df0TAS = true
                        }
                        if vZgIb == 1 {
                            uqGJG4SKfNUwvaccjK { wOQsa2Rz3C in
                                if wOQsa2Rz3C == .dwqlT9VmmEYYHwKn1NCjIsctGoXtH {
                                    fLHDoyZnVjNfsF6 = .fnXMsUt6AcIUuyRfG
                                    sJ7lIFbdf = true
                                }
                                if wOQsa2Rz3C == .la3SfK {
//                                    print("用户拒绝或受限")
                                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("5JWgSLHThmZZBPKO+AUc/GQ0hPbqLLfOhpZplcSWbn2mt+rdcEvhkYGmIvDC1XAaMf9bKx4QnMY7p5UV04dbbrKIEUtj6MVCdWgo0x6s3Sc=")
                                }
                            }
                        }
                    })
                    
                }
            
            //昵称修改
            
                if w7bdExan00WxzXNw1ApKTkPF {
                   
                    gLbtyYG0Wv7sCLCBw4clY50L52A(eVulY4gOzp0: $w7bdExan00WxzXNw1ApKTkPF, iL0NKgp4pke7ysRjBfAm2JfaRY4gSmr: dYtaf6JUPaCMMjuFfq5DTi, lCxJiMKZtg1hoPRLD0YDp9: { am3oNoXm981ANUpo3hE2ot1felWYufP0 in
                        UIApplication.shared.tYy4aaFBbAAkhfUEYIoF()
                        w7bdExan00WxzXNw1ApKTkPF = false
                        Task {
                            await MainActor.run {
                                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                            }
                            do {
                                defer { // 相当于 finally
                                    Task { @MainActor in
                                        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                    }
                                }
                                // TODO: 上传完成后处理，比如插入列表
                                let ooBytnH73dCNonF: Bool = await zMfGchIhPuhjVeifVgq2pBi6XtmHd8(fFJXbBAYX64Bd9TNTWYYIxykCGFjcDKb: am3oNoXm981ANUpo3hE2ot1felWYufP0)
                                
                                if ooBytnH73dCNonF {
                                    fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7["BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu()] = am3oNoXm981ANUpo3hE2ot1felWYufP0
                                    dYtaf6JUPaCMMjuFfq5DTi = am3oNoXm981ANUpo3hE2ot1felWYufP0
                                } else {
                                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("GNIqDV/ixpE70ytkoGIfVjHRTEfu+ebbItHwOWkgeEM=")
                                }
                            }
                        }
                    })
                   
                    
                }
            
           
           
            
            
            
            
            //生日修改
           
                if rJkszCycI4OgT2AtFSxiecEBil {
               
                    BirthdayBottomSheet(isPresented: $rJkszCycI4OgT2AtFSxiecEBil, initialDate: tWao3BI) { sfMSOkfzN6H8TzIbAbM8VI4 in
                        rJkszCycI4OgT2AtFSxiecEBil = false
                        print(sfMSOkfzN6H8TzIbAbM8VI4)
                        Task {
                            await MainActor.run {
                                EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                            }
                            let h8uHxuKc: String = sfMSOkfzN6H8TzIbAbM8VI4.micBHIsg()
                            print(h8uHxuKc)
                            do {
                                defer { // 相当于 finally
                                    Task { @MainActor in
                                        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                    }
                                }
                                // TODO: 上传完成后处理，比如插入列表
                                let jGvmILNfTQMWH3b7lZchWRKlK: Bool = await zMfGchIhPuhjVeifVgq2pBi6XtmHd8(jLCfyATGXvVMlhRsH3mEw: h8uHxuKc)
                                
                                if jGvmILNfTQMWH3b7lZchWRKlK {
                                    fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7["r9m4DBfC1PJPAxrJqUKxjw==".bFHEatcgE4zzU9TCfDonsu()] = h8uHxuKc
                                    st8tFmDYghEYtqM1ZqCn6B61n0 = h8uHxuKc
                                } else {
                                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("9/7y+1EAk4+8C0pmPlroSy0OFQSQ5ocAc+MryeRsm50=")
                                }
                            }
                        }
                    }
                   
                }
           
        }
        
        .onAppear {
            cGwoByGGy860Qj8Gwd1XFLwLkuX4Ygom = fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7.string("epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu())
            dYtaf6JUPaCMMjuFfq5DTi = fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7.string("BRZTNxzF2tiDYdydqQz6ZQ==".bFHEatcgE4zzU9TCfDonsu())
            d4cSuyvEpjLSv = fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7.int("L5n0qfdvZqNQucJVPr5TZg==".bFHEatcgE4zzU9TCfDonsu())
            st8tFmDYghEYtqM1ZqCn6B61n0 = fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7.string("r9m4DBfC1PJPAxrJqUKxjw==".bFHEatcgE4zzU9TCfDonsu())
        }
        .photosPicker(isPresented: $df0TAS, selection: $zXjJXt0y0w4l2UBKD, matching: .images)
        .onChange(of: zXjJXt0y0w4l2UBKD) { t2oB7hyJnPbXkPdwkYhUm8fVf in
            guard let t2oB7hyJnPbXkPdwkYhUm8fVf else { return }
            Task {
                await MainActor.run {
                    EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                }
                do {
                    defer { // 相当于 finally
                        Task { @MainActor in
                            EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                            zXjJXt0y0w4l2UBKD = nil
                        }
                    }
                    
                    // 1. 获取图片 Data
                    if let nhBxnX = try await t2oB7hyJnPbXkPdwkYhUm8fVf.loadTransferable(type: Data.self) {
                        
                        // 2. 临时保存到本地文件
                        let mTOcjYsH = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).jpg")
                        try nhBxnX.write(to: mTOcjYsH)
                        
                        // 3. 调用 OSS 上传
                        let oc1PyB2liolVzIyLxWaHyNMlhLN8GKF = "\(UUID().uuidString).jpg" // 你的 OSS objectKey
                        let wHOB6yEV = try await IsZTtO2FdO13EJk8A2xBPRHSqlJx.f6fKqLNtg0zFmWoa2M1VFlHkb42.lsPWcBctMdZKbZmayF(mp5zcQyx: mTOcjYsH, iQG9oHdO6VjSKvCvA6dikEBFjKYP: oc1PyB2liolVzIyLxWaHyNMlhLN8GKF)
                        
                        //                        print("上传完成，HTTPS 地址: \(uploadedURL)")
                        // TODO: 上传完成后处理，比如插入列表
                        let bczB8aR7ig: Bool = await zMfGchIhPuhjVeifVgq2pBi6XtmHd8(o5xi4gYSKKtKesOv4h6Qqmq5Gm7xaqV: wHOB6yEV)
                        if bczB8aR7ig {
                            fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7["epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()] = wHOB6yEV
                            cGwoByGGy860Qj8Gwd1XFLwLkuX4Ygom = wHOB6yEV
                        } else {
                            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("xI0ZIhbhVyHclrMTc2etOc05DbDAdaKSIevx/ATxW0g=")
                        }
                    }
                } catch {
                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("E3uCWWzaPIMRRUtKZpt4Dg==")
                }
            }
        }
        //头像裁剪上传
        .fullScreenCover(isPresented: $sJ7lIFbdf) {
            YWO0RAXDrkfnaEsqm6Hl(
                poZ2X2Sa2L4ptXNHHJp: $pQ76tb1f1h7CVdkYFz6zZiZOShvPg,
                pNlJ8LBBlPdz6gOlKi8FFZN4qh: $fLHDoyZnVjNfsF6,
                t07GGVQzMuWF7l3nXqXwgDxZpL8: {
                    sJ7lIFbdf = false
                },
                aEFs3iKOWjdoKmxFqdC: { u269KUzQ in
                    sJ7lIFbdf = false
                    Task {
                        await MainActor.run {
                            EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
                        }
                        do {
                            defer { // 相当于 finally
                                Task { @MainActor in
                                    EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
                                }
                            }
                            
                            // 1. 获取图片 Data
                            if let nhBxnX = u269KUzQ.jpegData(compressionQuality: 0.9) {
                                
                                // 2. 临时保存到本地文件
                                let mTOcjYsH = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).jpg")
                                try nhBxnX.write(to: mTOcjYsH)
                                
                                // 3. 调用 OSS 上传
                                let oc1PyB2liolVzIyLxWaHyNMlhLN8GKF = "\(UUID().uuidString).jpg" // 你的 OSS objectKey
                                let wHOB6yEV = try await IsZTtO2FdO13EJk8A2xBPRHSqlJx.f6fKqLNtg0zFmWoa2M1VFlHkb42.lsPWcBctMdZKbZmayF(mp5zcQyx: mTOcjYsH, iQG9oHdO6VjSKvCvA6dikEBFjKYP: oc1PyB2liolVzIyLxWaHyNMlhLN8GKF)
                                
                                //                        print("上传完成，HTTPS 地址: \(uploadedURL)")
                                // TODO: 上传完成后处理，比如插入列表
                                let bczB8aR7ig: Bool = await zMfGchIhPuhjVeifVgq2pBi6XtmHd8(o5xi4gYSKKtKesOv4h6Qqmq5Gm7xaqV: wHOB6yEV)
                                if bczB8aR7ig {
                                    fFCUrf3NXxibojTjOBF2N.iBmPfFGfxu5JV7Aii7["epJeJ5mHHtIgvijlrcmUsg==".bFHEatcgE4zzU9TCfDonsu()] = wHOB6yEV
                                    cGwoByGGy860Qj8Gwd1XFLwLkuX4Ygom = wHOB6yEV
                                } else {
                                    QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("xI0ZIhbhVyHclrMTc2etOc05DbDAdaKSIevx/ATxW0g=")
                                }
                            }
                        } catch {
                            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("E3uCWWzaPIMRRUtKZpt4Dg==")
                        }
                    }
                }
            )
        }
    }
}


struct YWO0RAXDrkfnaEsqm6Hl: View {

    @Binding var poZ2X2Sa2L4ptXNHHJp: UIImage?
    @Binding var pNlJ8LBBlPdz6gOlKi8FFZN4qh: JLHug8N7xnb123ngKc8C
    let t07GGVQzMuWF7l3nXqXwgDxZpL8: () -> Void
    let aEFs3iKOWjdoKmxFqdC: (UIImage) -> Void

    var body: some View {
        ZStack {
            switch pNlJ8LBBlPdz6gOlKi8FFZN4qh {
            case .fnXMsUt6AcIUuyRfG:
                RIZK0qmwl0ZtOq0G9nRElyU9m { vnRRe3mzs in
                    poZ2X2Sa2L4ptXNHHJp = vnRRe3mzs
                    pNlJ8LBBlPdz6gOlKi8FFZN4qh = .kXA5i81OrpNUNwCVu91MucnOHjhpWzFf
                }

            case .kXA5i81OrpNUNwCVu91MucnOHjhpWzFf:
                WkdtHh8GoDUvyeJVeOx4z(
                    lTVefSlXPmO: $poZ2X2Sa2L4ptXNHHJp,
                    ymiTLnjCgoLsDs8h2GuCiFd9DAjbQdKK: {
                        t07GGVQzMuWF7l3nXqXwgDxZpL8()
                    },
                    wzMbhm9JrwdWtpn5S7: { fbU3Y in
//                        print("🔥 确认使用头像")
                        aEFs3iKOWjdoKmxFqdC(fbU3Y)
                        pNlJ8LBBlPdz6gOlKi8FFZN4qh = .t42WkstAqbIacYIvoRlzE4YEpY6JiwPx
                    }
                )

            default:
                EmptyView()
            }
        }
        .ignoresSafeArea()
    }
}
