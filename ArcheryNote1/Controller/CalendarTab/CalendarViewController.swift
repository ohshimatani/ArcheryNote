//
//  CalenderViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic
import RealmSwift


// get display size
let displayWidth = UIScreen.main.bounds.size.width
let displayHeight = UIScreen.main.bounds.size.height

class CalenderViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    
    
    @IBOutlet weak var calendar: FSCalendar!
    
    var selectedDate: Date!
    
    let weekdayLabel = ["日", "月", "火", "水", "木", "金", "土"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        // delete all realm data.
//        let realm = try! Realm()
//        try! realm.write{
//            realm.deleteAll()
//        }
        
        
        
        
        
        
        self.calendar.dataSource = self
        self.calendar.delegate = self
        
        
        // set WeekDay text to Japanese
        for i in 0..<calendar.calendarWeekdayView.weekdayLabels.count {
            calendar.calendarWeekdayView.weekdayLabels[i].text = weekdayLabel[i]
            // change label text color
            if i == 0{
                self.calendar.calendarWeekdayView.weekdayLabels[i].textColor = UIColor.red
            }else if i == 6{
                self.calendar.calendarWeekdayView.weekdayLabels[i].textColor = UIColor.blue
            }else{
                self.calendar.calendarWeekdayView.weekdayLabels[i].textColor = UIColor.black
            }
        }
                
        // add todays something(score, daily and schedule)
        let addButton = UIButton()
        addButton.frame = CGRect(x: displayWidth/2 - displayWidth/10, y: displayHeight * 0.8, width: displayWidth/5, height: displayWidth/5)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = UIFont.systemFont(ofSize: displayWidth/7.5, weight: .light)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .blue
        addButton.layer.cornerRadius = addButton.bounds.width / 2.0
        addButton.clipsToBounds = true
        
        // Action: tap addButton
        addButton.addTarget(self, action: #selector(addTodaysThings(_:)), for: .touchUpInside)
        self.view.addSubview(addButton)
        
        
    }
    
    func getToday() -> (Int, Int, Int, Int){
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let weekday = tmpDate.component(.weekday, from: date)
        return (year, month, day, weekday)
    }
    
    func toAddSomethingViewController(year: Int, month: Int, day: Int, weekday: Int){
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "toAddSomething") as! AddSomethingViewController
        VC.year = year
        VC.month = month
        VC.day = day
        VC.weekday = weekday
        self.present(VC, animated: true, completion: nil)
    }
    
    @objc func addTodaysThings(_: UIButton){
        var year = 9999
        var month = 99
        var day = 99
        var weekday = 1
        (year, month, day, weekday) = getToday()
        toAddSomethingViewController(year: year, month: month, day: day, weekday: weekday)
    }
    
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    
    // Method: judge Holiday and return
    func judgeHoliday(_ date : Date) -> Bool {
        // Instance: Calender(for judge Holiday)
        let tmpCalendar = Calendar(identifier: .gregorian)

        // get date of Holiday
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)

        let holiday = CalculateCalendarLogic()

        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }


    // get date(year, month, day) for Int
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    
    // get day of the week index
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }


    // change color of Saturday, Sunday and Holiday
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        
        // judge Holiday or not
        if self.judgeHoliday(date){
            return UIColor.red
        }
        
        // judge Saturday or Sunday or not
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        }else if weekday == 7 {
            return UIColor.blue
        }
        

        return nil
    }
    
    // tap date(tap didSelctDate -> add something VC)
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if selectedDate == date{
            let tmpDate = Calendar(identifier: .gregorian)
            let year = tmpDate.component(.year, from: date)
            let month = tmpDate.component(.month, from: date)
            let day = tmpDate.component(.day, from: date)
            let weekday = tmpDate.component(.weekday, from: date)
            print(year, month, day, weekday)
            toAddSomethingViewController(year: year, month: month, day: day, weekday: weekday)
        }else{
            selectedDate = date
        }
    }
    
    
    
    
}
