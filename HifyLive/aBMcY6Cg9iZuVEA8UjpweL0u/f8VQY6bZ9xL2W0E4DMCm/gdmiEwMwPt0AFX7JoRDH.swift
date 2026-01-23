import AVFoundation
import SwiftUI

enum X98kMQZBnEcBC4XbCz08EsWBZ {
    case dwqlT9VmmEYYHwKn1NCjIsctGoXtH
    case pO0drvaRSE1Qh7GoSrrfJKcX2U
    case la3SfK
}

//检查相机权限
func uqGJG4SKfNUwvaccjK(
    zSlzWnpFf43phQQl: @escaping (X98kMQZBnEcBC4XbCz08EsWBZ) -> Void
) {
    let nyzpRipwnekcma9o8E6tk8 = AVCaptureDevice.authorizationStatus(for: .video)

    switch nyzpRipwnekcma9o8E6tk8 {
    case .authorized:
        zSlzWnpFf43phQQl(.dwqlT9VmmEYYHwKn1NCjIsctGoXtH)

    case .notDetermined:
        AVCaptureDevice.requestAccess(for: .video) { abm77PxMYGWCVLc9354fNM2BZ4cYMe in
            DispatchQueue.main.async {
                zSlzWnpFf43phQQl(abm77PxMYGWCVLc9354fNM2BZ4cYMe ? .dwqlT9VmmEYYHwKn1NCjIsctGoXtH : .la3SfK)
            }
        }

    case .denied, .restricted:
        zSlzWnpFf43phQQl(.la3SfK)

    @unknown default:
        zSlzWnpFf43phQQl(.la3SfK)
    }
}

//编辑头像页面
struct WkdtHh8GoDUvyeJVeOx4z: View {

    @Binding var lTVefSlXPmO: UIImage?
    let ymiTLnjCgoLsDs8h2GuCiFd9DAjbQdKK: () -> Void
    let wzMbhm9JrwdWtpn5S7: (UIImage) -> Void

    // MARK: - 状态
    @State private var yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0: CGFloat = 1.0
    @State private var dnNrvT5fIeMLMygRTGwz: CGSize = .zero
    @State private var qA84JssSqHF: CGFloat = 1.0
    @State private var z25idy6xGsUoO5TUAvYX1wNVu0r: CGSize = .zero
    @State private var gB48FUUXvbErorkH0KEVxU0D2K2XMy6: Angle = .zero  // 按钮旋转

    // 历史记录
    @State private var uXCCSxd: [(rotation: Angle, scale: CGFloat, offset: CGSize)] = []

    let tSAedodKr7f: CGFloat = 191
    private var c1sXx9CBh3uZVSZ: Bool { uXCCSxd.count > 1 }

