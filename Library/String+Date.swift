import Foundation

extension String {
    
    /**
     フォーマットを指定して西暦or和暦に影響されずにNSDateに変換する
     
     "2016/10/26".toDate(format: "yyyy/MM/dd")
     */
    func toDate(format: String) -> Date? {
        let fmt = DateFormatter()
        fmt.locale = Locale(identifier: "en_US_POSIX")
        fmt.dateFormat = format
        return fmt.date(from: self)
    }
}
