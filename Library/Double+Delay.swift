import Foundation

extension Double {
    
    /**
     指定の秒数だけ待ってから実行する
     
     3.0.setTimeout(closure: {
        NSLog("3.0秒後に実行")
     })
     */
    func setTimeout(closure: @escaping () -> Void) {
        let delay = self * Double(NSEC_PER_SEC)
        let time  = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: closure)
    }
}
