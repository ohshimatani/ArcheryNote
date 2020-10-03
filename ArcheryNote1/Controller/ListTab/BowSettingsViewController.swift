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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nib = UINib(nibName: "BowSettingsTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "bowSettingsCell")
        tableView.tableFooterView = UIView()
        
        let realm = try! Realm()
        let bowSettingsRC = realm.objects(BowSettingsRC.self)
//        let bowSettingsCP = realm.objects(BowSettingsCP.self)
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bowSettingsCell") as! BowSettingsTableViewCell
        
        return cell
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
    
   
    
    
    
    
}
