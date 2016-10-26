import Foundation

extension NSObject {
    
    /**
     クラス名を取得する
     
     MyClass.className
     →"MyClass"
     */
    class var className: String {
        return String(describing: self)
    }
    var className: String {
        return type(of: self).className
    }
}
