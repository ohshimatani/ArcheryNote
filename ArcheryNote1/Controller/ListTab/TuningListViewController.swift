//
//  TuningListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class TuningListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var tuningTableView: UITableView!
    
    var selectedNumber = 0
    var RCTuningList: Results<TuningRC>!
    var CPTuningList: Results<TuningCP>!
    
    let customCellVCName = "TuningListTableViewCell"
    let customCellKeyName = "tuningListCustomCell"
    
    var passResultRC = TuningRC()
    var passResultCP = TuningCP()
    var isEdit = false
    
    var isCPPlayer: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tuningTableView.delegate = self
        tuningTableView.dataSource = self
        
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        tuningTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        tuningTableView.tableFooterView = UIView()
        
        isCPPlayer = UserDefaults.standard.bool(forKey: "isCPPlayer")
        if isCPPlayer == true {
            segmentedControl.selectedSegmentIndex = 1
        } else {
            segmentedControl.selectedSegmentIndex = 0
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        RCTuningList = realm.objects(TuningRC.self).sorted(byKeyPath: "date", ascending: false)
        CPTuningList = realm.objects(TuningCP.self).sorted(byKeyPath: "date", ascending: false)
        self.tuningTableView.reloadData()
    }
    
    
    @IBAction func actionSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedNumber = 0
            tuningTableView.reloadData()
            break
        case 1:
            selectedNumber = 1
            tuningTableView.reloadData()
            break
        default:
            break
        }
    }
    

    @IBAction func addTuning(_ sender: Any) {
        if selectedNumber == 0 {
            performSegue(withIdentifier: "newTuningRC", sender: nil)
        }else if selectedNumber == 1{
            performSegue(withIdentifier: "newTuningCP", sender: nil)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedNumber == 0{
            if RCTuningList == nil {
                return 0
            }
            return RCTuningList.count
        }else if selectedNumber == 1{
            if CPTuningList == nil {
                return 0
            }
            return CPTuningList.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TuningListTableViewCell
        
        switch selectedNumber {
        case 0:
            let focused = RCTuningList[indexPath.row]
            let braceHeight = String(focused.braceHeight)
            let upperTillerHeight = String(focused.uppertillerHeight)
            let lowerTillerHeight = String(focused.lowertillerHeight)
            let heightValues = braceHeight + "/" + upperTillerHeight + "/" + lowerTillerHeight
            cell.titleLabel.text = focused.title
            cell.dateLabel.text = focused.date
            cell.variableNameLabel.text = "ハイト："
            cell.heightOrPeepLabel.text = heightValues
            cell.nockingPointLabel.text = focused.nockingPoint
            break
        case 1:
            let focused = CPTuningList[indexPath.row]
            cell.titleLabel.text = focused.title
            cell.dateLabel.text = focused.date
            cell.variableNameLabel.text = "ピープ："
            cell.heightOrPeepLabel.text = focused.peep
            cell.nockingPointLabel.text = focused.nockingPoint
            break
        default:
            break
        }
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            
            let realm = try! Realm()
            try! realm.write{
                if self.selectedNumber == 0{
                    realm.delete(self.RCTuningList[indexPath.row])
                }else{
                    realm.delete(self.CPTuningList[indexPath.row])
                }
                print("deleted")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isEdit = true
        switch selectedNumber {
        case 0:
            passResultRC = RCTuningList[indexPath.row]
            performSegue(withIdentifier: "newTuningRC", sender: nil)
        case 1:
            passResultCP = CPTuningList[indexPath.row]
            performSegue(withIdentifier: "newTuningCP", sender: nil)
        default:
            break
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isEdit{
            if segue.identifier == "newTuningRC"{
                let NC = segue.destination as! UINavigationController
                let VC = NC.topViewController as! AddRCTuningViewController
                VC.result = passResultRC
                VC.isEdit = true
                passResultRC = TuningRC()
            }else if segue.identifier == "newTuningCP"{
                let NC = segue.destination as! UINavigationController
                let VC = NC.topViewController as! AddCPTuningViewController
                VC.result = passResultCP
                VC.isEdit = true
                passResultCP = TuningCP()
            }
            isEdit = false
        }
        
    }

    
    
}
