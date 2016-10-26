import Foundation

extension Date {
    
    /**
     フォーマットを指定して、西暦or和暦に影響されずにStringに変換する
     
     Date().toString(format: "yyyy/MM/dd")
     →"2016/10/26"
     */
    func toString(format: String) -> String {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.string(from: self) 
    }
}