    var body: some View {
        GeometryReader { iJ1TsOx5FdeJnPN7U63Vn in
            let m96KM = iJ1TsOx5FdeJnPN7U63Vn.size

            ZStack {
                Color.black.ignoresSafeArea()

                if let syFRzBrM68Ij = lTVefSlXPmO {
                    Image(uiImage: syFRzBrM68Ij)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0 * qA84JssSqHF)
                        .rotationEffect(gB48FUUXvbErorkH0KEVxU0D2K2XMy6)
                        .offset(x: dnNrvT5fIeMLMygRTGwz.width + z25idy6xGsUoO5TUAvYX1wNVu0r.width,
                                y: dnNrvT5fIeMLMygRTGwz.height + z25idy6xGsUoO5TUAvYX1wNVu0r.height)
                        .gesture(yzW9ygLTXAsbTNw02BYqAI8kkrEP(for: syFRzBrM68Ij, xHFlsHj1VYFks4OnmNQuId: m96KM))
                        .clipped()
                        .animation(.easeInOut(duration: 0.1), value: yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0)
                        .animation(.easeInOut(duration: 0.1), value: dnNrvT5fIeMLMygRTGwz)
                }

                // 圆形蒙版
                Color.black.opacity(0.6)
                    .mask(
                        Rectangle()
                            .overlay(
                                Circle()
                                    .frame(width: tSAedodKr7f, height: tSAedodKr7f)
                                    .blendMode(.destinationOut)
                            )
                    )
                    .ignoresSafeArea()
                    .allowsHitTesting(false)

                // 边框圆
                Circle()
                    .stroke(Color.white.opacity(0.4), lineWidth: 1)
                    .frame(width: tSAedodKr7f, height: tSAedodKr7f)
                    .allowsHitTesting(false)

                // 底部按钮
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Button {
                            ymiTLnjCgoLsDs8h2GuCiFd9DAjbQdKK()
                        } label: {
                            Text("ughEnrHH8idFaI0NbZK2QA==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .medium
                                )
                        }
                        
                        Spacer()

                        // 旋转按钮
                        Button(action: {
                            let soAbq3s3K0GA0KoKkEqYMye8xiBElhAE = Angle.degrees(-90)

                            // 计算旋转前偏移
                            let xAB3wRDy68 = dnNrvT5fIeMLMygRTGwz.width
                            let b7tox = dnNrvT5fIeMLMygRTGwz.height

                            // 用旋转矩阵计算旋转后的偏移
                            let frf6nuo9toM0EqBxPX = CGFloat(soAbq3s3K0GA0KoKkEqYMye8xiBElhAE.radians)
                            let iEsOGB41ZPFE8tJ9uWv8rbmZ2ZNA = xAB3wRDy68 * cos(frf6nuo9toM0EqBxPX) - b7tox * sin(frf6nuo9toM0EqBxPX)
                            let ukgjibWRtt075 = xAB3wRDy68 * sin(frf6nuo9toM0EqBxPX) + b7tox * cos(frf6nuo9toM0EqBxPX)

                            dnNrvT5fIeMLMygRTGwz = CGSize(width: iEsOGB41ZPFE8tJ9uWv8rbmZ2ZNA, height: ukgjibWRtt075)
                            
                            // 图片旋转角度累加
                            gB48FUUXvbErorkH0KEVxU0D2K2XMy6 += gB48FUUXvbErorkH0KEVxU0D2K2XMy6

                            b35nUF0gkODUIUiTYKYjE4LcqS()
                        }) {
                           ZJ7h766mz(tMmEWWlfgUag: "rJ70duUaTUgT5fJrCUIgs0frA0i2X")
                                .frame(width: 32, height: 32)
                        }
                        
                        Spacer()

                        // 撤销
                        Button(action: hwIz7AhZhyTWi8YfNweNHT4oLXS5) {
                            ZJ7h766mz(tMmEWWlfgUag: c1sXx9CBh3uZVSZ ? "iPvh3MuJa7" : "liszTV")
                                .frame(width: 32,height: 32)
                        }
                        .disabled(!c1sXx9CBh3uZVSZ)
                        
                        Spacer()
                        
                        // 确认裁剪
                        Button {
                            if let co7VHPKYAbzfBtbehOjPSc = lTVefSlXPmO {
                                // 计算显示尺寸
                                let pT1ZIqK1C5EeSau = UIScreen.main.bounds.size
                                let sEGvJVwHr0kGFDA7U9xBtRZcZsVnL4sn = co7VHPKYAbzfBtbehOjPSc.size.width / co7VHPKYAbzfBtbehOjPSc.size.height
                                let dzaK1EJon53Rg8Qp8aAYWM2FHlEARxDD = pT1ZIqK1C5EeSau.width / pT1ZIqK1C5EeSau.height
                                var norsWJq0: CGSize

                                if sEGvJVwHr0kGFDA7U9xBtRZcZsVnL4sn > dzaK1EJon53Rg8Qp8aAYWM2FHlEARxDD {
                                    norsWJq0 = CGSize(width: pT1ZIqK1C5EeSau.width, height: pT1ZIqK1C5EeSau.width / sEGvJVwHr0kGFDA7U9xBtRZcZsVnL4sn)
                                } else {
                                    norsWJq0 = CGSize(width: pT1ZIqK1C5EeSau.height * sEGvJVwHr0kGFDA7U9xBtRZcZsVnL4sn, height: pT1ZIqK1C5EeSau.height)
                                }

                                let dLYa4KbYDr538IpTAE7qX = uzTv8JZcWr5QhSJF2gYLXSoMOUvU(
                                    nOHHaYUr7Tl7S3YAj: co7VHPKYAbzfBtbehOjPSc,
                                    vLuVW9RnDLRnv1TEKibhuBgxvQe: norsWJq0,
                                    ifNwHxsVRqSrZpxopOAgwzPH: tSAedodKr7f,
                                    yNqkds6Ljf5hSEM4ZwM2a6onzBltCXd: yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0,
                                    tVd1cuh5iLkWIubuHoS9p8bqGc4T: dnNrvT5fIeMLMygRTGwz,
                                    cTsITRcQMVHpS2fCuvuUCgp: gB48FUUXvbErorkH0KEVxU0D2K2XMy6
                                )
                                wzMbhm9JrwdWtpn5S7(dLYa4KbYDr538IpTAE7qX)
                            }
                        } label: {
                            Text("OsfHVPPKKXIHMyiwPxWJ2g==".bFHEatcgE4zzU9TCfDonsu())
                                .g0LIIcoZQsOjyND9(
                                    size: 16,
                                    weight: .medium,
                                    color: Color(red: 23/255, green: 220/255, blue: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 49)
                    .padding(.top, 12)
                    .background(Color(red: 20/255, green: 19/255, blue: 19/255, opacity: 0.15))
                }
            }
            .onAppear {
                // 压入初始状态
                if uXCCSxd.isEmpty {
                    uXCCSxd.append((rotation: gB48FUUXvbErorkH0KEVxU0D2K2XMy6, scale: yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0, offset: dnNrvT5fIeMLMygRTGwz))
                }
            }
        }
    }

