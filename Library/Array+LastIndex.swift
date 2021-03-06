import Foundation

extension Array {
    
    /**
     最後のIndexを取得する
     
     ["a", "b", "c"].lastIndex
     →2
     */
    var lastIndex: Int {
        get {
            return count == 0 ? 0 : count - 1
        }
    }
}
