import Foundation

extension String {
    
    /**
     文字列をトリミングする
     
     " hoge\nhoge \n　".trim
     →"hoge\nhoge"
     */
    var trim: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /**
     文字列を指定文字列で全て置換する
     
     "aiueo".replace(target: "ue", with: "12")
     →"ai12o"
     */
    func replace(target: String, with: String) -> String {
        return replacingOccurrences(of: target, with: with)
    }
}
