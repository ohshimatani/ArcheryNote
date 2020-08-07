//
//  DialySheetViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/30.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class DialySheetViewController: UIViewController{
        
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var placeTextField: UITextField!
    
    @IBOutlet weak var sumOfShootingTextField: UITextField!
    
    @IBOutlet weak var reflectionTextView: UITextView!
    
    @IBOutlet weak var listupTableView: UITableView!
        
    // List: added from any list
    var addedList = [String]()
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    var dateLabelText = "9999年99月99日（日）"
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    var dateText: String!
    
    var dialyAddList: Results<DialyAddList>!
    
    var customCellVCName = "CheckPointListTableViewCell"
    var customCellKeyName = "checkPointCustomCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        // set tableView delegate, dataSource
        self.listupTableView.dataSource = self
        self.listupTableView.delegate = self
        self.listupTableView.tableFooterView = UIView()
        
        // only call number pad (sum of shooting)
        self.sumOfShootingTextField.keyboardType = UIKeyboardType.decimalPad

        
        // reflect date label
        let weekdayString = weekdayList[weekday-1]
        dateLabelText = String(year) + "年" + String(month) + "月" + String(day) + "日（" + weekdayString + "）"

        // set known infomation
        dateLabel.text = dateLabelText
        dateText = String(year) + String(month) + String(day)
        
        // if todays dailySheet already fill, it reflect.
        fillText()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        dialyAddList = realm.objects(DialyAddList.self).filter("date == %@", dateText!)
        listupTableView.reloadData()
    }
    
    
    
    func fillText(){
        let realm = try! Realm()
        let result = realm.objects(DialySheet.self).filter("date == %@", dateText!)
        print(result.count)
        if let todaysDialy = result.first{
            placeTextField.text = todaysDialy.place
            sumOfShootingTextField.text = String(todaysDialy.shotNum)
            reflectionTextView.text = todaysDialy.reflection
        }else{ return }
    }
    
    
    @IBAction func save(_ sender: Any) {
        let shotNum: Int!
        if let num = Int(sumOfShootingTextField.text!){
            shotNum = num
        } else{
            shotNum = 0
        }
        
        let realm = try! Realm()
        let result = realm.objects(DialySheet.self).filter("date == %@", dateText!)
        if let todaysDialy = result.first{
            // case: todays dialy have already fill.
            try! realm.write{
                todaysDialy.date = dateText
                todaysDialy.place = placeTextField.text!
                todaysDialy.shotNum = shotNum
                todaysDialy.reflection = reflectionTextView.text
            }
        }else{
            // case: todays dialy have not fill yet.
            let dialySheet = DialySheet()
            dialySheet.date = dateText
            dialySheet.place = placeTextField.text!
            dialySheet.shotNum = shotNum
            dialySheet.reflection = reflectionTextView.text
            try! realm.write{
                print(Realm.Configuration.defaultConfiguration.fileURL!)
                realm.add(dialySheet)
            }
        }
        print("save")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cansel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func addFromList(_ sender: Any) {
        performSegue(withIdentifier: "addFromList", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFromList" {
            let VC = segue.destination as! AddListDialyViewController
            VC.dateText = dateText
        }
    }
    
    
    
    
    
    
    
}

extension DialySheetViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return addedList.count
        if dialyAddList != nil {
            return dialyAddList.count
        }
        return 0
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "listupTableViewCell")!
//        cell.textLabel?.text = "testtest"
        
        var thisCategory: Int = 0
        var bowCategory = "RC"
        if dialyAddList[indexPath.row].checkPoint != nil {
            customCellVCName = "CheckPointListTableViewCell"
            customCellKeyName = "checkPointCustomCell"
            thisCategory = 0
        }else if dialyAddList[indexPath.row].trainingMenu != nil {
            customCellVCName = "TrainingListTableViewCell"
            customCellKeyName = "trainingCustomCell"
            thisCategory = 1
        }else if dialyAddList[indexPath.row].tuningRC != nil {
            customCellVCName = "TuningListTableViewCell"
            customCellKeyName = "tuningListCustomCell"
            bowCategory = "RC"
            thisCategory = 2
        }else if dialyAddList[indexPath.row].tuningCP != nil {
            customCellVCName = "TuningListTableViewCell"
            customCellKeyName = "tuningListCustomCell"
            bowCategory = "CP"
            thisCategory = 2
        }
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        listupTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        
        switch thisCategory {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! CheckPointListTableViewCell
            switch dialyAddList[indexPath.row].checkPoint.howImportant {
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
            cell.checkPointTextView.text = dialyAddList[indexPath.row].checkPoint.checkPoint
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TrainingListTableViewCell
            cell.trainingTitle.text = dialyAddList[indexPath.row].trainingMenu.title
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TuningListTableViewCell
            if bowCategory == "RC"{
                let focused = dialyAddList[indexPath.row].tuningRC
                let braceHeight = String(focused!.braceHeight)
                let upperTillerHeight = String(focused!.uppertillerHeight)
                let lowerTillerHeight = String(focused!.lowertillerHeight)
                let heightValues = braceHeight + "/" + upperTillerHeight + "/" + lowerTillerHeight
                cell.titleLabel.text = focused!.title
                cell.dateLabel.text = focused!.date
                cell.variableNameLabel.text = "ハイト："
                cell.heightOrPeepLabel.text = heightValues
                cell.nockingPointLabel.text = focused!.nockingPoint
                return cell
            }else if bowCategory == "CP"{
                let focused = dialyAddList[indexPath.row].tuningCP
                cell.titleLabel.text = focused!.title
                cell.dateLabel.text = focused!.date
                cell.variableNameLabel.text = "ピープ："
                cell.heightOrPeepLabel.text = focused!.peep
                cell.nockingPointLabel.text = focused!.nockingPoint
            }
            return cell
            
        default:
            return tableView.dequeueReusableCell(withIdentifier: "checkPointCustomCell") as! TuningListTableViewCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            
            let realm = try! Realm()
            try! realm.write{
                realm.delete(self.dialyAddList[indexPath.row])
                print("deleted")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    

}
