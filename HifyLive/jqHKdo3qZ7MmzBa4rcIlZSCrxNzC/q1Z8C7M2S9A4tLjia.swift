import Foundation
import CommonCrypto

extension String {
    private static let uB8sQ2kL1mF4tR3 = "9986sdff5s4f1123" // Key
    private static let KxN7dV4oP9qL2rFh = "9986sdff5s4y456a" // IV

    //加密
    func tYwP1zF6sM8vR2kq(key: String? = nil, iv: String? = nil) -> String {
        let XnB3qW5lA0vC8kZ = (key ?? String.uB8sQ2kL1mF4tR3).data(using: .utf8)!
        let HrP6vD9sL1fJ3yM = (iv  ?? String.KxN7dV4oP9qL2rFh).data(using: .utf8)!
        guard let aZk1sL9qP8rT6vX = self.data(using: .utf8),
              let cNf7kV3dB2mL5wS = C1M4tLrCrypt(input: aZk1sL9qP8rT6vX, key: XnB3qW5lA0vC8kZ, iv: HrP6vD9sL1fJ3yM, operation: CCOperation(kCCEncrypt)) else {
            return ""
        }
        return cNf7kV3dB2mL5wS.mV4tR8kL1pZ2xQ6()
    }

    //解密
    func hL9dV3bQ2fK6sJ8p(key: String? = nil, iv: String? = nil) -> String {
        let XnB3qW5lA0vC8kZ = (key ?? String.uB8sQ2kL1mF4tR3).data(using: .utf8)!
        let HrP6vD9sL1fJ3yM = (iv  ?? String.KxN7dV4oP9qL2rFh).data(using: .utf8)!
        guard let aZk1sL9qP8rT6vX = Data(ZqX7vB2kL4mF9pS: self),
              let cNf7kV3dB2mL5wS = C1M4tLrCrypt(input: aZk1sL9qP8rT6vX, key: XnB3qW5lA0vC8kZ, iv: HrP6vD9sL1fJ3yM, operation: CCOperation(kCCDecrypt)) else {
            return ""
        }
        return String(data: cNf7kV3dB2mL5wS, encoding: .utf8) ?? ""
    }

    
    private func C1M4tLrCrypt(input: Data, key: Data, iv: Data, operation: CCOperation) -> Data? {
        let QwZ5rP8kL2vT1bS = key.count
        guard QwZ5rP8kL2vT1bS == kCCKeySizeAES128 ||
              QwZ5rP8kL2vT1bS == kCCKeySizeAES192 ||
              QwZ5rP8kL2vT1bS == kCCKeySizeAES256 else {
            return nil
        }

        let mB2vL9sT4kR1pX6 = input.count + kCCBlockSizeAES128
        var aL8dF5qK3bS9wZ1 = Data(count: mB2vL9sT4kR1pX6)
        var zV7sK2lN5pF3bD0: size_t = 0

        let sT8kV3bQ1pL4dN7 = aL8dF5qK3bS9wZ1.withUnsafeMutableBytes { outputBytes in
            input.withUnsafeBytes { inputBytes in
                iv.withUnsafeBytes { ivBytes in
                    key.withUnsafeBytes { keyBytes in
                        CCCrypt(
                            operation,
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            keyBytes.baseAddress,
                            QwZ5rP8kL2vT1bS,
                            ivBytes.baseAddress,
                            inputBytes.baseAddress,
                            input.count,
                            outputBytes.baseAddress,
                            mB2vL9sT4kR1pX6,
                            &zV7sK2lN5pF3bD0
                        )
                    }
                }
            }
        }

        guard sT8kV3bQ1pL4dN7 == kCCSuccess else { return nil }

        aL8dF5qK3bS9wZ1.removeSubrange(zV7sK2lN5pF3bD0..<aL8dF5qK3bS9wZ1.count)
        return aL8dF5qK3bS9wZ1
    }
}


extension Data {
    
    init?(ZqX7vB2kL4mF9pS hexString: String) {
        let Lp9vK2xM3dF1sT8 = hexString.count / 2
        var Rn4kB7sQ1pD6wZ = Data(capacity: Lp9vK2xM3dF1sT8)
        var index = hexString.startIndex
        for _ in 0..<Lp9vK2xM3dF1sT8 {
            let nextIndex = hexString.index(index, offsetBy: 2)
            guard nextIndex <= hexString.endIndex else { return nil }
            let bytes = hexString[index..<nextIndex]
            if let b = UInt8(bytes, radix: 16) {
                Rn4kB7sQ1pD6wZ.append(b)
            } else {
                return nil
            }
            index = nextIndex
        }
        self = Rn4kB7sQ1pD6wZ
    }

   
    func mV4tR8kL1pZ2xQ6() -> String {
        return self.map { String(format: "%02x", $0) }.joined()
    }
}
