import Foundation
import Combine
import Gzip

// 国家列表管理
final class UfmQhHA1doHKs: ObservableObject {
    static let bHNA2Amheuq0 = UfmQhHA1doHKs()
    private init() {}
    
    // 保存接口数据的内存变量
    @Published var o6Ex5Lgp7q46dDOd3db: [[String: Any]]? = nil
    
    // MARK: - 拉取接口数据
    func e3lm29iotZr1P6CsH() {
//        WOKmjUjM.dq0JZ94RcmDb3.zhuqPvhpwoDjs(
//            tk5afnKIwTiQL5Ai79O0AnK3f5G: "yTF9srxO9iM6Xra0cN27rq5WFVXh1cXklvTGwnsgpzI=".bFHEatcgE4zzU9TCfDonsu(),// /api/auth/getCountry
//            b3q0LlCSk: [String: String](),
//            vz8mIZ: { (tXxufOd2WBoomP: Result<JUsmLn3i59tKLD7RL294I0nAG, Error>) in
//                switch tXxufOd2WBoomP {
//                case .success(let dCFe3z7l6L):
//                 
//                  
//                    if dCFe3z7l6L.code == "ZFEsEWiI1qFkYs8V4dAooA==".bFHEatcgE4zzU9TCfDonsu() {
//                        guard let wCIWg0zdgKOcPtHLH5kFxK5uaHu = dCFe3z7l6L.result, !wCIWg0zdgKOcPtHLH5kFxK5uaHu.isEmpty else { return }
//                      
//                        // 1️⃣ 解密
//                        let d0yTWS99AFDuIeihRG0EbESdFlKGB = wCIWg0zdgKOcPtHLH5kFxK5uaHu.hL9dV3bQ2fK6sJ8p()
//                        
//                        // 2️⃣ 清理 Base64
//                        var zkeMpyoGeryoQLCSnpq0X = d0yTWS99AFDuIeihRG0EbESdFlKGB
//                            .replacingOccurrences(of: "\n", with: "")
//                            .replacingOccurrences(of: "\r", with: "")
//                            .replacingOccurrences(of: " ", with: "")
//                            .filter { "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=".contains($0) }
//                        
//                        // 3️⃣ 补齐 Base64
//                        while zkeMpyoGeryoQLCSnpq0X.count % 4 != 0 {
//                            zkeMpyoGeryoQLCSnpq0X += "="
//                        }
//                        
//
//                    }
//                case .failure(let lrc2DAIlr3lyl7YcXi):
//                    print(lrc2DAIlr3lyl7YcXi)
//                }
//            }
//        )
        
        let pYXkww6qrF = "H4sIAAAAAAAAAI1b3VIbRxZ+lSlfJVVOHmDvlEESQhpZYQSO2dqLltSW2oymSc8MRGzleh9j74jAAoOIYgGJfbEvxCNsD8LSOf21t/bCqZjMobvPOd/P6Zn8/Z8v5Fi/Uy/+9uLx3//6zf45f/HyhUzt338Q6TARA5mN7E8S3ReJLH+69eLXlxB0sQ6SyVAVYxZR9UW8X0cU5lClIqiJTLOwmi9stglLhsIowULqvpCzdYjOUiUCkQ6CbWlO5VAf24XZL6j4fsFvm4yYnhjojIX84Ib8SU/3WiSJyp7WrBV5wZd77T3izZfYWKg0D+yi+Ugmcjxhy7Z8ofNNGcy4GPCzRb6I23WEKVKpWEDbF/D7JpuJOnby/8oXcblJ38jYI7GIbV/EFemNIh3wXTV8ER82B0+dFXZ8z9+tnx8VueABXTfgA83sjhgL1WfH3vFm9mGTqOJY5kEjS2wXsJX2fXF/buLy7EQ4Dfra123LTceMNe+w2LfEH5slUqGMfBmsWq1aZLnIVbHq11j0RMAW/9H3yz5uOkicqoQF7PoClqQfbDI5mmC/Hyi77EiTSYaDHS+5fCJ0JEzBl3jji/hMItSpZAEHbsBH++f+S8BukWUcBrt7voB1XXdtUTk0d6GqH1lVpek5K0Ca7ihxdNVYm+9aMsvZQbrAGR9pcnf/c16kSjMw7EJ67ygYupa7xxZxmYOhLiDijoK0K96pQwwCpH6kfLOrxyJ10gB8Uy5zvV5GH9ryF2yNphsxo6WpFyqV4rsfVJbxuDpUaEZ7oF4IJnl16IAZJR37eC7HImGHqQPvzFgT6CIfBXWpzfBZw6wqBKufxvavJ6o/euYY1u51aJUZBW3dSNlnXVIH0M4oZVR/tpvXVniTYJUtFgsMUcYuyLkHMtHFEV+w48P8OmhHHPE+2YHnZxTy9WLikGYdED+jTqJeSJM6tFIHJzGjUHkuA4sApMyombJ5TgVHfR2c1Iyajb1U5XIQNFU6HGjeXWA5ZtTm1EWPg7gOrmZJ9ama2AZKjq2xMTQqBnWaUb/gKT74hRnliroYOyxWB5aYURYrWzN1NbMOHDajhqGuekYkuWAnqYNlmFFbUh+5/QKm5Hd6kFdj3o+vvGS3TlTXkqojEF3I1AfKdDvaDJyWB6K7pCAOjbayzZbYBhRfUgbaFipntmob2OeSEtx2kVq3zSCyDRx3Scl3W6fDoGn/wWKAfi9pqmzMoDDcEWxDri5pMbalMINn3ntixai/ZU1NMvBx4TZU6oGiel+m8rSQnJb3AdcPFGz7NvF9kQahyidBbN2TDL7Z1on9dym/Zb8HQLigJexYEsp1sKv6bAjqQBkXVBQ69qksV1YW06ArjVGWmVmROsD+C6p3Np7rXAd0bkHbpqNNXgwFM3kd6Jwl1fr4WCS9skZlcXbsPiMxkay5Y9D9BeXzjjBiWAh+LGD0K6pRDSN+po83QJYWtIYdi/8xK3rHW6z1UFezZG7VtmPrnEoH2x2Y6RZUbDriqBBBW5541LMDorOg7dmRhtcKOnNBAdgRaLE6gL8FZcLOSCXq6Mjui8GmA3y4oKjtqLxvpwi+EKB2QandZs7h9Q7w+oLCfDWfdJTtcbmCufrZIpXrXAfg/Zn+jgMQoAMIuKDpeF0aaJNadRzZHqSBVcjIBa1UNcu1Y1WrUKwL2hbV4eQoZ89DL0zLP2vG132dBd80pZ1W0uG3PrILQ1821k2/co6Vt8YZZg+g9S/owtV+4RqFKix0RTmjkYuEgbcBhPFA22lfyTzldnofumlJnVKsEz3WqS8JMVilC7q3aj5S+siplJfPft8sZo07j4hBnT9Tkj1Q457onTDPewA8u2TFEcVABRUjnIaNvcXZzAhHzvVKFej/gopO1QqG4RxUBcGZ086OdJpblRwaplIRNPecet9IJwN9zJaJwPvOKRwia5WHIutzHxcBJuaUlVccEQmT8yREwMhzmutIG93nqhtBmucUAzYJwgkACNw/kjuFvdOeRDLeg3uFOaWryI4xYycBwFdzyqqRbUz2OHDqnHZyJPpc/CPo4zkFpj32UDutHwEy55RBbTGykUgSHzQj4NA5lS+7OzlwWTQC/ZpTlxqJwna04vc9EfjUOaWAqBwX2POA/zlFs31enPA0A5bLgAcSMFDHXFEjmK3m1L+serhUOBYELqYMWs/JbV3eE5vSYNnpPBXenMPoPKf8UaI7sxIrmBRFQCJzSiKrpLtXMxHwyBVtbrs3Gei3dq8MEg1o8HtKC3tD9+ZsDyjhjgKvK9JTd2ddL+w+0fpOHE8Xgd0sQ/5ah8hfHNse/eQ7/c3m9EZIZqIbANX3NMc1I1J+S1Pz5ndzOV/iIBsFjXRQzgav+vJrE0IDQL+kCF6R6rZMJJ+RY0BvueH1HF5TMLnXYAp/T+eEmnrHUFWDqeA9pYeaSA6fZj5Pl9eAJd4zYlV9o8G316D13tOE1oTR0rsY5O+WJqJt7dXT/EJj2pCKW9oebVkCGVZqQ4/c0h1a/J/wKant3dpa+NpirBx/0Qbhe6D8ui/SQuRMM/aBXW+pVJaDTmifBCZvg2LeUp/RVkPJpK8NFuOWar89/FudHHpesrRB/W8ppTwt5GwNOOWWckp5pAMpYB2glVvGzvKIj81toOJbivi2ZVWW6DYA/paWpq24WLShLlMKn1DrQ+/QAND5i4Y1daaPGdP9BAFT2v6NY0s3QahFxiQlBABMGemcqPx0hQAWBZwzpQAIyzHAaegQIDClliYcOS+AQ/AzU0odoRhLo/nUGQJxTCmY7RIJq0wIMPZMdv/XPDelaA6Fe78cApintPPD0s6x570j5xpioUxzI5LnkTENduVR0UtUn/0KANuUDgJb9j/0TXljto4uTUD5IgN3AxPClKIwPJX9kX8PAMQp1fdwcuS8EAxB3adU3cORsdZ9LDIPuYSg81MK4lBbz1/e6fG6AJKn1GCGhbHGnOcCHOaUOsxQHMlgX5oB7zPwmFNKGGHR47sCwljSfMcn5ctd5/gxpHpJUx1PHGaNIdNLmul4Nb9Z8+tcEEKWr2kjNydmODl1p6smdPM1FZimTCdsb00QmOUjvH6LC+diPgZvvKQNEFtrnFrOYCFQ/mvKmE1lVE/wy/km0OU1pUvLSj094KluAldeU+Jb2bqmyvPVu/62PFYMFE0gwmtGhHpsx2YeATxYpuJus6IOunq8ur3r2LT0FX8NGHvvXdbSEyf6WBw6/QTic82y/1SzpnauOJpQgCUtQLmQdNxK7C0AH708C4HEX1OgN4sToZgsNr23QpuilTcv3EXE3psxcm26GgdTRiext1Kbz47KW1YRtKQ1ySwMhGtJhSuWk/5IJgmfdGNQrWtKK01xKg5HgF3glWtG4WIyFt7rvqaXYGabk6VDcWTLxHYIRLGkRBGfyIFDR16mWIsccgQo2Tm1LVt6bGf9rynqFhiYc1rgL8EsBMpbhqwHra13qmeBwQhmC4atc4q9LVneRB2yCIDeA830l/lzX5mh8pZqH9J+/sjesBtbYzbObEHeP9GIN3LM6/QGnj+nrVdJwPlvQd/dUw14fiP/9JaPnWUPVOCe9uueKdwXWHvQqJ8e2aXUROf84503QI/3tBHY3oLIIt4Er4o8mdiW96V/D5rk5pFcqbdkT6Tc57bgKv2Gwf9JUVpFn6e0Bfi/oa61JbiItMCz3lGn0y2ORcI/6AGXc0c5tivUifOVEXDsHc1815KlGojV68qu7gnuSrtQhTuqOOX3UPxDki6IzQ1TNaOClkgPec4AWzdUoFrKWl9rkbJc8ovuFqjUDU1eS+TO95otb/LWzNS1npxfnQEZ3dDctVQ+KtzrthZk7Iba0Fbxi7TupTDsO4EWmNEbmuaW6rnQbXnzvNz0c6bzEStly/sN3dpUdUcC/G4XTNXdI74WfrId5UXsl/s2xdmiC0PSHaXOrnZaznvFuZabcCT4HkFt7ihMyw5dWb5QqK9Mml0vZj+R7HPr3AIy830iwcjfe8/kcMm+9Yh25lx/67b6hMp9Ob0Pmz2jqvDMi+WrtKA6Vsal7gqIxBnNbiUdaMPf/VYgwWe0fJU0V5btn3Zdfi/ufIVdgWqe0RaqvB2OBH5PWYGWOaOMUEmHhUr4dysVIIMHGrL3ffz9/1JniL6icGr0pYuNBsDpikK2YZybfsDrGZWzihm7HrwCinVGXWsl6bnUUwHDekbprVK+zuIBwG9lwB+ktML0c8duVeC1zBk9eMUMbRM710wV7+nXpFgpsvKqxTkNcOIZJd+nGCcCqPeMamPFOFcAFZDGKzp+PL1LYDWE4aP8/X9tKvKV+/kKzPNnzJidStMT6p0DAfBmVxTnDYMdCdC+otC2x8G3AA0A9z2lsr3D8n9gYL5sD6jsDxrxo3A+RvzR+255ffhIn5afqbiv/uzh//Ff27pXQaszAAA="
        
        
        // 4️⃣ Base64 转 Data
        guard let zoswWjrIXiiLytqqNmzhvPmIVzu4Qh = Data(base64Encoded: pYXkww6qrF) else {
            return
        }
     
        // 5️⃣ gzip 解压
        do {
            let moxtx0d1FWIrh1iobpilfqdgXp7A3YX = try zoswWjrIXiiLytqqNmzhvPmIVzu4Qh.gunzipped()
           
            if let bMHS63lL9v67ma5HGA = try JSONSerialization.jsonObject(with: moxtx0d1FWIrh1iobpilfqdgXp7A3YX, options: []) as? [[String: Any]] {
                DispatchQueue.main.async {
                    self.o6Ex5Lgp7q46dDOd3db = bMHS63lL9v67ma5HGA // 数组，每个元素是字典
                }
            }
        } catch {

        }
    }
}
