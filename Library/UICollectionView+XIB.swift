//
//  UICollectionView+XIB.swift
//  LibrarySample
//
//  Created by Yuki Hirose on 2016/10/21.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    /**
     Cell登録の短縮
     */
    func register<T: UICollectionViewCell>(cellType: T.Type) {
        let className = cellType.className
        register(UINib(nibName: className, bundle: nil), forCellWithReuseIdentifier: className)
    }
    
    /**
     Cell登録の短縮(複数)
     */
    func register<T: UICollectionViewCell>(cellTypes: [T.Type]) {
        cellTypes.each { (type) in
            register(cellType: type)
        }
    }
    
    /**
     View登録の短縮
     */
    func register<T: UICollectionReusableView>(reusableViewType: T.Type, kind: String = UICollectionElementKindSectionHeader) {
        let className = reusableViewType.className
        register(UINib(nibName: className, bundle: nil),
                 forSupplementaryViewOfKind: kind,
                 withReuseIdentifier: className)
    }
    
    /**
     View登録の短縮(複数)
     */
    func register<T: UICollectionReusableView>(reusableViewTypes: [T.Type], kind: String = UICollectionElementKindSectionHeader) {
        reusableViewTypes.each { (type) in
            register(reusableViewType: type, kind: kind)
        }
    }
    
    /**
     Cell再利用の短縮
     */
    func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
    }
    
    /**
     View再利用の短縮
     */
    func dequeueReusableView<T: UICollectionReusableView>(type: T.Type, indexPath: IndexPath, kind: String = UICollectionElementKindSectionHeader) -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}

