import SwiftUI
import SwiftfulRouting
import PhotosUI

struct Ek9tKrgkM0Mjp: Identifiable, Equatable {
    let id = UUID()
    var nVDMgVMWU: UIImage? = nil
    var g0HjS5Fukj: String?
    var ir1Yyu2: Double = 0.0 // 0 = 未上传, 1 = 上传完成
    var xQdU5oYzMdsaZX: Bool = false
}


struct vXnYs42e0Iwbxgobql0WWYEE2BWxBm: PreferenceKey {
    static var defaultValue: [UUID: CGRect] = [:]
    static func reduce(value: inout [UUID : CGRect], nextValue: () -> [UUID : CGRect]) {
        value.merge(nextValue(), uniquingKeysWith: { $1 })
    }
}

//个人相册修改
struct o95HINW4DpHIAT: View {
    
    @Environment(\.router) var cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb
    
    @State private var idW6C0: [Ek9tKrgkM0Mjp] = []
    
    @State private var mjRYExqGqlfs5RlPB5FQ1oGd = false
    @State private var iCBiZ: PhotosPickerItem? = nil
    
    @StateObject private var cDiXG5 = IyfdHMdY.bTa3L6BoprG
    
    // 拖拽状态
    @State private var cFCN9v7xy0xUis3K3Ss: Ek9tKrgkM0Mjp? = nil
    @State private var pQFbkvCM: CGSize = .zero
    @State private var poCajTQza0DvrQs1rz5Us8h6iY3mgF2: Int? = nil
    
    @State private var eetqrSRRm6atCHeh4bBxGa: [UUID: CGRect] = [:]
    
    private let jMquwmXIlo3YMECCULx = CGSize(width: 167, height: 126)
    private let p9xZ4tP491jUM7ZJFDT1MwT9jK: CGFloat = 60
    
    //失败弹框
    @State private var m4L0puD8tjRnlYgpCJgN0PyGZ6BJhS: Bool = false
    @State private var r7L9pCA: [String] = []
    
