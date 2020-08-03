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
    
    
    
    
    
    
}

extension DialySheetViewController: UITableViewDelegate, UITableViewDataSource{
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            //return addedList.count
            return 3
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "listupTableViewCell")!
            cell.textLabel?.text = "testtest"
            return cell
        }

}
