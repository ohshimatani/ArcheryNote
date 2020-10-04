//
//  CPBowSettingsTableViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class CPBowSettingsTableViewController: UITableViewController, CPBowSettingTableViewCellDelegate, OthersInBowSettingsTableViewCellDelegate {
    
    let headerName = "RCBowSettingsTableViewHeaderFooterView"
    var expandSectionSet = Set<Int>()
    
    var sections = ["ハンドル", "サイト", "スタビライザー", "矢", "リリーサー", "その他"]
    var textArray = [[String]]()
    var callIndex = 0
    
    let rowsInSection: [Int] = [4, 6, 3, 6, 1, 1]
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    
    var isEdit: Bool = false
    var result: BowSettingsCP!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // initialize textArray
        for sectionNum in rowsInSection {
            var appendList: [String] = []
            for _ in 0..<sectionNum {
                appendList.append("")
            }
            textArray.append(appendList)
        }
        
        if result != nil {
            year = result.year
            month = result.month
            day = result.day
            weekday = result.weekday
            // riser
            textArray[0][0] = result.riserName
            // sight
            
            // stabilizer
            
            // arrow
            
            // releaser
            
            // other
            
            
        } else {
            (year, month, day, weekday) = MyFunctions.getTodayInt()
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
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 5 {
            let nib = UINib(nibName: "OthersInBowSettingsTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "bowSettingsOthers")
            let cell = tableView.dequeueReusableCell(withIdentifier: "bowSettingsOthers") as! OthersInBowSettingsTableViewCell
            cell.delegate = self
            return cell
        } else {
            let nib = UINib(nibName: "CPBowSettingsTableViewCell", bundle: .main)
            tableView.register(nib, forCellReuseIdentifier: "CPBowSettingsDetailCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "CPBowSettingsDetailCell") as! CPBowSettingsTableViewCell
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
        if indexPath.section == 5 {
            return 130
        } else {
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
    }
    
    func getTextViewInformation(text: String) {
        textArray[5][0] = text
    }
    
    
    @IBAction func save(_ sender: Any) {
        print(textArray)
        tableView.reloadData()
        let realm = try! Realm()
        let _bowSettingsCP = BowSettingsCP()
        _bowSettingsCP.year = year
        _bowSettingsCP.month = month
        _bowSettingsCP.day = day
        _bowSettingsCP.weekday = weekday
        // riser
        _bowSettingsCP.riserName = textArray[0][0]
        _bowSettingsCP.riserLength = textArray[0][1]
        _bowSettingsCP.riserAxcel = textArray[0][2]
        _bowSettingsCP.riserPound = textArray[0][3]
        // sight
        _bowSettingsCP.sightName = textArray[1][0]
        _bowSettingsCP.sightMagnification = textArray[1][1]
        _bowSettingsCP.sightRadius = textArray[1][2]
        _bowSettingsCP.sightDot = textArray[1][3]
        _bowSettingsCP.sightRing = textArray[1][4]
        _bowSettingsCP.sightFiber = textArray[1][5]
        // stabilizer
        _bowSettingsCP.stabilizerName = textArray[2][0]
        _bowSettingsCP.stabilizerLength = textArray[2][1]
        _bowSettingsCP.stabilizerWeight = textArray[2][2]
        // arrow
        _bowSettingsCP.arrowName = textArray[3][0]
        _bowSettingsCP.arrowSpine = textArray[3][1]
        _bowSettingsCP.arrowLength = textArray[3][2]
        _bowSettingsCP.arrowPointWeight = textArray[3][3]
        _bowSettingsCP.arrowNock = textArray[3][4]
        _bowSettingsCP.arrowVane = textArray[3][5]
        // releaser
        _bowSettingsCP.releaserName = textArray[4][0]
        // others
        _bowSettingsCP.others = textArray[5][0]
        try! realm.write {
            realm.add(_bowSettingsCP)
            if isEdit == true {
                realm.delete(result)
            }
        }
        print(_bowSettingsCP)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cansel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

extension CPBowSettingsTableViewController: RCBowSettingsTableViewHeaderFooterViewDelegate {
    func RCHeaderFooterView(_ header: RCBowSettingsTableViewHeaderFooterView, section: Int) {
        if expandSectionSet.contains(section) {
            expandSectionSet.remove(section)
        } else {
            expandSectionSet.insert(section)
        }
        tableView.reloadSections([section], with: .automatic)
    }
}