    //相册是否更新
    @State private var cGEKtoCPXDlpstFSxU9vX1eerl8AGL: [Ek9tKrgkM0Mjp] = []
    @State private var efGGYeTiHzlZ9rnXAlq62oUAgD9hLG: Bool = false
    let updplVCKiB4I :() -> Void //上传相册成功回调更新用户数据
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
                .ignoresSafeArea()
            VStack(spacing: 5) {
                HStack(spacing: 0, content: {
                    HStack(spacing: 12) {
                        Button{
                            if cGEKtoCPXDlpstFSxU9vX1eerl8AGL != idW6C0 {
                                efGGYeTiHzlZ9rnXAlq62oUAgD9hLG = true
                                
                            } else {
                                cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb.dismissScreen()
                            }
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                                .frame(width: 24,height: 24)
                        }
                        Text("Your profile photo")
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: .semibold
                            )
                    }
                    Spacer()
                    if cGEKtoCPXDlpstFSxU9vX1eerl8AGL != idW6C0 {
                        Button {
                            Task {
                                await by8Gte1b3p2Yc6K3qoK7hl0Egxd()
                                updplVCKiB4I()
                            }
                        } label: {
                            RoundedRectangle(cornerRadius: 325)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(red: 16/255, green: 227/255, blue: 1),
                                            Color(red: 217/255, green: 28/255, blue: 1)
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: 78,height: 33)
                                .overlay(alignment: .center) {
                                    Text("Save")
                                        .g0LIIcoZQsOjyND9(
                                            weight: .medium
                                        )
                                }
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 325)
                            .fill(Color.white.opacity(0.15))
                            .frame(width: 78,height: 33)
                            .overlay(alignment: .center) {
                                Text("hZ5+j3VKZ8mtaGSA5ogSvw==".bFHEatcgE4zzU9TCfDonsu())
                                    .g0LIIcoZQsOjyND9(
                                        weight: .medium,
                                        color: Color.white.opacity(0.4)
                                    )
                            }
                    }
                })
                
                .padding(.horizontal,16)
                HStack(spacing: 0) {
                    Text("FEAR8GvovJA5jcxMaK0lDplVMLzQ45sxPiU8eV7b2UuUbebYKDoGeS348FA7zHc6".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            color: Color.white.opacity(0.4)
                        )
                    Spacer()
                }
                .padding(.horizontal,16)
                ZStack{
                    ScrollView(showsIndicators: false) {
                        let mVPc1uy = [
                            GridItem(.flexible(), spacing: 9),
                            GridItem(.flexible(), spacing: 9)
                        ]
                        
                        let jotfqg1KIVzylzH36S3Ua20DhRZ = idW6C0.count < 8
                        let tOzFLuluJrJkt8RvB07AlCLn = jotfqg1KIVzylzH36S3Ua20DhRZ ? idW6C0.count + 1 : idW6C0.count
                        
                        LazyVGrid(columns: mVPc1uy, spacing: 12) {
                            ForEach(0..<tOzFLuluJrJkt8RvB07AlCLn, id: \.self) { sQunBq9mddJhQKKwzQd7sXSGR6i0m in
                                if jotfqg1KIVzylzH36S3Ua20DhRZ && sQunBq9mddJhQKKwzQd7sXSGR6i0m == 0 {
                                    // ➕ 添加按钮
                                    Button {
                                        mjRYExqGqlfs5RlPB5FQ1oGd = true
                                    } label: {
                                        tdBdcS7Dqc()
                                    }
                                } else {
                                    // 📷 相册项
                                    let nJwvSr9XNV7s1L = jotfqg1KIVzylzH36S3Ua20DhRZ ? sQunBq9mddJhQKKwzQd7sXSGR6i0m - 1 : sQunBq9mddJhQKKwzQd7sXSGR6i0m
                                    let u5CYcOIw9DpOR1v = idW6C0[nJwvSr9XNV7s1L]
                                    
                                    wXWAaYKmLFbT1jAfqZ4KlTVAwpC(nFBDXePJdd41Kp: u5CYcOIw9DpOR1v) { ukbVrABN in
                                        ib0Vb(ukbVrABN)
                                    }
                                    .opacity(cFCN9v7xy0xUis3K3Ss?.id == u5CYcOIw9DpOR1v.id ? 0.3 : 1)
                                    .background(
                                        GeometryReader { ekaNZEE5dqyqVhxNFxZ8WRi in
                                            Color.clear
                                                .preference(
                                                    key: vXnYs42e0Iwbxgobql0WWYEE2BWxBm.self,
                                                    value: [u5CYcOIw9DpOR1v.id: ekaNZEE5dqyqVhxNFxZ8WRi.frame(in: .named("grid"))]
                                                )
                                        }
                                    )
                                    .gesture(y2iUFXsgcFp0svlttakasX6wr7xCNH(for: u5CYcOIw9DpOR1v))
                                }
                            }
                        }
                        .padding(.top,14)
                        .padding(.horizontal,16)
                        .padding(.bottom,30)
                    }
                    .coordinateSpace(name: "grid")
                    .onPreferenceChange(vXnYs42e0Iwbxgobql0WWYEE2BWxBm.self) { pXm1wtSEG3oc5K6qKBD8TGkf7ehxIOY2 in
                        eetqrSRRm6atCHeh4bBxGa = pXm1wtSEG3oc5K6qKBD8TGkf7ehxIOY2
                    }
                    // 顶层拖动格子
                    if let m4tlWiEVaLi0qjHy = cFCN9v7xy0xUis3K3Ss,
                       let prkSZhR3GWEnG = eetqrSRRm6atCHeh4bBxGa[m4tlWiEVaLi0qjHy.id] {
                        wXWAaYKmLFbT1jAfqZ4KlTVAwpC(nFBDXePJdd41Kp: m4tlWiEVaLi0qjHy) { sEDvf77Ra in
                            ib0Vb(sEDvf77Ra)
                        }
                        .frame(width: jMquwmXIlo3YMECCULx.width, height: jMquwmXIlo3YMECCULx.height)
                        .cornerRadius(8)
                        .position(
                            x: prkSZhR3GWEnG.midX + pQFbkvCM.width,
                            y: prkSZhR3GWEnG.midY + pQFbkvCM.height
                        )
                        .zIndex(100)
                    }
                }
            }
            ZStack(alignment: .bottom){
                if m4L0puD8tjRnlYgpCJgN0PyGZ6BJhS {
                    Color.black.opacity(0.7)
                        .onTapGesture {
                            withAnimation (.spring()) {
                                m4L0puD8tjRnlYgpCJgN0PyGZ6BJhS = false
                            }
                        }
                    zWVkvD8sPGifMiUqF0rmlh44Sq(tGT3Nn2qNvR7GutBXylMRWmC: r7L9pCA) {
                        withAnimation (.spring()) {
                            m4L0puD8tjRnlYgpCJgN0PyGZ6BJhS = false
                        }
                        mjRYExqGqlfs5RlPB5FQ1oGd = true
                    }
                    .transition(.move(edge: .bottom))
                }
            }
            ZStack {
                if efGGYeTiHzlZ9rnXAlq62oUAgD9hLG {
                    Color.black.opacity(0.7)
                        .onTapGesture {
                                efGGYeTiHzlZ9rnXAlq62oUAgD9hLG = false
                        }
                    rpc3EoOHg1hTPs6bBIVjTifMG0 { zH2z17nr7J1Ry1UvflocgInToQd in
                            efGGYeTiHzlZ9rnXAlq62oUAgD9hLG = false
                        if zH2z17nr7J1Ry1UvflocgInToQd == 1 {
                            Task {
                                await by8Gte1b3p2Yc6K3qoK7hl0Egxd()
                            }
                        }
                        if zH2z17nr7J1Ry1UvflocgInToQd == 2 {
                            updplVCKiB4I()
                            cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb.dismissScreen()
                        }
                    }
                }
            }
        }
        
        .onAppear {
            idW6C0 = cDiXG5.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi.map({ kbMdtvfyvlqgAeAVR6mMtBZSQp8279 in
                Ek9tKrgkM0Mjp(nVDMgVMWU: nil, g0HjS5Fukj: kbMdtvfyvlqgAeAVR6mMtBZSQp8279,xQdU5oYzMdsaZX: false)
            })
            cGEKtoCPXDlpstFSxU9vX1eerl8AGL = idW6C0
        }
        .photosPicker(isPresented: $mjRYExqGqlfs5RlPB5FQ1oGd, selection: $iCBiZ, matching: .images)
        .onChange(of: iCBiZ) { z0r6vccI in
            guard let dpiiUG = z0r6vccI else { return }
            dpiiUG.loadTransferable(type: Data.self) { it8aJyTrNbFs8cM2Lef in
                switch it8aJyTrNbFs8cM2Lef {
                case .success(let nduOBqK6?):
                    if let wUPu0tlG47fr1hdFEsOo9Klvh = UIImage(data: nduOBqK6) {
                        DispatchQueue.main.async {
                            // 插入到第一位，上传中显示
                            let zwM38ca = Ek9tKrgkM0Mjp(nVDMgVMWU: wUPu0tlG47fr1hdFEsOo9Klvh, g0HjS5Fukj: "", ir1Yyu2: 0, xQdU5oYzMdsaZX: true)
                            idW6C0.insert(zwM38ca, at: 0)
                            // 模拟上传完成（替换成真实网络地址）
                            x9YpexQkLx7IBeY36LSDzGLtaXYlu(l7Y3OLB89tr0moPNKkF: zwM38ca.id, kNn2ivCsDXkpVtyDNltRMIV: wUPu0tlG47fr1hdFEsOo9Klvh)
                            iCBiZ = nil
                        }
                    }
                case .success(_):
                    print("kPigb9ov67BYrN5AlYl2MTm9")
                case .failure(let dqMLFwem0k3OoFTZ):
                    print(dqMLFwem0k3OoFTZ)
                }
            }
        }
    }
    
    func by8Gte1b3p2Yc6K3qoK7hl0Egxd() async {
        EfqJ9.hlLgQUr6MegOX6Bv.w9VPVHt()
        let uZ2AU6EKeqtS7lDkDwOojcj5k5nNS: [String] =
        idW6C0
            .compactMap { $0.g0HjS5Fukj }   // 去掉 nil
            .filter { !$0.isEmpty }        // 去掉 ""
        let jIeo5wbgvvsamVywfDiVXL: JUsmLn3i59tKLD7RL294I0nAG? = await a7wkluGHEiGGT3Zc1PbE7(uZ2AU6EKeqtS7lDkDwOojcj5k5nNS)
        EfqJ9.hlLgQUr6MegOX6Bv.gCQfGMHte60TbdzVw()
        if let w1C0d: JUsmLn3i59tKLD7RL294I0nAG = jIeo5wbgvvsamVywfDiVXL {
            guard
                let oMKd7qebhMlgH3bk = w1C0d.result,
                !oMKd7qebhMlgH3bk.isEmpty
            else {
                cDiXG5.uHvAw2RQt5e3D68ldNmdTdSG2q3M2eQi = idW6C0.compactMap { $0.g0HjS5Fukj }
                cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb.dismissScreen()
                QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("Gs7mu5e0GqYNjKG697HCaNySpH1/hAKRGl0hnEMHTPg=")
                return
            }
            let brGWSlPTRFXRWS = oMKd7qebhMlgH3bk.hL9dV3bQ2fK6sJ8p()
            print(brGWSlPTRFXRWS) //直接返回未转json得字符串
            if let dict = brGWSlPTRFXRWS.kPOR9FHwcEZJv9YDf4W01D(),
               let _ = dict["sRmN9z3L7rKPiPFgDt+DIg==".bFHEatcgE4zzU9TCfDonsu()] as? [String] {

                r7L9pCA = []
                m4L0puD8tjRnlYgpCJgN0PyGZ6BJhS = true
            }
        } else {
            QlzJ4yJcxJXY2paN.rmjXXUocPJY2DEcTxiziKU6Nehjz1q.m3nArFwdHhI82cPUmiqW8PtaaHz("9fZeXzm2b8JDi9URhrOPCQ==")
        }
    }
    
    
    func ib0Vb(_ agXbw79XYee1l3JCB9i1R: Ek9tKrgkM0Mjp) {
        if let pbk30JiMSdCeKQQNMPlS4 = idW6C0.firstIndex(where: { $0.id == agXbw79XYee1l3JCB9i1R.id }) {
            idW6C0.remove(at: pbk30JiMSdCeKQQNMPlS4)
        }
    }
    
    func qd4CJD6YFZdY7UoUUBW6uNHmFa(_ yewjeBJLoD39: UIImage) -> URL? {
        let k7iFzqykocUnZTCJSy5B = FileManager.default.temporaryDirectory
            .appendingPathComponent(UUID().uuidString + ".jpg")
        
        if let mMeFGEVECwJTRH0qH8I1 = yewjeBJLoD39.jpegData(compressionQuality: 0.8) {
            try? mMeFGEVECwJTRH0qH8I1.write(to: k7iFzqykocUnZTCJSy5B)
            return k7iFzqykocUnZTCJSy5B
        }
        return nil
    }
    
    func x9YpexQkLx7IBeY36LSDzGLtaXYlu(l7Y3OLB89tr0moPNKkF: UUID, kNn2ivCsDXkpVtyDNltRMIV: UIImage) {
        guard let vhze1dYHmg1QhV0X8G5c = qd4CJD6YFZdY7UoUUBW6uNHmFa(kNn2ivCsDXkpVtyDNltRMIV) else { return }
        
        let tPO1Ja = UUID().uuidString + ".jpg"
        
        IsZTtO2FdO13EJk8A2xBPRHSqlJx
            .f6fKqLNtg0zFmWoa2M1VFlHkb42
            .nsBipVAxQ5Hqjj8tsx(
                e8O8OyDACdOvgo: vhze1dYHmg1QhV0X8G5c,
                u92JYYPz7kFgcQKDFB6: tPO1Ja,
                
                // ✅ 进度回调（直接驱动 ProgressView）
                p2gBE3NSqIq7: { yC9tSw2CasgPEwlOogPTKXmt in
                    if let tet37XiV4tmhYM7PT5uO0v43wUOLNhw = idW6C0.firstIndex(where: { $0.id == l7Y3OLB89tr0moPNKkF }) {
                        idW6C0[tet37XiV4tmhYM7PT5uO0v43wUOLNhw].ir1Yyu2 = yC9tSw2CasgPEwlOogPTKXmt
                    }
                },
                
                // ✅ 上传完成
                zC3Plk1KwcQrIoNrAUb4cM2OCESagi1M: { j9jGFoKH in
                    if let rHUEyelB0poK6roFgP5a = idW6C0.firstIndex(where: { $0.id == l7Y3OLB89tr0moPNKkF }) {
                        switch j9jGFoKH {
                        case .success(let kFhgWlnp6kxAN30F6Oi51Ol):
                            idW6C0[rHUEyelB0poK6roFgP5a].xQdU5oYzMdsaZX = false
                            idW6C0[rHUEyelB0poK6roFgP5a].ir1Yyu2 = 1
                            idW6C0[rHUEyelB0poK6roFgP5a].nVDMgVMWU = nil
                            idW6C0[rHUEyelB0poK6roFgP5a].g0HjS5Fukj = kFhgWlnp6kxAN30F6Oi51Ol
                            
                        case .failure:
                            idW6C0[rHUEyelB0poK6roFgP5a].xQdU5oYzMdsaZX = false
                        }
                    }
                }
            )
    }
    
    private func y2iUFXsgcFp0svlttakasX6wr7xCNH(for cMceP65BYWk: Ek9tKrgkM0Mjp) -> some Gesture {
        let g0zWcSMXESsLkEOTaMfRyNCcJ7nF = LongPressGesture(minimumDuration: 0.2)
            .onEnded { _ in
                // 长按就触发
                zA8sGnmSqlWskHATHEkOK215O()
            }
        
        let xSLtWE1 = DragGesture()
            .onChanged { uBBYJDIYZUOvzdXq0h in
                cFCN9v7xy0xUis3K3Ss = cMceP65BYWk
                poCajTQza0DvrQs1rz5Us8h6iY3mgF2 = idW6C0.firstIndex(of: cMceP65BYWk)
                pQFbkvCM = uBBYJDIYZUOvzdXq0h.translation
            }
            .onEnded { _ in
                zA8sGnmSqlWskHATHEkOK215O()
            }
        
        // 同时支持长按和拖动
        return SimultaneousGesture(g0zWcSMXESsLkEOTaMfRyNCcJ7nF, xSLtWE1)
    }
    
    private func zA8sGnmSqlWskHATHEkOK215O() {
        guard let sbFyTTW8NBo4YPT1GYRLDHFHyDtAGUNZ = cFCN9v7xy0xUis3K3Ss,
              let bYst9gAc9p9mVo2hVGHRv = poCajTQza0DvrQs1rz5Us8h6iY3mgF2 else { return }
        
        guard let lvjtJEhPJxUqLw4 = eetqrSRRm6atCHeh4bBxGa[sbFyTTW8NBo4YPT1GYRLDHFHyDtAGUNZ.id] else { return }
        let jtOXDdjH4l = CGPoint(
            x: lvjtJEhPJxUqLw4.midX + pQFbkvCM.width,
            y: lvjtJEhPJxUqLw4.midY + pQFbkvCM.height
        )
        
        if let cf0bAOPwQ = qpCccWFs9ZkklMdvUpJ5HZIyk(v7FqTjb71pxFqdz: jtOXDdjH4l, dAgCmVjuoPRNQ8HxUTY: sbFyTTW8NBo4YPT1GYRLDHFHyDtAGUNZ) {
            let oNLDFO = CGPoint(x: lvjtJEhPJxUqLw4.midX, y: lvjtJEhPJxUqLw4.midY)
            let oEtGdB55T2d = hypot(jtOXDdjH4l.x - oNLDFO.x, jtOXDdjH4l.y - oNLDFO.y)
            if oEtGdB55T2d >= p9xZ4tP491jUM7ZJFDT1MwT9jK && cf0bAOPwQ != bYst9gAc9p9mVo2hVGHRv {
                idW6C0.move(fromOffsets: IndexSet(integer: bYst9gAc9p9mVo2hVGHRv),
                            toOffset: cf0bAOPwQ > bYst9gAc9p9mVo2hVGHRv ? cf0bAOPwQ + 1 : cf0bAOPwQ)
            }
        }
        
        self.pQFbkvCM = .zero
        self.poCajTQza0DvrQs1rz5Us8h6iY3mgF2 = nil
        self.cFCN9v7xy0xUis3K3Ss = nil
    }
    
    private func qpCccWFs9ZkklMdvUpJ5HZIyk(v7FqTjb71pxFqdz hoo1an4XwqVDz54B657FeCmY: CGPoint, dAgCmVjuoPRNQ8HxUTY bYtti1ywHkYVe1DrFpTgPn4gg9qGAS: Ek9tKrgkM0Mjp) -> Int? {
        return idW6C0.enumerated()
            .filter { $0.element.id != bYtti1ywHkYVe1DrFpTgPn4gg9qGAS.id }
            .map { a82BFN, uzR2strVQSahuqVRb -> (Int, CGFloat) in
                guard let xSNCmrTLU2Zb3L1EKCqIZAqDaU6OWGH = eetqrSRRm6atCHeh4bBxGa[uzR2strVQSahuqVRb.id] else { return (a82BFN, .infinity) }
                let rrHZMkm = CGPoint(x: xSNCmrTLU2Zb3L1EKCqIZAqDaU6OWGH.midX, y: xSNCmrTLU2Zb3L1EKCqIZAqDaU6OWGH.midY)
                let toBr6QmuLe1h = hypot(hoo1an4XwqVDz54B657FeCmY.x - rrHZMkm.x, hoo1an4XwqVDz54B657FeCmY.y - rrHZMkm.y)
                return (a82BFN, toBr6QmuLe1h)
            }
            .min(by: { $0.1 < $1.1 })?.0
    }
}

