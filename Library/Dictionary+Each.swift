import Foundation

extension Dictionary {
    
    /**
     KeyとValueを取得しながら繰り返す
     
     ["key": "value"].each(closure: { (key, value) in
        NSLog("%@: %@", key, value)
     })
     */
    func each(closure: (_ key: Key, _ value: Value) -> Void) {
        for (key, value) in self {
            closure(key, value)
        }
    }
}
