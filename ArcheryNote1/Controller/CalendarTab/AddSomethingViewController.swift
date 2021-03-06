//
//  AddSomethingViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/30.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift


class AddSomethingViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var todayScheduleTextView: UITextView!
    
    @IBOutlet weak var addScheduleButton: UIButton!
    
    @IBOutlet weak var addScoreButton: UIButton!
    
    @IBOutlet weak var addDialyButton: UIButton!
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    var dateLabelText = "9999年99月99日（日）"
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    
    var dialySheet: Results<DialySheet>!
    let shotNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // settings buttons interface
        let buttonsList = [addScheduleButton, addScoreButton, addDialyButton]
        for button in buttonsList{
            button!.layer.cornerRadius = 5.0
            button!.clipsToBounds = true
        }
//        checkTodaysListButton.layer.cornerRadius = 20.0
                
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        let realm = try! Realm()
        // set todays date(from previous VC)
        let weekdayString = weekdayList[weekday-1]
        dateLabelText = String(year) + "年" + String(month) + "月" + String(day) + "日（" + weekdayString + "）"
        let dateText = String(format: "%04d", year) + String(format: "%02d", month) + String(format: "%02d", day)
        dialySheet = realm.objects(DialySheet.self).filter("date == %@", dateText)
        if let shotNum = dialySheet.first?.shotNum {
            dateLabelText += " : " + String(shotNum) + "本"
        }
        
        dateLabel.text = dateLabelText
        

        
        var scheduleText = ""
        let _todaySchedules: Results<Schedule> = realm.objects(Schedule.self).filter("date == %@", dateText)
        if _todaySchedules.count != 0{
            for schedule in _todaySchedules{
                let scheduleCategoryList = ["（試　合）", "（練　習）", "（その他）"]
                scheduleText += "- " + scheduleCategoryList[schedule.category] +  schedule.title + "\n"
                todayScheduleTextView.text = scheduleText
                todayScheduleTextView.font = .systemFont(ofSize: 20.0, weight: .bold)
            }
        }else{
            todayScheduleTextView.text = "未登録"
        }
        
        
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDialySheet"{
            let NC = segue.destination as! UINavigationController
            let VC = NC.topViewController as! DialySheetViewController
            VC.year = year
            VC.month = month
            VC.day = day
            VC.weekday = weekday
        }else if segue.identifier == "toAddSchedule"{
            let NC = segue.destination as! UINavigationController
            let VC = NC.topViewController as! ScheduleViewController
            VC.year = year
            VC.month = month
            VC.day = day
            VC.weekday = weekday
        }else if segue.identifier == "toScheduleEdit"{
            let NC = segue.destination as! UINavigationController
            let VC = NC.topViewController as! ScheduleEditViewController
//            print(month, day)
            VC.year = year
            VC.month = month
            VC.day = day
            VC.weekday = weekday
        } else if segue.identifier == "toScoreSheet" {
            let NC = segue.destination as! UINavigationController
            let VC = NC.topViewController as! ScoreListViewController
            VC.year = year
            VC.month = month
            VC.day = day
            VC.weekday = weekday
        }
    }

    

    
    @IBAction func toDialySheet(_ sender: Any) {
        performSegue(withIdentifier: "toDialySheet", sender: nil)
    }
    
    
    @IBAction func toAddSchedule(_ sender: Any) {
        performSegue(withIdentifier: "toAddSchedule", sender: nil)
    }
    
    
    @IBAction func toScoreSheet(_ sender: Any) {
        performSegue(withIdentifier: "toScoreSheet", sender: nil)
    }
    
    
    @IBAction func toSheduleEdit(_ sender: Any) {
        performSegue(withIdentifier: "toScheduleEdit", sender: nil)
    }
    
    
    
}
