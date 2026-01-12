import Foundation
import CommonCrypto

extension String {
    /// AES-CBC Base64 解密（等价 Dart encrypt）
    func bFHEatcgE4zzU9TCfDonsu() -> String {
        guard !isEmpty else { return "" }

        guard
            let itW4f6TNETYB = Data(base64Encoded: self),
            let ee5UMSQXkXVT = "u1xyQWXgYVbUaxUs".data(using: .utf8), // 16 bytes
            let mA6hWS2pNCW  = "r5eLeEPfNIwGIYxI".data(using: .utf8)  // 16 bytes
        else {
            return ""
        }

        guard let zeOytbwSEemoTRTsNeQ56871rzUpe2q1 = kH89V72KTio4rRVTjESJtdZphmef7(
            y7tC9tmMhHniHCCaL7jx3agFcHzxis: itW4f6TNETYB,
            rCUlD1ORZE9elC3wG2tUK8S: ee5UMSQXkXVT,
            wudWykG: mA6hWS2pNCW
        ) else {
            return ""
        }

        return String(data: zeOytbwSEemoTRTsNeQ56871rzUpe2q1, encoding: .utf8) ?? ""
    }

    private func kH89V72KTio4rRVTjESJtdZphmef7(
        y7tC9tmMhHniHCCaL7jx3agFcHzxis: Data,
        rCUlD1ORZE9elC3wG2tUK8S: Data,
        wudWykG: Data
    ) -> Data? {

        let m7rso = rCUlD1ORZE9elC3wG2tUK8S.count
        guard m7rso == kCCKeySizeAES128 ||
                m7rso == kCCKeySizeAES192 ||
                m7rso == kCCKeySizeAES256 else {
            return nil
        }

        var wERPWwlN: size_t = 0

        // ⭐ 关键：提前算好长度
        let hbLuCVvL899e = y7tC9tmMhHniHCCaL7jx3agFcHzxis.count + kCCBlockSizeAES128
        var jyDPT9JfzNquNofIzBzOD7c5U = Data(count: hbLuCVvL899e)

        let qLv5oOMipLXEoiXdt2ztW6DyY: CCCryptorStatus = jyDPT9JfzNquNofIzBzOD7c5U.withUnsafeMutableBytes { yMtLVww1vYz6ymfS in
            y7tC9tmMhHniHCCaL7jx3agFcHzxis.withUnsafeBytes { zznt1l0TJOJdR7YNb1mkj in
                wudWykG.withUnsafeBytes { r8P5DnzWk2Ds in
                    rCUlD1ORZE9elC3wG2tUK8S.withUnsafeBytes { xDhvKkrdQK36qcROIWW1JCUW in
                        CCCrypt(
                            CCOperation(kCCDecrypt),
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            xDhvKkrdQK36qcROIWW1JCUW.baseAddress,
                            m7rso,
                            r8P5DnzWk2Ds.baseAddress,
                            zznt1l0TJOJdR7YNb1mkj.baseAddress,
                            y7tC9tmMhHniHCCaL7jx3agFcHzxis.count,
                            yMtLVww1vYz6ymfS.baseAddress,
                            hbLuCVvL899e,   // ⭐ 不再引用 output
                            &wERPWwlN
                        )
                    }
                }
            }
        }

        guard qLv5oOMipLXEoiXdt2ztW6DyY == kCCSuccess else {
            return nil
        }

        jyDPT9JfzNquNofIzBzOD7c5U.removeSubrange(wERPWwlN..<jyDPT9JfzNquNofIzBzOD7c5U.count)
        return jyDPT9JfzNquNofIzBzOD7c5U
    }
}
