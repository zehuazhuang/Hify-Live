import SwiftUI
import SwiftfulRouting
import PhotosUI

struct Ek9tKrgkM0Mjp: Identifiable {
    let id = UUID()
    var nVDMgVMWU: UIImage? = nil
    var g0HjS5Fukj: String?
    var ir1Yyu2: Double = 0.0 // 0 = 未上传, 1 = 上传完成
    var xQdU5oYzMdsaZX: Bool = false
}

//个人相册修改
struct o95HINW4DpHIAT: View {
    
    @Environment(\.router) var cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb
    
    @State private var idW6C0: [Ek9tKrgkM0Mjp] = []
    
    @State private var mjRYExqGqlfs5RlPB5FQ1oGd = false
    @State private var iCBiZ: PhotosPickerItem? = nil
    
    @StateObject private var cDiXG5 = QENQQv2IjxH1iAGP2CGqvtrE.ozXOqc5p9qIHuoxi8KS
    
    // 拖拽状态
    @State private var draggingItem: Ek9tKrgkM0Mjp?
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            Color(red: 13/255, green: 13/255, blue: 18/255)
            VStack(spacing: 5) {
                HStack(spacing: 0, content: {
                    HStack(spacing: 12) {
                        Button{
                            cqlCsCXaHVqzSjXckqfrt0b0m2rxcIb.dismissScreen()
                        } label: {
                            ZJ7h766mz(tMmEWWlfgUag: "mHNiF9OWVl")
                                .frame(width: 24,height: 24)
                        }
                        Text("U97zV4ZU8kHR5otCSWwn0o0g6sGI4EYL0c15j3pbF2A=".bFHEatcgE4zzU9TCfDonsu())
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: .semibold
                            )
                    }
                    Spacer()
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
                            Text("hZ5+j3VKZ8mtaGSA5ogSvw==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    weight: .medium
                                )
                        }
                })
                .padding(.top,58)
                .padding(.horizontal,16)
                HStack(spacing: 0) {
                    Text("FEAR8GvovJA5jcxMaK0lDplVMLzQ45sxPiU8eV7b2UuUbebYKDoGeS348FA7zHc6".bFHEatcgE4zzU9TCfDonsu())
                        .g0LIIcoZQsOjyND9(
                            color: Color.white.opacity(0.4)
                        )
                    Spacer()
                }
                .padding(.horizontal,16)
                ScrollView {
                    let ekG0gcc6kk = [
                        GridItem(.flexible(), spacing: 9),
                        GridItem(.flexible(), spacing: 9)
                    ]
                    
                    let qk0hcht9sZAQlbyhoX = idW6C0.count < 8
                    let fA9HmQ = qk0hcht9sZAQlbyhoX ? idW6C0.count + 1 : idW6C0.count
                    
                    // LazyVGrid(columns: ekG0gcc6kk, spacing: 12) {
                    //     ForEach(0..<fA9HmQ, id: \.self) { l1wrNqr1HhB in
                            
                    //         // ➕ 添加按钮
                    //         if qk0hcht9sZAQlbyhoX && l1wrNqr1HhB == 0 {
                    //             Button {
                    //                 mjRYExqGqlfs5RlPB5FQ1oGd = true
                    //             } label: {
                    //                 tdBdcS7Dqc()
                    //             }
                    //         }
                    //         // 📷 相册项
                    //         else {
                    //             let fPhLc3CChxKGm5YwPYribUxkEOvZA = qk0hcht9sZAQlbyhoX ? l1wrNqr1HhB - 1 : l1wrNqr1HhB
                    //             let dRImlur = idW6C0[fPhLc3CChxKGm5YwPYribUxkEOvZA]
                                
                    //             wXWAaYKmLFbT1jAfqZ4KlTVAwpC(
                    //                 nFBDXePJdd41Kp: dRImlur
                    //             ) { ktpDsayc0tkak in
                    //                 ib0Vb(ktpDsayc0tkak)
                    //             }
                    //             .opacity(draggingItem?.id == dRImlur.id ? 0.7 : 1)
                    //             .position(draggingItem?.id == dRImlur.id ?
                    //                       CGPoint(x: dragStartLocation.x + dragOffset.width,
                    //                               y: dragStartLocation.y + dragOffset.height)
                    //                       : nil)
                    //             .gesture(
                    //                 LongPressGesture(minimumDuration: 0.3)
                    //                     .onEnded { _ in
                    //                         draggingItem = dRImlur
                    //                         if let idx = idW6C0.firstIndex(of: dRImlur) {
                    //                             let row = idx / 2
                    //                             let col = idx % 2
                    //                             dragStartLocation = CGPoint(x: CGFloat(col) * 135 + 63,
                    //                                                         y: CGFloat(row) * 138 + 63)
                    //                         }
                    //                     }
                    //                     .simultaneously(with:
                    //                         DragGesture()
                    //                             .onChanged { value in
                    //                                 guard draggingItem?.id == dRImlur.id else { return }
                    //                                 dragOffset = value.translation
                                                    
                    //                                 // 判断是否需要交换
                    //                                 if let fromIndex = idW6C0.firstIndex(of: dRImlur) {
                    //                                     for (toIndex, otherItem) in idW6C0.enumerated() {
                    //                                         guard otherItem.id != dRImlur.id else { continue }
                    //                                         let otherRow = toIndex / 2
                    //                                         let otherCol = toIndex % 2
                    //                                         let otherCenter = CGPoint(x: CGFloat(otherCol) * 135 + 63,
                    //                                                                   y: CGFloat(otherRow) * 138 + 63)
                    //                                         let dragCenter = CGPoint(x: dragStartLocation.x + dragOffset.width,
                    //                                                                  y: dragStartLocation.y + dragOffset.height)
                                                            
                    //                                         if hypot(dragCenter.x - otherCenter.x, dragCenter.y - otherCenter.y) < 63 {
                    //                                             withAnimation {
                    //                                                 idW6C0.move(fromOffsets: IndexSet(integer: fromIndex),
                    //                                                                 toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
                    //                                                 dragStartLocation = otherCenter
                    //                                             }
                    //                                             break
                    //                                         }
                    //                                     }
                    //                                 }
                    //                             }
                    //                             .onEnded { _ in
                    //                                 draggingItem = nil
                    //                                 dragOffset = .zero
                    //                             }
                    //                     )
                    //             )
                    //         }
                    //     }
                    // }
//                    .padding(.top,14)
//                    .padding(.horizontal,16)
//                    .padding(.bottom,30)
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            if let o7pNaLrxha = QENQQv2IjxH1iAGP2CGqvtrE.ozXOqc5p9qIHuoxi8KS.kShXkzdT0LdNQr7PMBLU["yz0sixGzozcHcCcfNkfJkg==".bFHEatcgE4zzU9TCfDonsu()] as? [String]  {
                idW6C0 = o7pNaLrxha.map({ kbMdtvfyvlqgAeAVR6mMtBZSQp8279 in
                    Ek9tKrgkM0Mjp(nVDMgVMWU: nil, g0HjS5Fukj: kbMdtvfyvlqgAeAVR6mMtBZSQp8279,xQdU5oYzMdsaZX: false)
                })
            } else {
                idW6C0 = []
            }
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
}

//添加图标
struct tdBdcS7Dqc: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color(red: 34/255, green: 34/255, blue: 38/255))
            .frame(height: 126)
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
            .frame(height: 126)
            .clipped()
            .cornerRadius(8)
            .overlay {
                if nFBDXePJdd41Kp.xQdU5oYzMdsaZX {
                    fnCBC(rhONWXAZitFOFrwF: nFBDXePJdd41Kp.ir1Yyu2)
                }
            }
            
            // 删除按钮，只对网络图片显示
            if nFBDXePJdd41Kp.g0HjS5Fukj != nil {
                Button {
                    yf0kruM5Ek5r8xR6zWPpgI(nFBDXePJdd41Kp)
                } label: {
                    ZJ7h766mz(tMmEWWlfgUag: "x7mVKdhqttJqvt5UTZbsvzaHN4vsAO")
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
                        .font(.system(size: 18, weight: .black))
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

#Preview {
    o95HINW4DpHIAT()
}
