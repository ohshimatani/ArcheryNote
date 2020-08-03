//
//  AddSomethingViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/30.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class AddSomethingViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var checkTodaysListButton: UIButton!
    
    @IBOutlet weak var addScheduleButton: UIButton!
    
    @IBOutlet weak var addScoreButton: UIButton!
    
    @IBOutlet weak var addDialyButton: UIButton!
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    var dateLabelText = "9999年99月99日（日）"
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set todays date(from previous VC)
        let weekdayString = weekdayList[weekday-1]
        dateLabelText = String(year) + "年" + String(month) + "月" + String(day) + "日（" + weekdayString + "）"
        dateLabel.text = dateLabelText
        
        // settings buttons interface
        let buttonsList = [addScheduleButton, addScoreButton, addDialyButton]
        for button in buttonsList{
            button!.layer.cornerRadius = button!.bounds.width / 2.0
            button!.clipsToBounds = true
        }
        checkTodaysListButton.layer.cornerRadius = 20.0
                
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
        }
    }

    

    
    @IBAction func toDialySheet(_ sender: Any) {
        performSegue(withIdentifier: "toDialySheet", sender: nil)
    }
    
    
        
    
    
    
}
