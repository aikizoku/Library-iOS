import Foundation

extension String {
    
    /**
     空文字でないか判定する
     
     if "hoge".isNotEmpty {
        NSLog("空文字じゃないよ")
     }
     */
    var isNotEmpty: Bool {
        return !isEmpty
    }
    
    /**
     nilでもなく、空文字でもないか判定する
     
     if String.isNotNilEmpty(string: str) {
        NSLog("nilでも空文字でもないよ")
     }
     */
    static func isNotNilEmpty(string: String?) -> Bool {
        guard let string = string else {
            return false
        }
        return !string.isEmpty
    }
    
    /**
     数値かどうか判定する
     
     if "12345.67".isNumeric {
        NSLog("数字だよ")
     }
     */
    var isNumeric: Bool {
        let sc = Scanner(string: self)
        sc.locale = Locale.current
        return sc.scanDecimal(nil) && sc.isAtEnd
    }
}
