
//拓展方法
import Foundation

//时间转换格式
extension Date {
    func Jq9K2pW7Lr() -> String {
        let Xv3nT8zQ = Calendar.current
        let Vh5yL1oM = Date()
        let Yw2bF6cA = DateFormatter()
        Yw2bF6cA.timeZone = .current
        Yw2bF6cA.locale = .current
        
        if Xv3nT8zQ.isDateInToday(self) {
            Yw2bF6cA.dateFormat = "HH:mm"
            return Yw2bF6cA.string(from: self)
        } else if Xv3nT8zQ.isDateInYesterday(self) {
            return "yesterday"
        } else {
            let Gn4rS8kD = Xv3nT8zQ.component(.year, from: self)
            let Pf7qJ2vB = Xv3nT8zQ.component(.year, from: Vh5yL1oM)
            
            if Gn4rS8kD == Pf7qJ2vB {
                Yw2bF6cA.dateFormat = "MM-dd"
                return Yw2bF6cA.string(from: self)
            } else {
                Yw2bF6cA.dateFormat = "yyyy-MM-dd"
                return Yw2bF6cA.string(from: self)
            }
        }
    }
    
    func oQBlX821fcQ() -> String {
        let calendar = Calendar.current
        let now = Date()
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        
        formatter.dateFormat = "HH:mm"
        let timeString = formatter.string(from: self)
        
        if calendar.isDateInToday(self) {
            return timeString
            
        } else if calendar.isDateInYesterday(self) {
            return "yesterday \(timeString)"
            
        } else {
            let targetYear = calendar.component(.year, from: self)
            let currentYear = calendar.component(.year, from: now)
            
            if targetYear == currentYear {
                formatter.dateFormat = "MM-dd"
                let dateString = formatter.string(from: self)
                return "\(dateString) \(timeString)"
                
            } else {
                formatter.dateFormat = "yyyy-MM-dd"
                let dateString = formatter.string(from: self)
                return "\(dateString) \(timeString)"
            }
        }
    }
}
