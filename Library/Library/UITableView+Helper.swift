//
//  UITableView+Easy.swift
//  moonshot
//
//  Created by Yuki Hirose on 2016/08/29.
//  Copyright © 2016年 Yuki Hirose. All rights reserved.
//

extension UITableView {
    
    func registerCell(nibName: String, reuseIdentifier: String) {
        self.registerNib(UINib.init(nibName: nibName, bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }
}

