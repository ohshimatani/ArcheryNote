//
//  ComentOuts.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/30.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation

/*
 
 ----------------------------------------------CalenderViewController-------------------------------------------------
 // schedule detail
 //    let labelDate = UILabel(frame: CGRect(x: 5, y: 580, width: 400, height: 50))
 //    //「主なスケジュール」の表示
 //    let labelTitle = UILabel(frame: CGRect(x: 0, y: 530, width: 180, height: 50))
 //    // calender
 //    let dateView = FSCalendar(frame: CGRect(x: 0, y: 100, width: displayWidth, height: displayHeight*0.65))
 //    // display date
 //    let Date = UILabel(frame: CGRect(x: 5, y: 430, width: 200, height: 100))
 
 //        self.dateView.dataSource = self
 //        self.dateView.delegate = self
 //        self.dateView.today = nil
 //        self.dateView.tintColor = .red
 //        self.view.backgroundColor = .white
 //        dateView.backgroundColor = .white
 //        view.addSubview(dateView)
 //
 //        // settings for display date
 //        Date.text = ""
 //        Date.font = UIFont.systemFont(ofSize: 60.0)
 //        Date.textColor = .black
 //        view.addSubview(Date)
 //
 //        // 「主なスケジュール」表示設定
 //        labelTitle.text = ""
 //        labelTitle.textAlignment = .center
 //        labelTitle.font = UIFont.systemFont(ofSize: 20.0)
 //        view.addSubview(labelTitle)
 //
 //        // settings for displaying schedules detail
 //        labelDate.text = ""
 //        labelDate.font = UIFont.systemFont(ofSize: 18.0)
 //        view.addSubview(labelDate)
 
 
 -------------------------------------ListViewController---------------------------------------
 // UserDefaults cannot use for original class.
         // so we have to save as Data, not original class.
 //        guard let checkPoint = try? NSKeyedArchiver.archivedData(withRootObject: _checkPoint, requiringSecureCoding: false) else {
 //            print("in")
 //            return
 //        }
         
         let ud = UserDefaults.standard
         if (ud.object(forKey: UserDefaultsKey) != nil){
 //            guard let _udList = ud.data(forKey: UserDefaultsKey) else {
 //                print("1")
 //                return
 //            }
 //            guard var udList = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(_udList) as? [CheckPoint] else {
 //                print("2")
 //                return
 //            }
             var udList = ud.getCheckPoint(UserDefaultsKey)!
             udList.append(_checkPoint)
             ud.setCheckPoint(udList, UserDefaultsKey)
             ud.synchronize()
         }else{
             print("3")
             let checkPointList = [_checkPoint]
             ud.setCheckPoint(checkPointList, UserDefaultsKey)
             ud.synchronize()
         }


 
 ------------------------------list------------------------------
 
 //            var flag = true
 //            let alart = UIAlertController(title: "削除", message: "本当に削除しますか？", preferredStyle: .alert)
 //            let yesAction = UIAlertAction(title: "はい", style: .default) { (act) in
 //                print("yes")
 //                flag = true
 //            }
 //            let noAction = UIAlertAction(title: "いいえ", style: .cancel) { (act) in
 //                print("no")
 //                flag = false
 //            }
 //            alart.addAction(yesAction)
 //            alart.addAction(noAction)
 //            self.present(alart, animated: true, completion: nil)
 //
 //            if flag{
 //                let realm = try! Realm()
 //                try! realm.write{
 //                    realm.delete(self.trainingMenuList[indexPath.row])
 //                    print("deleted")
 //                }
 //                tableView.deleteRows(at: [indexPath], with: .automatic)
 //            }else{
 //                return
 //            }
 
 
 // picker view
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 1
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return distanceList.count
     }
     
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return distanceList[row]
     }
     
     
     @IBAction func distanceWillChange(_ sender: Any) {
         didTapChangeButton()
     }
     
     func didTapChangeButton(){
         // picker view
         distancePickerView = UIPickerView()
         
         let ratio: CGFloat = 0.4
         let pickerViewRect = CGRect(x: 0, y: self.view.frame.height * (1-ratio) , width: self.view.frame.width, height: self.view.frame.height * ratio)
         distancePickerView.frame = pickerViewRect
 //        distancePickerView.backgroundColor = .blue
         distancePickerView.delegate = self
         distancePickerView.dataSource = self
         let vi = UIView(frame: distancePickerView.bounds)
         vi.backgroundColor = .red
         vi.addSubview(distancePickerView)
         
         // tool bar
         distanceToolBar = UIToolbar()
         distanceToolBar.barStyle = .default
         distanceToolBar.isTranslucent = true
         distanceToolBar.backgroundColor = .black
         let toolBarButton = UIBarButtonItem(title: "Close", style: .done, target: self, action: Selector(("didCilckToolBarButton")))
         distanceToolBar.items = [toolBarButton]
         distanceToolBar.sizeToFit()
         vi.addSubview(distanceToolBar)
 //        distanceToolBar.delegate = self
         
         view.addSubview(vi)
         let screenSize = UIScreen.main.bounds.size
         vi.frame.origin.y = screenSize.height
         UIView.animate(withDuration: 0.3) {
             vi.frame.origin.y = screenSize.height - vi.bounds.size.height
         }
     }
 
 
 
 


    //            let resultArray = Array(result.points)
    //            var strArray: [[[String]]]!
    //            var intArray: [[[Int]]]!
    //            var XArray: [[[Double]]]!
    //            var YArray: [[[Double]]]!
    //            for round in resultArray {
    //                let roundArray = Array(round.points)
    //                var roundStr: [[String]]!
    //                var roundInt: [[Int]]!
    //                var roundLocationX: [[Double]]!
    //                var roundLocationY: [[Double]]!
    //                for end in roundArray {
    //                    let endArray = Array(end.points)
    //                    var endStr: [String]!
    //                    var endInt: [Int]!
    //                    var endLocationX: [Double]!
    //                    var endLocationY: [Double]!
    //                    for num in endArray {
    //                        endStr.append(num.pointString)
    //                        endInt.append(num.pointInt)
    //                        endLocationX.append(num.dotLocationX)
    //                        endLocationY.append(num.dotLocationY)
    //                    }
    //                    roundStr.append(endStr)
    //                    roundInt.append(endInt)
    //                    roundLocationX.append(endLocationX)
    //                    roundLocationY.append(endLocationY)
    //                }
    //                strArray.append(roundStr)
    //                intArray.append(roundInt)
    //                XArray.append(roundLocationX)
    //                YArray.append(roundLocationY)
    //            }
    //            stringScoreSavingList = strArray
    //            intScoreSavingList = intArray
    //            pointXScoreSavingList = XArray
    //            pointYScoreSavingList = YArray

 
 if false {
     let total = List<OneRound>()
     for i in 0..<4 {
         let scoreOneRound = OneRound()
         for j in 0..<6 {
             let scoreOneEnd = PointsOneEnd()
             for k in 0..<6 {
                 let _point = Point()
                 _point.pointString = stringScoreSavingList[i][j][k]
                 _point.pointInt = intScoreSavingList[i][j][k]
                 _point.dotLocationX = pointXScoreSavingList[i][j][k]
                 _point.dotLocationY = pointYScoreSavingList[i][j][k]
                 scoreOneEnd.points.append(_point)
             }
             scoreOneRound.points.append(scoreOneEnd)
         }
         total.append(scoreOneRound)
     }
     
     print(total[0].points[0].points[0].pointInt)
     print(total[0].points[1].points[0].pointInt)
     print(total[0].points[2].points[0].pointInt)
     print(total[0].points[3].points[0].pointInt)
     try! realm.write {
         print("realm write")
         
         result.points = total
         
         result.date = dateText
         result.year = year
         result.month = month
         result.day = day
         result.weekday = weekdayString
         result.title = titleTextField.text!
         result.distanceKey = distanceKey
         result.distance1R = distanceKeys[0]
         result.distance2R = distanceKeys[1]
         result.distance3R = distanceKeys[2]
         result.distance4R = distanceKeys[3]
         if matchSegmentedControl.selectedSegmentIndex == 0 {
             result.isMatch = false
         } else {
             result.isMatch = true
         }
         result.weather = weatherSegmentedControl.selectedSegmentIndex
         result.sight1 = sightTextField1.text!
         result.sight2 = sightTextField2.text!
         result.sight3 = sightTextField3.text!
         result.sight4 = sightTextField4.text!
         result.memo = memo
         result.totalScore = totalScore
         
         realm.add(result)
     }
     
 }
 
 
 */


