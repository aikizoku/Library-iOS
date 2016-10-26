import Foundation

extension Array {
    
    /**
     要素を順番に渡しながら繰り返す
     
     ["a", "b", "c"].each(e: { str in
        NSLog(str)
     })
     */
    func each(e closure: (_ element: Element) -> Void) {
        for element in self {
            closure(element)
        }
    }
    
    /**
     要素とインデックスを順番に渡しながら繰り返す
     
     ["a", "b", "c"].each(ie: { (i, str) in
        NSLog("%d番目のループ", i)
        NSLog(str)
     })
     */
    func each(ie closure: (_ i: Int, _ element: Element) -> Void) {
        let c = count
        for i in 0 ..< c {
            closure(i, self[i])
        }
    }
    
    /**
     要素と初回判定と最後判定を順番に渡しながら繰り返す
     
     ["a", "b", "c"].each(fle: { (first, last, str) in
        if (first) {
            NSLog("最初のループ")
        }
        if (last) {
            NSLog("最後のループ")
        }
        NSLog(str)
     })
     */
    func each(fle closure: (_ first: Bool, _ last: Bool, _ element: Element) -> Void) {
        let c = count
        let li = lastIndex
        for i in 0 ..< c {
            let first = i == 0
            let last = i == li
            closure(first, last, self[i])
        }
    }
}
