//
//  UITableView+Easy.swift
//  Library
//
//  Created by Yuki Hirose on 2016/09/06.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    /**
     registerCellの短縮
     */
    func registerCell(nibName nibName: String, reuseIdentifier: String) {
        registerNib(UINib(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}

