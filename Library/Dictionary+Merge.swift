import Foundation

extension Dictionary {
    
    /**
     Dictionaryを結合する（上書き）
     
     ["a": "あ", "i": "い"].marge(dictionary: ["a": "hoge", "u": "う"])
     →["a": "hoge", "i": "い", "u": "う"]
     */
    mutating func merge(dictionary: Dictionary) {
        dictionary.each { (key, value) in
            self[key] = value
        }
    }
    
    func merged(dictionary: Dictionary) -> Dictionary {
        var this = self
        dictionary.each { (key, value) in
            this[key] = value
        }
        return this
    }
    
    /**
     Dictionaryを結合する（上書きしない）
     
     ["a": "あ", "i": "い"].marge(dictionary: ["a": "hoge", "u": "う"])
     →["a": "あ", "i": "い", "u": "う"]
     */
    mutating func safeMerge(dictionary: Dictionary) {
        each { (key, value) in
            if self[key] == nil {
                self[key] = value
            }
        }
    }
    
    func safeMerged(dictionary: Dictionary) -> Dictionary {
        var this = self
        dictionary.each { (key, value) in
            if this[key] == nil {
                this[key] = value
            }
        }
        return this
    }
}

