//
//  CPBowSettingsTableViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class CPBowSettingsTableViewController: UITableViewController {
    
    let headerName = "RCBowSettingsTableViewHeaderFooterView"
    var expandSectionSet = Set<Int>()
    
    var sections = ["ハンドル", "サイト", "スタビライザー", "矢", "リリーサー", "その他"]
    var textArray = [[String]]()
    var callIndex = 0
    
    let rowsInSection: [Int] = [4, 6, 3, 6, 1, 1]
    
    var year: Int!
    var mounth: Int!
    var day: Int!
    var weekday: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        (year, mounth, day, weekday) = MyFunctions.getTodayInt()
        
        for sectionNum in rowsInSection {
            var appendList: [String] = []
            for _ in 0..<sectionNum {
                appendList.append("")
            }
            textArray.append(appendList)
        }
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: headerName, bundle: nil), forCellReuseIdentifier: "RCHeader")
        
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}
