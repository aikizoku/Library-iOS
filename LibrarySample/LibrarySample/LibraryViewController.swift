//
//  LibraryViewController.swift
//  LibrarySample
//
//  Created by yukithehero on 2016/09/08.
//  Copyright © 2016年 yukithehero. All rights reserved.
//

import RxSwift
import RxCocoa

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = Variable<[LibrarySection]>([])
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sections = Array<LibrarySection>()
        
        do {
            let section = LibrarySection(title: "NSDate")
            
            do {
                section.rows.value.append(LibraryRow(title: "NSDate+Parse"))
            }
            
            sections.append(section)
        }
        
        self.sections.value = sections
        
        self.sections.asObservable().subscribe(onNext: { [unowned self] (sections) in
            self.tableView.reloadData()
        }).addDisposableTo(disposeBag)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.value.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections.value[section].rows.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if let cell = cell {
            if let textLabel = cell.textLabel {
                textLabel.text = self.sections.value[indexPath.section].rows.value[indexPath.row].title
            }
        }
        cell?.separator = true
        return cell ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
    }
}

class LibrarySection: AnyObject {
    
    var title = ""
    var rows = Variable<[LibraryRow]>([])
    
    init(title: String) {
        self.title = title
    }
}

class LibraryRow: AnyObject {
    
    var title = ""
    
    init(title: String) {
        self.title = title
    }
}

