//
//  ScheduleEditViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/06.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class ScheduleEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    @IBOutlet weak var scheduleListTableView: UITableView!
    
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    var dateLabelText = "9999年99月99日（日）"
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    var dateText: String!
    
    var _schedule: Results<Schedule>!
    var passCategory = 0
    var passTitle = ""
    var passMemo = ""
    
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduleListTableView.delegate = self
        scheduleListTableView.dataSource = self
        
        let weekdayString = weekdayList[weekday-1]
        dateLabelText = String(year) + "年" + String(month) + "月" + String(day) + "日（" + weekdayString + "）"
        self.navigationItem.title = dateLabelText
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dateText = String(format: "%04d", year) + String(format: "%02d", month) + String(format: "%02d", day)
        
        let realm = try! Realm()
        _schedule = realm.objects(Schedule.self).filter("date == %@", dateText!)
        scheduleListTableView.reloadData()
        
    }
    
    
    @IBAction func addNewSchedule(_ sender: Any) {
        performSegue(withIdentifier: "addNewSchedule", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addNewSchedule"{
            if isEdit {
                let NC = segue.destination as! UINavigationController
                let VC = NC.topViewController as! ScheduleViewController
                VC.year = year
                VC.month = month
                VC.day = day
                VC.weekday = weekday
            }else{
                let NC = segue.destination as! UINavigationController
                let VC = NC.topViewController as! ScheduleViewController
                VC.year = year
                VC.month = month
                VC.day = day
                VC.weekday = weekday
                // passed model information
                VC.selectedNumber = passCategory
                VC.titleTextFieldText = passTitle
                VC.memoTextViewText = passMemo
                VC.isEdit = true
                passCategory = 0
                passTitle = ""
                passMemo = ""
            }
        }
    }
    
    
    @IBAction func done(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _schedule.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleListCell", for: indexPath)
        let scheduleCategoryList = ["（試　合）", "（練　習）", "（その他）"]
        let categoryIndex = _schedule[indexPath.row].category
        
        cell.detailTextLabel?.text = scheduleCategoryList[categoryIndex]
        cell.textLabel?.text = _schedule[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        passTitle = _schedule[indexPath.row].title
        passCategory = _schedule[indexPath.row].category
        passMemo = _schedule[indexPath.row].memo
        
        performSegue(withIdentifier: "addNewSchedule", sender: nil)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            
            let realm = try! Realm()
            try! realm.write{
                realm.delete(self._schedule[indexPath.row])
                print("deleted")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }

    
    
    
        
}
