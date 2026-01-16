import SwiftUI
import UIKit

struct bviVhbptEhW0H38XWrfeY: View {
    
    var ceWa39zGt: (Date) -> Void
    
    @State private var h00RqGIatisYGH8aaaKHpjbkg143FTlr: Date = Date()
    
    init(bfm778: Date, xf0KcA1MrO5QockCp0rQVXhvMjYlb2: @escaping (Date) -> Void) {
        self.ceWa39zGt = xf0KcA1MrO5QockCp0rQVXhvMjYlb2
        _h00RqGIatisYGH8aaaKHpjbkg143FTlr = State(initialValue: bfm778)
    }
    
    var body: some View {
        ZJ7h766mz(tMmEWWlfgUag: "xPW24mCd1SORVR56nr4UXuY")
            .frame(maxWidth: .infinity)
            .frame(height: 371)
            .overlay {
                VStack(spacing: 0) {
                    HStack(spacing: 4) {
                        ZJ7h766mz(tMmEWWlfgUag: "j1GtPWGpGXrkZWpZEifKWjZWaz2")
                            .frame(width: 24,height: 24)
                        Text("vySCbBGonoa5qd8IaXr4Iw==".bFHEatcgE4zzU9TCfDonsu())
                            .g0LIIcoZQsOjyND9(
                                size: 18,
                                weight: .semibold
                            )
                        Spacer()
                    }
                    .padding(.top,24)
                    .padding(.leading,16)
                    Zla06e0o3TBel4XGGVvR3W(cgg7YTFDONqBktWGl2: $h00RqGIatisYGH8aaaKHpjbkg143FTlr)
                        .frame(height: 238)
                    Button{
                        ceWa39zGt(h00RqGIatisYGH8aaaKHpjbkg143FTlr)
                    } label: {
                        ZJ7h766mz(tMmEWWlfgUag: "ovdsD4s27")
                            .frame(width: 262,height: 46)
                            .overlay(alignment: .center) {
                                Text("OsfHVPPKKXIHMyiwPxWJ2g==".bFHEatcgE4zzU9TCfDonsu())
                                    .g0LIIcoZQsOjyND9(
                                        size: 18,
                                        weight: .semibold
                                    )
                            }
                    }
                }
                .padding(.bottom,37)
            }
    }
}


struct Zla06e0o3TBel4XGGVvR3W: UIViewControllerRepresentable {
    
    @Binding var cgg7YTFDONqBktWGl2: Date
    
    func makeUIViewController(context: Context) -> AC3yCJzQl8F {
        let lTsqms = AC3yCJzQl8F()
        lTsqms.lrmFzWU1E5bNWoZsNJ = cgg7YTFDONqBktWGl2
        lTsqms.fhCH1a5FKGUuFxRAnEicRFz8u = { lT1GITkl in
            DispatchQueue.main.async {
                cgg7YTFDONqBktWGl2 = lT1GITkl
            }
        }
        return lTsqms
    }
    
    func updateUIViewController(_ oDg1fBN1H7: AC3yCJzQl8F, context: Context) {
        // 延迟设置初始日期，避免在 SwiftUI 渲染阶段直接修改状态
        DispatchQueue.main.async {
            oDg1fBN1H7.xZPhqS6PdVxIWKPRBbEC9fbNqJnGD(cgg7YTFDONqBktWGl2)
        }
    }
}

