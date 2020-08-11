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
    var titleTextFieldText: String = ""
    var memoTextViewText: String = ""
    var isEdit = false
    
    var result: Schedule!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // reflect date label
        let weekdayString = weekdayList[weekday-1]
        dateLabelText = String(year) + "年" + String(month) + "月" + String(day) + "日（" + weekdayString + "）"

        // set known infomation
        dateLabel.text = dateLabelText
        dateText = String(format: "%04d", year) + String(format: "%02d", month) + String(format: "%02d", day)
        categorySegmentedControl.selectedSegmentIndex = selectedNumber
        titleLabel.text = titleTextFieldText
        memoTextView.text = memoTextViewText
        
        if isEdit {
            let realm = try! Realm()
//            let predicate = NSPredicate(format: "date == %@ AND title == %@ AND category == %@ AND memo == %@", dateText, titleTextFieldText, selectedNumber, memoTextViewText)
            result = realm.objects(Schedule.self).filter("date == %@ AND title == %@ AND category == %@ AND memo == %@", dateText!, titleTextFieldText, selectedNumber, memoTextViewText).first
        }
        
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
        if isEdit{
            try! realm.write {
                print(titleLabel.text!)
                result.title = titleLabel.text!
                result.category = selectedNumber
                result.memo = memoTextView.text
            }
        }else{
            let _shcedule = Schedule()
            _shcedule.date = dateText
            _shcedule.title = titleLabel.text!
            _shcedule.category = selectedNumber
            _shcedule.memo = memoTextView.text
            try! realm.write {
                realm.add(_shcedule)
                print("done")
            }
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func clear(_ sender: Any) {
        titleLabel.text = ""
        categorySegmentedControl.selectedSegmentIndex = 0
        memoTextView.text = ""
    }
    
    
    
    
    
    

}
