import Foundation

extension Array {
    
    /**
     要素をシャッフルする
     
     ["a", "b", "c"].shuffle()
     →["b", "c", "a"]
     */
    mutating func shuffle() {
        for i in 0..<count {
            let newIndex = Int(arc4random_uniform(UInt32(count - i))) + i
            if i != newIndex {
                swap(&self[i], &self[newIndex])
            }
        }
    }
}