//添加图标
struct tdBdcS7Dqc: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 34/255, green: 34/255, blue: 38/255))
            .frame(width: 167,height: 126)
            .overlay(alignment: .center) {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(
                            Color.white.opacity(0.4),
                            style: StrokeStyle(
                                lineWidth: 1,
                                lineCap: .round,
                                dash: [8, 6]
                            )
                        )
                    ZJ7h766mz(tMmEWWlfgUag: "yJv1l88NyCjeIR2yve6vkxIHscdO")
                        .frame(width: 16,height: 16)
                }
            }
    }
}

struct iJ7H9TAZRey3Jv: View {
    let eV0n003pf6t9f4Mn6tOJU16PSiSTR51: Ek9tKrgkM0Mjp
    
    var body: some View {
        if let bOOj5UHPuURBBvL3t = eV0n003pf6t9f4Mn6tOJU16PSiSTR51.nVDMgVMWU {
            Image(uiImage: bOOj5UHPuURBBvL3t)
                .resizable()
                .scaledToFill()
        } else if let k0gJXhzNxXLq = eV0n003pf6t9f4Mn6tOJU16PSiSTR51.g0HjS5Fukj {
            rP6kV1bS8qX3nT7(pR9wQ2mL6hY5dF1: k0gJXhzNxXLq)
        } else {
            Color.gray
        }
    }
}

