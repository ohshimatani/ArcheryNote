//
//  RCBowSettingsTableViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class RCBowSettingsTableViewController: UITableViewController, RCBowSettingTableViewCellDelegate, OthersInBowSettingsTableViewCellDelegate {
    
    
    let headerName = "RCBowSettingsTableViewHeaderFooterView"
    var expandSectionSet = Set<Int>()
    
    var sections = ["ハンドル", "リム", "矢", "弦", "スタビライザー",
                    "サイト", "プランジャー", "タブ", "その他"]
    
    var textArray = [[String]]()
    var cellIndex = 0
    
    let rowsInSection: [Int] = [2, 3, 6, 4, 4, 1, 1, 1, 1]
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        (year, month, day, weekday) = MyFunctions.getTodayInt()
        
        for sectionNum in rowsInSection {
            var appendedList: [String] = []
            for _ in 0..<sectionNum {
                appendedList.append("")
            }
            textArray.append(appendedList)
        }
        
        
        
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: headerName, bundle: nil), forHeaderFooterViewReuseIdentifier: "RCHeader")
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if expandSectionSet.contains(section) {
            return rowsInSection[section]
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellIndexList = [0, 2, 4, 9, 13, 17, 18, 19, 20]
               
        if indexPath.section == 8 {
            let nib = UINib(nibName: "OthersInBowSettingsTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "bowSettingsOthers")
            let cell = tableView.dequeueReusableCell(withIdentifier: "bowSettingsOthers") as! OthersInBowSettingsTableViewCell
            cell.delegate = self
            return cell
        } else {
            let nib = UINib(nibName: "RCBowSettingsTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "RCBowSettingsDetailCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "RCBowSettingsDetailCell") as! RCBowSettingsTableViewCell
            cell.delegate = self
            cell.setCell(indexPath: indexPath, textArray: textArray)
            
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
    
    
    func getTextFieldInformation(text: String, section: Int, row: Int) {
        textArray[section][row] = text
        print("aaaaaaaaa")
    }
    
    func getTextViewInformation(text: String) {
        textArray[8][0] = text
    }
    
    
    
    
    
    
    @IBAction func save(_ sender: Any) {
        print(textArray)
        tableView.reloadData()
        let realm = try! Realm()
        let _bowSettingsRC = BowSettingsRC()
        _bowSettingsRC.year = year
        _bowSettingsRC.month = month
        _bowSettingsRC.day = day
        _bowSettingsRC.weekday = weekday
        // riser
        _bowSettingsRC.riserName = textArray[0][0]
        _bowSettingsRC.riserSize = textArray[0][1]
        // limb
        _bowSettingsRC.limbName = textArray[1][0]
        _bowSettingsRC.limbPound = textArray[1][1]
        _bowSettingsRC.limbSize = textArray[1][2]
        // arrow
        _bowSettingsRC.arrowName = textArray[2][0]
        _bowSettingsRC.arrowSpine = textArray[2][1]
        _bowSettingsRC.arrowLength = textArray[2][2]
        _bowSettingsRC.arrowPointWeight = textArray[2][3]
        _bowSettingsRC.arrowNock = textArray[2][4]
        _bowSettingsRC.arrowVane = textArray[2][5]
        // string
        _bowSettingsRC.stringOrigin = textArray[3][0]
        _bowSettingsRC.stringSub = textArray[3][1]
        _bowSettingsRC.stringLength = textArray[3][2]
        _bowSettingsRC.stringNum = textArray[3][3]
        // stabilizer
        _bowSettingsRC.centerName = textArray[4][0]
        _bowSettingsRC.centerSize = textArray[4][1]
        _bowSettingsRC.sideName = textArray[4][2]
        _bowSettingsRC.sideSize = textArray[4][3]
        // sight
        _bowSettingsRC.sightName = textArray[5][0]
        // plunger
        _bowSettingsRC.plungerName = textArray[6][0]
        // tab
        _bowSettingsRC.tabName = textArray[7][0]
        // others
        _bowSettingsRC.others = textArray[8][0]
        try! realm.write {
            realm.add(_bowSettingsRC)
        }
        print(_bowSettingsRC)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cansel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
