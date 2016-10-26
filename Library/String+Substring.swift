import Foundation

extension String {
    
    /**
     指定したインデックスまでの文字列を取得する
     
     "aiueo".substringTo(i: 2)
     →"ai"
     */
    func substringTo(i: Int) -> String {
        return substring(to: index(startIndex, offsetBy: Math.clampInt(value: i, min: 0, max: characters.count)))
    }
    
    /**
     指定したインデックスからの文字列を取得する
     
     "aiueo".substringFrom(i: 2)
     →"eo"
     */
    func substringFrom(i: Int) -> String {
        return substring(from: index(endIndex, offsetBy: -Math.clampInt(value: i, min: 0, max: characters.count)))
    }
    
    /**
     指定した範囲の文字列を取得する
     
     "aiueo".substring(start: 1, length: 3)
     →"iue"
     */
    func substring(start: Int, length: Int) -> String {
        let st = index(startIndex, offsetBy: Math.clampInt(value: start, min: 0, max: characters.count))
        let len = index(st, offsetBy: Math.clampInt(value: length, min: 0, max: characters.count - start))
        return substring(with: st..<len)
    }
}