class AC3yCJzQl8F: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var fhCH1a5FKGUuFxRAnEicRFz8u: ((Date) -> Void)?
    var lrmFzWU1E5bNWoZsNJ: Date = Date()
    
    private let ocGsEIjN = UIPickerView()
    private var uicjQvlJCL7blIt76Bb0Quc: [Int] = []
    private let xTPuE1HZZgp756: [Int] = Array(1...12)
    private var zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX: [Int] = []
    
    private var nGonwL9js3jMdjOItZW: Int = 2004
    private var ugXlCBp4PNPkGzhwDfqZ: Int = 1
    private var fYRveOkNm28Yer: Int = 1
    
    private let qzfw5iWZ: CGFloat = 40
    private let jkL5Nwqw: CGFloat = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        let go5hAFYvsPL5PbYHuRp5car6doup = Calendar.current
        let iJoEA5uwt02oF7J1383Sz = go5hAFYvsPL5PbYHuRp5car6doup.component(.year, from: Date())
        let okplg1t6xLJ6L10AS0ru01miV6KmQ = iJoEA5uwt02oF7J1383Sz - 18
        let jkYLVIZKy0xn9zrAiRmVfYLv6IW = iJoEA5uwt02oF7J1383Sz - 100
        uicjQvlJCL7blIt76Bb0Quc = Array(jkYLVIZKy0xn9zrAiRmVfYLv6IW...okplg1t6xLJ6L10AS0ru01miV6KmQ)

        let f4Pylo = lrmFzWU1E5bNWoZsNJ
        nGonwL9js3jMdjOItZW = go5hAFYvsPL5PbYHuRp5car6doup.component(.year, from: f4Pylo)
        ugXlCBp4PNPkGzhwDfqZ = go5hAFYvsPL5PbYHuRp5car6doup.component(.month, from: f4Pylo)
        fYRveOkNm28Yer = go5hAFYvsPL5PbYHuRp5car6doup.component(.day, from: f4Pylo)
        aW9xQvtoesfi235gz()

        ocGsEIjN.dataSource = self
        ocGsEIjN.delegate = self
        ocGsEIjN.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ocGsEIjN)

        NSLayoutConstraint.activate([
            ocGsEIjN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ocGsEIjN.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ocGsEIjN.widthAnchor.constraint(equalToConstant: 344),
            ocGsEIjN.heightAnchor.constraint(equalToConstant: 200)
        ])

        // 设置选中行
        if let n9Uu4NosYdh1MclvgdCu8rjv = uicjQvlJCL7blIt76Bb0Quc.firstIndex(of: nGonwL9js3jMdjOItZW) {
            ocGsEIjN.selectRow(n9Uu4NosYdh1MclvgdCu8rjv, inComponent: 0, animated: false)
        }
        ocGsEIjN.selectRow(ugXlCBp4PNPkGzhwDfqZ - 1, inComponent: 1, animated: false)
        ocGsEIjN.selectRow(fYRveOkNm28Yer - 1, inComponent: 2, animated: false)

        gGSpHGgSSZkkohJ8qsR()
    }
    
    func xZPhqS6PdVxIWKPRBbEC9fbNqJnGD(_ b5AL3Y7wSS: Date) {
        let fNjwmk4uBWViWYcCwIK8 = Calendar.current
        nGonwL9js3jMdjOItZW = fNjwmk4uBWViWYcCwIK8.component(.year, from: b5AL3Y7wSS)
        ugXlCBp4PNPkGzhwDfqZ = fNjwmk4uBWViWYcCwIK8.component(.month, from: b5AL3Y7wSS)
        fYRveOkNm28Yer = fNjwmk4uBWViWYcCwIK8.component(.day, from: b5AL3Y7wSS)
        aW9xQvtoesfi235gz()
        ocGsEIjN.reloadAllComponents()
        ocGsEIjN.selectRow(uicjQvlJCL7blIt76Bb0Quc.firstIndex(of: nGonwL9js3jMdjOItZW) ?? 0, inComponent: 0, animated: false)
        ocGsEIjN.selectRow(ugXlCBp4PNPkGzhwDfqZ - 1, inComponent: 1, animated: false)
        ocGsEIjN.selectRow(fYRveOkNm28Yer - 1, inComponent: 2, animated: false)
        gGSpHGgSSZkkohJ8qsR()
    }
    
    private func gGSpHGgSSZkkohJ8qsR() {
        var vS3gWtZGzOxyGwpFH9ajbhcL = DateComponents()
        vS3gWtZGzOxyGwpFH9ajbhcL.year = nGonwL9js3jMdjOItZW
        vS3gWtZGzOxyGwpFH9ajbhcL.month = ugXlCBp4PNPkGzhwDfqZ
        vS3gWtZGzOxyGwpFH9ajbhcL.day = fYRveOkNm28Yer
        if let shWnorkKJmGy53jJW = Calendar.current.date(from: vS3gWtZGzOxyGwpFH9ajbhcL) {
            fhCH1a5FKGUuFxRAnEicRFz8u?(shWnorkKJmGy53jJW)
        }
    }
    
    private func aW9xQvtoesfi235gz() {
        var majJbyAOh0c = DateComponents()
        majJbyAOh0c.year = nGonwL9js3jMdjOItZW
        majJbyAOh0c.month = ugXlCBp4PNPkGzhwDfqZ
        let djz8WzTCHwN02UoGaSU = Calendar.current
        let ewx4jVG47 = djz8WzTCHwN02UoGaSU.date(from: majJbyAOh0c) ?? Date()
        let kX2c30BUAIk0BdlET3grvWHHrh7Fch3 = djz8WzTCHwN02UoGaSU.range(of: .day, in: .month, for: ewx4jVG47) ?? 1..<32
        zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX = Array(kX2c30BUAIk0BdlET3grvWHHrh7Fch3)
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in qJwMEHVN5xtYoUlFl4m1: UIPickerView) -> Int { 3 }
    func pickerView(_ tGmJ4VjedMEBDGnvzLq58Agy6URUkH0G: UIPickerView, numberOfRowsInComponent ewdBuL6YBKUb3YK9KXmGnu8: Int) -> Int {
        switch ewdBuL6YBKUb3YK9KXmGnu8 {
        case 0: return uicjQvlJCL7blIt76Bb0Quc.count
        case 1: return xTPuE1HZZgp756.count
        case 2: return zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX.count
        default: return 0
        }
    }
    
    func pickerView(_ d3AC57TAp56zRqbaBf: UIPickerView, widthForComponent pj8Cl8RKTMsfaR8yUAXXYK: Int) -> CGFloat { 80 }
    func pickerView(_ h7hdfmkj2z8zJWNi: UIPickerView, rowHeightForComponent e870JvS: Int) -> CGFloat { qzfw5iWZ }
    
    // MARK: - 自定义行视图
    func pickerView(_ xbO8q3o1vLrJu8KZFl7i: UIPickerView, viewForRow vgVgHRijaLWpgJfuyM: Int, forComponent vYgZfzVudNYJmHAbDaBolc52Ai0: Int, reusing kWr9B2embN8v3QHFw: UIView?) -> UIView {
        let w58RNgfKoD: UILabel
        if let c4bOufJ78vGg6 = view as? UILabel {
            w58RNgfKoD = c4bOufJ78vGg6
        } else {
            w58RNgfKoD = UILabel()
            w58RNgfKoD.textAlignment = .center
        }
        
        // 设置文本
        switch vYgZfzVudNYJmHAbDaBolc52Ai0 {
        case 0: w58RNgfKoD.text = "\(uicjQvlJCL7blIt76Bb0Quc[vgVgHRijaLWpgJfuyM])"
        case 1: w58RNgfKoD.text = "\(xTPuE1HZZgp756[vgVgHRijaLWpgJfuyM])"
        case 2: w58RNgfKoD.text = "\(zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX[vgVgHRijaLWpgJfuyM])"
        default: break
        }
        
        w58RNgfKoD.textColor = .white
        w58RNgfKoD.font = UIFont.systemFont(ofSize: jkL5Nwqw, weight: .semibold)
        return w58RNgfKoD
    }
    
    func pickerView(_ ldY9ZUEj0yyI1OcpfhZJhCqKKCp: UIPickerView, didSelectRow nPXP9jGaFEHIZnVG2qnkJiyr: Int, inComponent cKIOqse6uqXbuOUtUd1lmE: Int) {
        switch cKIOqse6uqXbuOUtUd1lmE {
        case 0: nGonwL9js3jMdjOItZW = uicjQvlJCL7blIt76Bb0Quc[nPXP9jGaFEHIZnVG2qnkJiyr]
        case 1: ugXlCBp4PNPkGzhwDfqZ = xTPuE1HZZgp756[nPXP9jGaFEHIZnVG2qnkJiyr]
        case 2: fYRveOkNm28Yer = zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX[nPXP9jGaFEHIZnVG2qnkJiyr]
        default: break
        }
        
        if cKIOqse6uqXbuOUtUd1lmE == 0 || cKIOqse6uqXbuOUtUd1lmE == 1 {
            let xHHOi22yV7KsAfQHPDKDnMp = fYRveOkNm28Yer
            aW9xQvtoesfi235gz()
            ocGsEIjN.reloadComponent(2)
            let loHp1l2W = min(xHHOi22yV7KsAfQHPDKDnMp - 1, zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX.count - 1)
            fYRveOkNm28Yer = zUS1kDPS4EkpEcgDlgvSBxFy6L20o7iX[loHp1l2W]
            ocGsEIjN.selectRow(loHp1l2W, inComponent: 2, animated: true)
        }
        
        ocGsEIjN.reloadAllComponents() // 刷新字体样式
        gGSpHGgSSZkkohJ8qsR()
    }
}
