import Foundation

extension Int {
    
    /**
     数値を３桁カンマ区切りにする
     
     1000000.thousandSeparator()
     →"1,000,000"
     */
    func thousandSeparator() -> String {
        let fmt = NumberFormatter()
        fmt.numberStyle = .decimal
        fmt.groupingSeparator = ","
        fmt.groupingSize = 3
        return fmt.string(from: NSNumber(value: self)) ?? String(self)
    }
}
