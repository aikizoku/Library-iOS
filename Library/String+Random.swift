import Foundation

extension String {
    
    /**
     指定の長さのランダム文字列(0~0,a~z,A~Z)を生成する
     
     String.rand(length: 5)
     →"YUjx8"
     */
    static func rand(length: Int) -> String {
        let alphabet = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let upperBound = UInt32(alphabet.characters.count)
        return String((0 ..< length).map { _ -> Character in
            return alphabet[alphabet.index(alphabet.startIndex, offsetBy: Int(arc4random_uniform(upperBound)))]
        })
    }
}