//图片显示
struct wXWAaYKmLFbT1jAfqZ4KlTVAwpC: View {
    let nFBDXePJdd41Kp: Ek9tKrgkM0Mjp
    let yf0kruM5Ek5r8xR6zWPpgI: (Ek9tKrgkM0Mjp) -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Group {
                iJ7H9TAZRey3Jv(eV0n003pf6t9f4Mn6tOJU16PSiSTR51: nFBDXePJdd41Kp)
            }
            .frame(width: 167,height: 126)
            .clipped()
            .cornerRadius(8)
            .overlay {
                if nFBDXePJdd41Kp.xQdU5oYzMdsaZX {
                    fnCBC(rhONWXAZitFOFrwF: nFBDXePJdd41Kp.ir1Yyu2)
                }
            }
            
            // 删除按钮，只对网络图片显示
            if !nFBDXePJdd41Kp.xQdU5oYzMdsaZX {
                Button {
                    yf0kruM5Ek5r8xR6zWPpgI(nFBDXePJdd41Kp)
                } label: {
                    ZJ7h766mz(tMmEWWlfgUag: "pD8K1Q5tB6R9Lh")
                        .frame(width: 24,height: 24)
                        .padding(.all,4)
                }
                .padding(4)
            }
        }
    }
}

struct fnCBC: View {
    
    let rhONWXAZitFOFrwF: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.black.opacity(0.8))
            .overlay {
                VStack(spacing: 8) {
                    Text("\(Int(rhONWXAZitFOFrwF * 100))%")
                        .g0LIIcoZQsOjyND9(
                            size: 18,
                            weight: .black
                        )
                    awBXR5kXQAwoFHDM7TkRQiwc8w(qsswr1rQh3rcLGogNadPS: rhONWXAZitFOFrwF)
                }
            }
    }
}

struct awBXR5kXQAwoFHDM7TkRQiwc8w: View {
    
    let qsswr1rQh3rcLGogNadPS: Double
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 13)
                .fill(Color.white.opacity(0.2))
                .frame(width: 50, height: 5)
            
            RoundedRectangle(cornerRadius: 13)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 69/255, green: 247/255, blue: 81/255),
                            Color(red: 59/255, green: 193/255, blue: 1)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(width: 50 * qsswr1rQh3rcLGogNadPS, height: 5)
        }
    }
}


