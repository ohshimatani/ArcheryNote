//
//  RCBowSettingsTableViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class RCBowSettingsTableViewController: UITableViewController {
    
    struct CellData {
        let name: String
    }
    
    let headerName = "RCBowSettingsTableViewHeaderFooterView"
    var expandSectionSet = Set<Int>()
    
    var tableDataList = [[CellData]]()
    var sections = ["ハンドル", "リム", "矢", "弦", "スタビライザー",
                    "サイト", "プランジャー", "タブ", "その他"]
    
    var textArray = [String]()
    var cellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ---------------------
        
        // riser
        tableDataList.append([.init(name: "- 名前"),
                              .init(name: "- サイズ")])
        // limb
        tableDataList.append([.init(name: "- 名前"),
                              .init(name: "- サイズ")])
        // arrow
        tableDataList.append([.init(name: "- 名前"),
                              .init(name: "- スパイン"),
                              .init(name: "- 長さ"),
                              .init(name: "- ノック"),
                              .init(name: "- 羽")])
        // string
        tableDataList.append([.init(name: "- 原糸"),
                              .init(name: "- サービング"),
                              .init(name: "- 長さ"),
                              .init(name: "- ストランド数")])
        // stabilizer
        tableDataList.append([.init(name: "- センターロッド"),
                              .init(name: "      - サイズ"),
                              .init(name: "- センターロッド"),
                              .init(name: "      - サイズ")])
        // sight
        tableDataList.append([.init(name: "- 名前")])
        // plunger
        tableDataList.append([.init(name: "- 名前")])
        // tab
        tableDataList.append([.init(name: "- 名前")])
        // others
        tableDataList.append([.init(name: "- その他")])
        // ---------------------
        
        for _ in 0..<21{
            textArray.append("")
        }
        
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: headerName, bundle: nil), forHeaderFooterViewReuseIdentifier: "RCHeader")
        
        
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandSectionSet.contains(section) ? tableDataList[section].count : 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIndexList = [0, 2, 4, 9, 13, 17, 18, 19, 20]
        if indexPath.section == 8 {
            let nib = UINib(nibName: "OthersInBowSettingsTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "bowSettingsOthers")
            let cell = tableView.dequeueReusableCell(withIdentifier: "bowSettingsOthers") as! OthersInBowSettingsTableViewCell
            cellIndex = 20
            textArray[cellIndex] = cell.othersTextView.text
            return cell
        } else {
            let nib = UINib(nibName: "RCBowSettingsTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "RCBowSettingsDetailCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "RCBowSettingsDetailCell") as! RCBowSettingsTableViewCell
//            cell.delegate = self
            cell.label.text = tableDataList[indexPath.section][indexPath.row].name
            cellIndex = cellIndexList[indexPath.section] + indexPath.row
            textArray[cellIndex] = cell.textField.text!
            return cell
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "RCHeader") as! RCBowSettingsTableViewHeaderFooterView
        header.section = section
        header.sectionLabel.text = sections[section]
        header.sectionLabel.font = .systemFont(ofSize: 18.0, weight: .bold)
        header.delegate = self
        return header
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 8{
            return 130
        }else {
            return 44
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    @IBAction func save(_ sender: Any) {
        tableView.reloadData()
        print(textArray)
        
        
//        let nib = UINib(nibName: "RCBowSettingsTableViewCell", bundle: .main)
//        tableView.register(nib, forCellReuseIdentifier: "RCBowSettingsDetailCell")
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RCBowSettingsDetailCell") as! RCBowSettingsTableViewCell
        
//        let realm = try! Realm()
//        let _bowSettingsRC = BowSettingsRC()
//        _bowSettingsRC.riser["name"] = tableView.cellForRow(at: [0, 0]).textField.text
//        try! realm.write {
//
//        }
        
    }
    
    
    @IBAction func cansel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
    

}

extension RCBowSettingsTableViewController: RCBowSettingsTableViewHeaderFooterViewDelegate {
//    func getTextFieldInformation(cell: RCBowSettingsTableViewCell, inputText: String) {
//        print("よばれたよ")
//        print(cell.textField.text!)
//
//    }
    
    func RCHeaderFooterView(_ header: RCBowSettingsTableViewHeaderFooterView, section: Int) {
        if expandSectionSet.contains(section) {
            expandSectionSet.remove(section)
        } else {
            expandSectionSet.insert(section)
        }
        tableView.reloadSections([section], with: .automatic)
    }
}
