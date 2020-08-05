//
//  AddListDialyViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class AddListDialyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var addTableView: UITableView!
    
    
    
    var selectedNumber: Int = 0
    var checkPointList: Results<CheckPoint>!
    var trainingMenuList: Results<TrainingMenu>!
    var CPTuningList: Results<TuningCP>!
    var RCTuningList: Results<TuningRC>!
    
    let globalBowDiscipline = "RC"
    
    var customCellVCName = "CheckPointListTableViewCell"
    var customCellKeyName = "checkPointCustomCell"
    
    var tableViewRowNumbers = [0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTableView.delegate = self
        addTableView.dataSource = self
        
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        addTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        addTableView.tableFooterView = UIView()
        
        
        let realm = try! Realm()
        checkPointList = realm.objects(CheckPoint.self).sorted(byKeyPath: "howImportant", ascending: false)
        trainingMenuList = realm.objects(TrainingMenu.self)
        CPTuningList = realm.objects(TuningCP.self)
        RCTuningList = realm.objects(TuningRC.self)
        
        
        if globalBowDiscipline == "CP" {
            tableViewRowNumbers = [checkPointList.count, trainingMenuList.count, CPTuningList.count]
        }else{
            tableViewRowNumbers = [checkPointList.count, trainingMenuList.count, RCTuningList.count]
        }
        
        
        
        
        
    }
    
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        selectedNumber = sender.selectedSegmentIndex
        switch sender.selectedSegmentIndex {
        case 0:
            customCellVCName = "CheckPointListTableViewCell"
            customCellKeyName = "checkPointCustomCell"
            break
        case 1:
            customCellVCName = "TrainingListTableViewCell"
            customCellKeyName = "trainingCustomCell"
            break
        case 2:
            customCellVCName = "TuningListTableViewCell"
            customCellKeyName = "tuningListCustomCell"
            break
        default:
            break
        }
        
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        addTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        addTableView.tableFooterView = UIView()
        addTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRowNumbers[selectedNumber]
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch selectedNumber {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! CheckPointListTableViewCell
            switch checkPointList[indexPath.row].howImportant {
            case 0:
                cell.howImportantColor.backgroundColor = UIColor.blue
                cell.howImportantLabel.text = "低"
                break
            case 1:
                cell.howImportantColor.backgroundColor = UIColor.systemYellow
                cell.howImportantLabel.text = "中"
                break
            case 2:
                cell.howImportantColor.backgroundColor = UIColor.red
                cell.howImportantLabel.text = "高"
                break
            default:
                print("default")
                break
            }
            cell.checkPointTextView.text = checkPointList[indexPath.row].checkPoint
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TrainingListTableViewCell
            cell.trainingTitle.text = trainingMenuList[indexPath.row].title
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TuningListTableViewCell
            if globalBowDiscipline == "RC"{
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
                return cell
            }else if globalBowDiscipline == "CP"{
                let focused = CPTuningList[indexPath.row]
                cell.titleLabel.text = focused.title
                cell.dateLabel.text = focused.date
                cell.variableNameLabel.text = "ピープ："
                cell.heightOrPeepLabel.text = focused.peep
                cell.nockingPointLabel.text = focused.nockingPoint
            }
        default:
            break
        }
        
        return tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TuningListTableViewCell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "追加") { (_, _, completionHandler) in
            
//            let realm = try! Realm()
//            try! realm.write{
//                realm.delete(self.checkPointList[indexPath.row])
//                switch selectedNumber{
//                case 0:
//
//                }
//            }
//            self.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
            completionHandler(true)
        }
        action.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [action])
    }

    
    
}
