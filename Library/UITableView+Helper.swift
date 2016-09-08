//
//  UITableView+Easy.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/08/29.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func registerCell(nibName nibName: String, reuseIdentifier: String) {
        self.registerNib(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}