    // MARK: - 手势组合
    private func yzW9ygLTXAsbTNw02BYqAI8kkrEP(for fDHZomByJ7jn7Hk8mttZ6IvVxHGDrn0q: UIImage, xHFlsHj1VYFks4OnmNQuId: CGSize) -> some Gesture {
        let fnJzRVDyzJnr5Dnwj0Nu = MagnificationGesture()
            .onChanged { yqfZXUlkEF6GbAtC6nGQ in
                qA84JssSqHF = yqfZXUlkEF6GbAtC6nGQ
            }
            .onEnded { _ in
                yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0 = (yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0 * qA84JssSqHF).clamped(to: 0.5...3)
                qA84JssSqHF = 1
                b35nUF0gkODUIUiTYKYjE4LcqS()
                dnNrvT5fIeMLMygRTGwz = hKEiAvAhT9wqe3WeY9kDBPAe(t0givBPiFFlBgi: dnNrvT5fIeMLMygRTGwz, zSNmfhxVl0: yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0, rGMUUrcVFrVyVT3: fDHZomByJ7jn7Hk8mttZ6IvVxHGDrn0q, b2INmALO10Xpig7MR0ya: xHFlsHj1VYFks4OnmNQuId)
            }

        let tT5BIkNnJ3eHlg6rx6DM = DragGesture()
            .onChanged { s9NwqOliY in
                z25idy6xGsUoO5TUAvYX1wNVu0r = s9NwqOliY.translation
                let zqRDceFokxYQ7wRDHSoe3d69 = dnNrvT5fIeMLMygRTGwz + z25idy6xGsUoO5TUAvYX1wNVu0r
                z25idy6xGsUoO5TUAvYX1wNVu0r = hKEiAvAhT9wqe3WeY9kDBPAe(t0givBPiFFlBgi: zqRDceFokxYQ7wRDHSoe3d69, zSNmfhxVl0: yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0, rGMUUrcVFrVyVT3: fDHZomByJ7jn7Hk8mttZ6IvVxHGDrn0q, b2INmALO10Xpig7MR0ya: xHFlsHj1VYFks4OnmNQuId) - dnNrvT5fIeMLMygRTGwz
            }
            .onEnded { _ in
                dnNrvT5fIeMLMygRTGwz = dnNrvT5fIeMLMygRTGwz + z25idy6xGsUoO5TUAvYX1wNVu0r
                z25idy6xGsUoO5TUAvYX1wNVu0r = .zero
                b35nUF0gkODUIUiTYKYjE4LcqS()
            }

        return SimultaneousGesture(fnJzRVDyzJnr5Dnwj0Nu, tT5BIkNnJ3eHlg6rx6DM)
    }

