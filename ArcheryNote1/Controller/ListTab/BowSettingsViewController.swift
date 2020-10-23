//
//  BowSettingsViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class BowSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var bowSettingsRC: Results<BowSettingsRC>!
    var bowSettingsCP: Results<BowSettingsCP>!
    var passResultRC = BowSettingsRC()
    var passResultCP = BowSettingsCP()
    
    var isEdit: Bool = false
    
    var isCPPlayer: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "BowSettingsTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "bowSettingsCell")
        tableView.tableFooterView = UIView()
        
        isCPPlayer = UserDefaults.standard.bool(forKey: "isCPPlayer")
        if isCPPlayer == true {
            segmentedControl.selectedSegmentIndex = 1
        } else {
            segmentedControl.selectedSegmentIndex = 0
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        bowSettingsRC = realm.objects(BowSettingsRC.self)
        bowSettingsCP = realm.objects(BowSettingsCP.self)
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            if bowSettingsRC != nil {
                return bowSettingsRC.count
            } else {
                return 0
            }
        case 1:
            if bowSettingsCP != nil {
                return bowSettingsCP.count
            } else {
                return 0
            }
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bowSettingsCell") as! BowSettingsTableViewCell
        
        switch segmentedControl.selectedSegmentIndex {
        // RC
        case 0:
            let bowSetting = bowSettingsRC[indexPath.row]
            let riserList: [String] = [bowSetting.riserName, bowSetting.riserSize]
            let limbList: [String] = [bowSetting.limbName, bowSetting.limbSize, bowSetting.limbPound]
            let arrowList: [String] = [bowSetting.arrowName, bowSetting.arrowSpine, bowSetting.arrowLength]
            cell.setCellRC(year: bowSetting.year, month: bowSetting.month, day: bowSetting.day, weekday: bowSetting.weekday, riserList: riserList, limbList: limbList, arrowList: arrowList, other: bowSetting.others)
            return cell
        // CP
        case 1:
            let bowSetting = bowSettingsCP[indexPath.row]
            let riserList: [String] = [bowSetting.riserName, bowSetting.riserLength, bowSetting.riserAxcel, bowSetting.riserPound]
            let sightList: [String] = [bowSetting.sightName, bowSetting.sightMagnification, bowSetting.sightRadius]
            let arrowList: [String] = [bowSetting.arrowName, bowSetting.arrowSpine, bowSetting.arrowLength]
            cell.setCellCP(year: bowSetting.year, month: bowSetting.month, day: bowSetting.day, weekday: bowSetting.weekday, riserList: riserList, sightList: sightList, arrowList: arrowList, other: bowSetting.others)
            return cell
        // default
        default:
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            let alert = UIAlertController(title: "削除", message: "本当に削除しますか？", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "はい", style: .cancel) { [self] (action) in
                print("ok")
                
                let realm = try! Realm()
                try! realm.write{
                    if segmentedControl.selectedSegmentIndex == 0{
                        realm.delete(self.bowSettingsRC[indexPath.row])
                    }else{
                        realm.delete(self.bowSettingsCP[indexPath.row])
                    }
                    print("deleted")
                }
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                completionHandler(true)
                
            }
            let NGAction = UIAlertAction(title: "いいえ", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
                completionHandler(false)
            }
            alert.addAction(OKAction)
            alert.addAction(NGAction)
            self.present(alert, animated: true, completion: nil)

            
        }
        
        return UISwipeActionsConfiguration(actions: [action])
        
        
        
        
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        isEdit = true
        if segmentedControl.selectedSegmentIndex == 0 {
            passResultRC = bowSettingsRC[indexPath.row]
            performSegue(withIdentifier: "toRCBowSettings", sender: nil)
        } else if segmentedControl.selectedSegmentIndex == 1 {
            passResultCP = bowSettingsCP[indexPath.row]
            performSegue(withIdentifier: "toCPBowSettings", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isEdit {
            if segue.identifier == "toRCBowSettings" {
                let NC = segue.destination as! UINavigationController
                let VC = NC.topViewController as! RCBowSettingsTableViewController
                VC.isEdit = true
                VC.result = passResultRC
            }
            if segue.identifier == "toCPBowSettings" {
                let NC = segue.destination as! UINavigationController
                let VC = NC.topViewController as! CPBowSettingsTableViewController
                VC.isEdit = true
                VC.result = passResultCP
            }
        }
        isEdit = false
        
    }


    
    @IBAction func addBowSettings(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            performSegue(withIdentifier: "toRCBowSettings", sender: nil)
        case 1:
            performSegue(withIdentifier: "toCPBowSettings", sender: nil)
        default:
            break
        }
    }
    
   
    @IBAction func tapSegmentedControl(_ sender: Any) {
        tableView.reloadData()
    }
    
    
    
    
}
