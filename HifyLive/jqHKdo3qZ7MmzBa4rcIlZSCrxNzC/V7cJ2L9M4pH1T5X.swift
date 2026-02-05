
//拓展方法
import Foundation

//时间转换格式
extension Date {
    func Jq9K2pW7Lr() -> String {
        let Xv3nT8zQ = Calendar.current
        let Vh5yL1oM = Date()
        let Yw2bF6cA = DateFormatter()
        
        if Xv3nT8zQ.isDateInToday(self) {
            // 当天：显示具体时间，如 17:08
            Yw2bF6cA.dateFormat = "HH:mm"
            return Yw2bF6cA.string(from: self)
        } else if Xv3nT8zQ.isDateInYesterday(self) {
            // 昨天：显示 "yesterday"
            return "yesterday"
        } else {
            let Gn4rS8kD = Xv3nT8zQ.component(.year, from: self)
            let Pf7qJ2vB = Xv3nT8zQ.component(.year, from: Vh5yL1oM)
            
            if Gn4rS8kD == Pf7qJ2vB {
                // 今年内：显示月日，如 12-23
                Yw2bF6cA.dateFormat = "MM-dd"
                return Yw2bF6cA.string(from: self)
            } else {
                // 往年：显示年月日，如 2024-12-25
                Yw2bF6cA.dateFormat = "yyyy-MM-dd"
                return Yw2bF6cA.string(from: self)
            }
        }
    }
}
