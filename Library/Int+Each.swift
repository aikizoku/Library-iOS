import Foundation

extension Int {
    
    /**
     指定回数だけ繰り返す
     
     10.each(closure: { i in
        NSLog("%d回目のループ")
     })
     */
    func each(closure: (_ i: Int) -> Void) {
        for i in 0 ..< self {
            closure(i)
        }
    }
}
