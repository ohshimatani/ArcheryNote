//
//  ScheduleViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class ScheduleViewController: UIViewController {
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    var year: Int!
    var month: Int!
    var day: Int!
    var weekday: Int!
    var dateLabelText = "9999年99月99日（日）"
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    var dateText: String!
    var selectedNumber: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reflect date label
        let weekdayString = weekdayList[weekday-1]
        dateLabelText = String(year) + "年" + String(month) + "月" + String(day) + "日（" + weekdayString + "）"

        // set known infomation
        dateLabel.text = dateLabelText
        dateText = String(year) + String(month) + String(day)
        print(dateText)
        
        
        
        
        
    }
    
    
    @IBAction func textFieldButtonActionInActive(_ sender: Any) {
        if titleLabel.text != nil{
            saveButton.isEnabled = true
        }else{
            saveButton.isEnabled = false
        }
    }
    
    
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedNumber = 0
            break
        case 1:
            selectedNumber = 1
            break
        case 2:
            selectedNumber = 2
            break
        default:
            break
        }
    }
    
    
    
    
    
    @IBAction func save(_ sender: Any) {
        let realm = try! Realm()
        let _shcedule = Schedule()
        _shcedule.date = dateText
        _shcedule.title = titleLabel.text!
        _shcedule.category = selectedNumber
        _shcedule.memo = memoTextView.text
        try! realm.write {
            realm.add(_shcedule)
            print("done")
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
    }
    
    
    @IBAction func clear(_ sender: Any) {
        titleLabel.text = ""
        categorySegmentedControl.selectedSegmentIndex = 0
        memoTextView.text = ""
    }
    
    
    
    
    
    

}
