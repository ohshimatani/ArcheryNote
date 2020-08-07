//
//  RCBowSettingsTableViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class RCBowSettingsTableViewController: UITableViewController {

    // ----------------
    struct CellData {
        let name: String
    }
    // ----------------
    
    
    let headerName = "RCBowSettingsTableViewHeaderFooterView"
    var expandSectionSet = Set<Int>()
    
    var tableDataList = [[CellData]]()
    var sections = ["AAA", "BBB", "CCC", "DDD", "EEE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ---------------------
        tableDataList.append([.init(name: "test_001.txt"),
                              .init(name: "test_002.txt"),
                              .init(name: "test_003.txt")])
        tableDataList.append([.init(name: "test_004.txt"),
                              .init(name: "test_005.txt"),
                              .init(name: "test_006.txt")])
        tableDataList.append([.init(name: "test_007.txt"),
                              .init(name: "test_008.txt")])
        tableDataList.append([.init(name: "test_009.txt"),
                              .init(name: "test_010.txt"),
                              .init(name: "test_011.txt")])
        tableDataList.append([.init(name: "test_012.txt"),
                              .init(name: "test_013.txt")])
        // ---------------------
        
        
        
        tableView.register(UINib(nibName: headerName, bundle: nil), forHeaderFooterViewReuseIdentifier: "RCHeader")
        
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandSectionSet.contains(section) ? tableDataList[section].count : 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RCToolsDetailCell", for: indexPath)
        cell.textLabel?.text = tableDataList[indexPath.section][indexPath.row].name
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RCHeader") as! RCBowSettingsTableViewHeaderFooterView
        header.section = section
        header.delegate = self
        return header
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    

}

extension RCBowSettingsTableViewController: RCBowSettingsTableViewHeaderFooterViewDelegate {
    func RCHeaderFooterView(_ header: RCBowSettingsTableViewHeaderFooterView, section: Int) {
        if expandSectionSet.contains(section) {
            expandSectionSet.remove(section)
        } else {
            expandSectionSet.insert(section)
        }
        tableView.reloadSections([section], with: .automatic)
    }
}
