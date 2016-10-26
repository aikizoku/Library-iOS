import Foundation
import UIKit

extension UITableView {
    
    /**
     Cell登録の短縮
     */
    func register<T: UITableViewCell>(cellType: T.Type) {
        let className = cellType.className
        register(UINib(nibName: className, bundle: nil), forCellReuseIdentifier: className)
    }
    
    /**
     Cell登録の短縮(複数)
     */
    func register<T: UITableViewCell>(cellTypes: [T.Type]) {
        cellTypes.each { (type) in
            register(cellType: type)
        }
    }
    
    /**
     Cell再利用の短縮
     */
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}