    // MARK: - 历史操作
    private func b35nUF0gkODUIUiTYKYjE4LcqS() {
        // 保存当前状态
        uXCCSxd.append((rotation: gB48FUUXvbErorkH0KEVxU0D2K2XMy6, scale: yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0, offset: dnNrvT5fIeMLMygRTGwz))
    }

    private func hwIz7AhZhyTWi8YfNweNHT4oLXS5() {
        guard uXCCSxd.count > 1 else { return }
        
        // 弹出当前状态
        _ = uXCCSxd.popLast()
        
        // 获取上一个状态
        if let fJtUBZgJ4r9 = uXCCSxd.last {
            gB48FUUXvbErorkH0KEVxU0D2K2XMy6 = fJtUBZgJ4r9.rotation
            yBxKkOoR4zjnFQ3AYiB1I32JM4ydoZ0 = fJtUBZgJ4r9.scale
            dnNrvT5fIeMLMygRTGwz = fJtUBZgJ4r9.offset
        }
    }

    // MARK: - 限制偏移
    private func hKEiAvAhT9wqe3WeY9kDBPAe(t0givBPiFFlBgi: CGSize, zSNmfhxVl0: CGFloat, rGMUUrcVFrVyVT3: UIImage, b2INmALO10Xpig7MR0ya: CGSize) -> CGSize {
        let pebZqZjBJG2m86n5 = rGMUUrcVFrVyVT3.size.width / rGMUUrcVFrVyVT3.size.height
        let iJuDIYSViSF4IQh9fkDs9vDR6EZ = b2INmALO10Xpig7MR0ya.width / b2INmALO10Xpig7MR0ya.height
        var kPfYRcG67smT9BGm4QoNkZjRtrf: CGFloat
        var bZ2V94qowS7dKhixzZupt: CGFloat

        if pebZqZjBJG2m86n5 > iJuDIYSViSF4IQh9fkDs9vDR6EZ {
            kPfYRcG67smT9BGm4QoNkZjRtrf = b2INmALO10Xpig7MR0ya.width * zSNmfhxVl0
            bZ2V94qowS7dKhixzZupt = b2INmALO10Xpig7MR0ya.width / pebZqZjBJG2m86n5 * zSNmfhxVl0
        } else {
            kPfYRcG67smT9BGm4QoNkZjRtrf = b2INmALO10Xpig7MR0ya.height * pebZqZjBJG2m86n5 * zSNmfhxVl0
            bZ2V94qowS7dKhixzZupt = b2INmALO10Xpig7MR0ya.height * zSNmfhxVl0
        }

        let dK39teZcQkUW = max((kPfYRcG67smT9BGm4QoNkZjRtrf - tSAedodKr7f) / 2, 0)
        let sWwAg = max((bZ2V94qowS7dKhixzZupt - tSAedodKr7f) / 2, 0)

        let jfsgJpbCp9ds3gbt = min(max(t0givBPiFFlBgi.width, -dK39teZcQkUW), dK39teZcQkUW)
        let up1ElRZ2VnR0dqoT9nIBvAL7UgjE = min(max(t0givBPiFFlBgi.height, -sWwAg), sWwAg)
        return CGSize(width: jfsgJpbCp9ds3gbt, height: up1ElRZ2VnR0dqoT9nIBvAL7UgjE)
    }

