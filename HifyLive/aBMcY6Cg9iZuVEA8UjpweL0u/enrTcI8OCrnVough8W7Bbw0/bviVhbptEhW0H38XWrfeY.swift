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
                    }label:{
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
            oDg1fBN1H7.setDate(cgg7YTFDONqBktWGl2)
        }
    }
}

class AC3yCJzQl8F: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var fhCH1a5FKGUuFxRAnEicRFz8u: ((Date) -> Void)?
    var lrmFzWU1E5bNWoZsNJ: Date = Date()
    
    private let ocGsEIjN = UIPickerView()
    private var uicjQvlJCL7blIt76Bb0Quc: [Int] = []
    private let xTPuE1HZZgp756: [Int] = Array(1...12)
    private var days: [Int] = []
    
    private var selectedYear: Int = 2004
    private var selectedMonth: Int = 1
    private var selectedDay: Int = 1
    
    private let rowHeight: CGFloat = 40
    private let fontSize: CGFloat = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear

        let calendar = Calendar.current
        let currentYear = calendar.component(.year, from: Date())
        let maxYear = currentYear - 18
        let minYear = currentYear - 100
        uicjQvlJCL7blIt76Bb0Quc = Array(minYear...maxYear)

        let defaultDate = lrmFzWU1E5bNWoZsNJ
        selectedYear = calendar.component(.year, from: defaultDate)
        selectedMonth = calendar.component(.month, from: defaultDate)
        selectedDay = calendar.component(.day, from: defaultDate)
        updateDays()

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
        if let yearIndex = uicjQvlJCL7blIt76Bb0Quc.firstIndex(of: selectedYear) {
            ocGsEIjN.selectRow(yearIndex, inComponent: 0, animated: false)
        }
        ocGsEIjN.selectRow(selectedMonth - 1, inComponent: 1, animated: false)
        ocGsEIjN.selectRow(selectedDay - 1, inComponent: 2, animated: false)

        notifyDateChanged()
    }
    
    func setDate(_ date: Date) {
        let calendar = Calendar.current
        selectedYear = calendar.component(.year, from: date)
        selectedMonth = calendar.component(.month, from: date)
        selectedDay = calendar.component(.day, from: date)
        updateDays()
        ocGsEIjN.reloadAllComponents()
        ocGsEIjN.selectRow(uicjQvlJCL7blIt76Bb0Quc.firstIndex(of: selectedYear) ?? 0, inComponent: 0, animated: false)
        ocGsEIjN.selectRow(selectedMonth - 1, inComponent: 1, animated: false)
        ocGsEIjN.selectRow(selectedDay - 1, inComponent: 2, animated: false)
        notifyDateChanged()
    }
    
    private func notifyDateChanged() {
        var comps = DateComponents()
        comps.year = selectedYear
        comps.month = selectedMonth
        comps.day = selectedDay
        if let date = Calendar.current.date(from: comps) {
            fhCH1a5FKGUuFxRAnEicRFz8u?(date)
        }
    }
    
    private func updateDays() {
        var comps = DateComponents()
        comps.year = selectedYear
        comps.month = selectedMonth
        let calendar = Calendar.current
        let date = calendar.date(from: comps) ?? Date()
        let range = calendar.range(of: .day, in: .month, for: date) ?? 1..<32
        days = Array(range)
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 3 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return uicjQvlJCL7blIt76Bb0Quc.count
        case 1: return xTPuE1HZZgp756.count
        case 2: return days.count
        default: return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { 80 }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { rowHeight }
    
    // MARK: - 自定义行视图
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label: UILabel
        if let labelView = view as? UILabel {
            label = labelView
        } else {
            label = UILabel()
            label.textAlignment = .center
        }
        
        // 设置文本
        switch component {
        case 0: label.text = "\(uicjQvlJCL7blIt76Bb0Quc[row])"
        case 1: label.text = "\(xTPuE1HZZgp756[row])"
        case 2: label.text = "\(days[row])"
        default: break
        }
        
        // 判断是否选中
        let isSelected: Bool
        switch component {
        case 0: isSelected = (uicjQvlJCL7blIt76Bb0Quc[row] == selectedYear)
        case 1: isSelected = (xTPuE1HZZgp756[row] == selectedMonth)
        case 2: isSelected = (days[row] == selectedDay)
        default: isSelected = false
        }
        
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0: selectedYear = uicjQvlJCL7blIt76Bb0Quc[row]
        case 1: selectedMonth = xTPuE1HZZgp756[row]
        case 2: selectedDay = days[row]
        default: break
        }
        
        if component == 0 || component == 1 {
            let oldDay = selectedDay
            updateDays()
            ocGsEIjN.reloadComponent(2)
            let dayIndex = min(oldDay - 1, days.count - 1)
            selectedDay = days[dayIndex]
            ocGsEIjN.selectRow(dayIndex, inComponent: 2, animated: true)
        }
        
        ocGsEIjN.reloadAllComponents() // 刷新字体样式
        notifyDateChanged()
    }
}
