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

 
 
 */