    // MARK: - 裁剪
    private func uzTv8JZcWr5QhSJF2gYLXSoMOUvU(nOHHaYUr7Tl7S3YAj: UIImage, vLuVW9RnDLRnv1TEKibhuBgxvQe: CGSize, ifNwHxsVRqSrZpxopOAgwzPH: CGFloat, yNqkds6Ljf5hSEM4ZwM2a6onzBltCXd: CGFloat, tVd1cuh5iLkWIubuHoS9p8bqGc4T: CGSize, cTsITRcQMVHpS2fCuvuUCgp: Angle) -> UIImage {
        let b9JZEPbsD6aRkrcDZIrH0o7b2C = UIGraphicsImageRenderer(size: CGSize(width: ifNwHxsVRqSrZpxopOAgwzPH, height: ifNwHxsVRqSrZpxopOAgwzPH))

        return b9JZEPbsD6aRkrcDZIrH0o7b2C.image { f4MYWS40zxpw5n in
            let sNTPKP7nwP = f4MYWS40zxpw5n.cgContext

            // 移动裁剪中心到正中
            sNTPKP7nwP.translateBy(x: ifNwHxsVRqSrZpxopOAgwzPH / 2, y: ifNwHxsVRqSrZpxopOAgwzPH / 2)
            sNTPKP7nwP.rotate(by: CGFloat(cTsITRcQMVHpS2fCuvuUCgp.radians))

            // 计算图片绘制矩形
            let x5slX6t3C7ttvKFDr1ppJbQcdzY8 = vLuVW9RnDLRnv1TEKibhuBgxvQe.width * yNqkds6Ljf5hSEM4ZwM2a6onzBltCXd
            let ylhyTXubL2EhQxoQbalT30GHZSZ9BAbH = vLuVW9RnDLRnv1TEKibhuBgxvQe.height * yNqkds6Ljf5hSEM4ZwM2a6onzBltCXd
            let m7vQDjxtyoZMjiLnCkcm = CGRect(
                x: -x5slX6t3C7ttvKFDr1ppJbQcdzY8 / 2 + tVd1cuh5iLkWIubuHoS9p8bqGc4T.width,
                y: -ylhyTXubL2EhQxoQbalT30GHZSZ9BAbH / 2 + tVd1cuh5iLkWIubuHoS9p8bqGc4T.height,
                width: x5slX6t3C7ttvKFDr1ppJbQcdzY8,
                height: ylhyTXubL2EhQxoQbalT30GHZSZ9BAbH
            )

            // **方形裁剪**：只裁剪显示在圆形框里的区域，但输出矩形
            // 注意：这里不用 ctx.addEllipse，不做圆形裁剪
            sNTPKP7nwP.addRect(CGRect(x: -ifNwHxsVRqSrZpxopOAgwzPH / 2, y: -ifNwHxsVRqSrZpxopOAgwzPH / 2, width: ifNwHxsVRqSrZpxopOAgwzPH, height: ifNwHxsVRqSrZpxopOAgwzPH))
            sNTPKP7nwP.clip()

            nOHHaYUr7Tl7S3YAj.draw(in: m7vQDjxtyoZMjiLnCkcm)
        }
    }
}

fileprivate func + (lhs: CGSize, rhs: CGSize) -> CGSize {
    CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
}

fileprivate func - (lhs: CGSize, rhs: CGSize) -> CGSize {
    CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
}

fileprivate extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
}

struct RIZK0qmwl0ZtOq0G9nRElyU9m: UIViewControllerRepresentable {

    /// 拍照完成回调
    var i2eKV3p: (UIImage) -> Void

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let iGqzz2xyvoiHMsoJxbbMc8gX = UIImagePickerController()
        iGqzz2xyvoiHMsoJxbbMc8gX.sourceType = .camera
        iGqzz2xyvoiHMsoJxbbMc8gX.cameraDevice = .front          // ✅ 默认前置
        iGqzz2xyvoiHMsoJxbbMc8gX.allowsEditing = false
        iGqzz2xyvoiHMsoJxbbMc8gX.delegate = context.coordinator
        return iGqzz2xyvoiHMsoJxbbMc8gX
    }

    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: Context
    ) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // MARK: - Coordinator
    final class Coordinator: NSObject,
                              UINavigationControllerDelegate,
                              UIImagePickerControllerDelegate {

        let parent: RIZK0qmwl0ZtOq0G9nRElyU9m

        init(_ parent: RIZK0qmwl0ZtOq0G9nRElyU9m) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
        ) {
            if let image = info[.originalImage] as? UIImage {
                parent.i2eKV3p(image)
            }
//            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(
            _ picker: UIImagePickerController
        ) {
            picker.dismiss(animated: true)
        }
    }
}
