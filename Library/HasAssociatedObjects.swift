import Foundation

/**
 extensionでStored Propertyを使うための黒魔術
 */
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
            return dictionary[key]
        }
        set {
            dictionary[key] = newValue
        }
    }
}
