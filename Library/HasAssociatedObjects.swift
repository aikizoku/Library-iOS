//
//  HasAssociatedObjects.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/09/01.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation

protocol HasAssociatedObjects {
    var associatedObjects: AssociatedObjects { get }
}

private var AssociatedObjectsKey: UInt8 = 0

extension HasAssociatedObjects where Self: AnyObject {
    var associatedObjects: AssociatedObjects {
        guard let associatedObjects = objc_getAssociatedObject(self, &AssociatedObjectsKey) as? AssociatedObjects else {
            let associatedObjects = AssociatedObjects()
            objc_setAssociatedObject(self, &AssociatedObjectsKey, associatedObjects, .OBJC_ASSOCIATION_RETAIN)
            return associatedObjects
        }
        return associatedObjects
    }
}

class AssociatedObjects: NSObject {
    var dictionary: [String: Any] = [:]
    subscript(key: String) -> Any? {
        get {
            return self.dictionary[key]
        }
        set {
            self.dictionary[key] = newValue
        }
    }
}
