import SwiftUI
import UIKit
import Combine
//生日选择底部弹框
struct BirthdayBottomSheet: View {
    @Binding var isPresented: Bool
    var onDateSelected: (Date) -> Void
    @State private var isShown = false
    
    // ⚡ 预加载 PickerWrapper
    @StateObject private var pickerWrapper = PickerWrapperHolder()
    
    init(isPresented: Binding<Bool>, initialDate: Date, onDateSelected: @escaping (Date) -> Void) {
        self._isPresented = isPresented
        self.onDateSelected = onDateSelected
        // 预初始化 PickerWrapper
        _pickerWrapper = StateObject(wrappedValue: PickerWrapperHolder(initialDate: initialDate))
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture { isPresented = false }
            
           
            VStack {
                Spacer()
                ZJ7h766mz(tMmEWWlfgUag: "xPW24mCd1SORVR56nr4UXuY")
                        .frame(height: 371)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            VStack(spacing: 0) {
                                // 顶部标题
                                HStack {
                                    ZJ7h766mz(tMmEWWlfgUag: "j1GtPWGpGXrkZWpZEifKWjZWaz2")
                                        .frame(width: 24, height: 24)
                                    Text("vySCbBGonoa5qd8IaXr4Iw==".bFHEatcgE4zzU9TCfDonsu())
                                        .g0LIIcoZQsOjyND9(size: 18, weight: .semibold)
                                    Spacer()
                                }
                                .padding(.top,24)
                                .padding(.leading,16)
                                
                                // ⚡ Picker
                                pickerWrapper.wrapper
                                    .frame(height: 238)
                                
                                // 确定按钮
                                Button {
                                    onDateSelected(pickerWrapper.selectedDate)
                                    isPresented = false
                                } label: {
                                    ZJ7h766mz(tMmEWWlfgUag: "ovdsD4s27")
                                        .frame(width: 262,height: 46)
                                        .overlay {
                                            Text("OsfHVPPKKXIHMyiwPxWJ2g==".bFHEatcgE4zzU9TCfDonsu())
                                                .g0LIIcoZQsOjyND9(size: 18, weight: .semibold)
                                        }
                                }
                                .padding(.bottom,37)
                            }
                        )
                        .clipped() // 避免布局干扰 Picker
                        .offset(y: isShown ? 0 : 371)
                        
            }.ignoresSafeArea()
        }
        .onAppear {
           
            
            isShown = false
            DispatchQueue.main.async {
                withAnimation(.easeOut(duration: 0.25)) {
                    isShown = true
                }
            }
        }
    }
}

// MARK: - PickerWrapper Holder
// ⚡ 预加载 UIPickerView VC，避免每次弹框初始化时卡顿
class PickerWrapperHolder: ObservableObject {
    @Published var selectedDate: Date
    
    // 绑定给 UIPickerView
    lazy var wrapper: DatePickerWrapper = {
        DatePickerWrapper(selectedDate: Binding(
            get: { [weak self] in
                self?.selectedDate ?? Date()
            },
            set: { [weak self] newDate in
                self?.selectedDate = newDate
            }
        ))
    }()
    
    init(initialDate: Date = Date()) {
        self.selectedDate = initialDate
    }
}

//选择器封装
// MARK: - UIViewControllerRepresentable
struct DatePickerWrapper: UIViewControllerRepresentable {
    @Binding var selectedDate: Date
    
    func makeUIViewController(context: Context) -> AC3yCJzQl8F {
        let pickerVC = AC3yCJzQl8F()
        pickerVC.initialDate = selectedDate
        pickerVC.onDateChanged = { newDate in
            DispatchQueue.main.async {
                self.selectedDate = newDate
            }
        }
        return pickerVC
    }
    
    func updateUIViewController(_ uiViewController: AC3yCJzQl8F, context: Context) {
        if uiViewController.initialDate != selectedDate {
            uiViewController.setDate(selectedDate)
        }
    }
}

class AC3yCJzQl8F: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var onDateChanged: ((Date) -> Void)?
    var initialDate: Date = Date()
    
    private let picker = UIPickerView()
    
    // 数据源
    private var years: [Int] = []
    private let months: [Int] = Array(1...12)
    private var days: [Int] = []
    
    // 当前选中
    private var selectedYear: Int = 2004
    private var selectedMonth: Int = 1
    private var selectedDay: Int = 1
    
    private let rowHeight: CGFloat = 40
    private let fontSize: CGFloat = 22
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        setupYearRange()
        setupInitialDate()
        setupPicker()
        updateDays()
        selectRows(animated: false)
        notifyDateChange()
    }
    
    // MARK: - 初始化年份范围
    private func setupYearRange() {
        let currentYear = Calendar.current.component(.year, from: Date())
        let maxYear = currentYear - 18
        let minYear = currentYear - 100
        years = Array(minYear...maxYear)
    }
    
    private func setupInitialDate() {
        let calendar = Calendar.current
        selectedYear = calendar.component(.year, from: initialDate)
        selectedMonth = calendar.component(.month, from: initialDate)
        selectedDay = calendar.component(.day, from: initialDate)
    }
    
    // MARK: - UIPickerView
    private func setupPicker() {
        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            picker.widthAnchor.constraint(equalToConstant: 344),
            picker.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func updateDays() {
        var comps = DateComponents()
        comps.year = selectedYear
        comps.month = selectedMonth
        let calendar = Calendar.current
        if let date = calendar.date(from: comps),
           let range = calendar.range(of: .day, in: .month, for: date) {
            days = Array(range)
        } else {
            days = Array(1...31)
        }
        // 确保 day 不超过最大天数
        selectedDay = min(selectedDay, days.count)
    }
    
    private func selectRows(animated: Bool) {
        if let yearIndex = years.firstIndex(of: selectedYear) {
            picker.selectRow(yearIndex, inComponent: 0, animated: animated)
        }
        picker.selectRow(selectedMonth - 1, inComponent: 1, animated: animated)
        picker.selectRow(selectedDay - 1, inComponent: 2, animated: animated)
    }
    
    private func notifyDateChange() {
        var comps = DateComponents()
        comps.year = selectedYear
        comps.month = selectedMonth
        comps.day = selectedDay
        if let date = Calendar.current.date(from: comps) {
            onDateChanged?(date)
        }
    }
    
    // MARK: - 外部更新日期
    func setDate(_ date: Date) {
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        
        if year != selectedYear || month != selectedMonth || day != selectedDay {
            selectedYear = year
            selectedMonth = month
            selectedDay = day
            updateDays()
            picker.reloadAllComponents()
            selectRows(animated: false)
            notifyDateChange()
        }
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 3 }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0: return years.count
        case 1: return months.count
        case 2: return days.count
        default: return 0
        }
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat { rowHeight }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat { 80 }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = (view as? UILabel) ?? UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        label.textColor = .white
        
        switch component {
        case 0: label.text = "\(years[row])"
        case 1: label.text = "\(months[row])"
        case 2: label.text = "\(days[row])"
        default: break
        }
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0: selectedYear = years[row]; updateDays(); picker.reloadComponent(2)
        case 1: selectedMonth = months[row]; updateDays(); picker.reloadComponent(2)
        case 2: selectedDay = days[row]
        default: break
        }
        // 确保选中天数不超过最大天数
        if selectedDay > days.count { selectedDay = days.count }
        selectRows(animated: false)
        notifyDateChange()
    }
}
