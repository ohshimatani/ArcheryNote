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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "BowSettingsTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "bowSettingsCell")
        tableView.tableFooterView = UIView()
        
        let realm = try! Realm()
        bowSettingsRC = realm.objects(BowSettingsRC.self)
        bowSettingsCP = realm.objects(BowSettingsCP.self)
        print(bowSettingsRC.count)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        bowSettingsRC = realm.objects(BowSettingsRC.self)
        bowSettingsCP = realm.objects(BowSettingsCP.self)
        tableView.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.numberOfSegments {
        case 0:
            return bowSettingsRC.count
        case 1:
            return bowSettingsCP.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bowSettingsCell") as! BowSettingsTableViewCell
        
        switch segmentedControl.numberOfSegments {
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if segmentedControl.numberOfSegments == 0 {
            performSegue(withIdentifier: "toRCBowSettings", sender: nil)
        } else if segmentedControl.numberOfSegments == 1 {
            performSegue(withIdentifier: "toCPBowSettings", sender: nil)
        }
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
