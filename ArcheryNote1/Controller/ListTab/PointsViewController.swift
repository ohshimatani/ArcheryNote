//
//  PointsViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class PointsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        

    
    @IBOutlet weak var checkPointTableView: UITableView!
    
    let customCellVCName = "CheckPointListTableViewCell"
    let customCellKeyName = "checkPointCustomCell"
    
    var checkPointList: Results<CheckPoint>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkPointTableView.dataSource = self
        checkPointTableView.delegate = self
                
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        checkPointTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        checkPointTableView.tableFooterView = UIView()
        
        
        let realmPath = Realm.Configuration.defaultConfiguration.fileURL!
        let config = Realm.Configuration(fileURL: realmPath, encryptionKey: self.getKey())
        do {
            let realm = try Realm(configuration: config)
            //処理を記述
            print(realmPath)
            print(getKey()!.map { String(format: "%.2hhx", $0) }.joined())
        }
        catch { /*省略*/
            print("fault")
            print(realmPath)
            print
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        let realm = try! Realm()
//        checkPointList = realm.objects(CheckPoint.self).sorted(byKeyPath: "howImportant", ascending: false)
//        self.checkPointTableView.reloadData()
////        print(checkPointList[0])
        print("a")
    }
    
    
    func getKey() -> Data? {
            let key = "1234567890123456789012345678901234567890123456789012345678901234"
            return key.data(using: String.Encoding.utf8, allowLossyConversion: false)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if checkPointList != nil{
            return checkPointList.count
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! CheckPointListTableViewCell
        
        // set color and string for howImportant.
        switch checkPointList[indexPath.row].howImportant {
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
        
        cell.checkPointTextView.text = checkPointList[indexPath.row].checkPoint
        
        
        return cell
    }
    
    

    @IBAction func addCheckPoint(_ sender: Any) {
        performSegue(withIdentifier: "newCheckPoint", sender: nil)
    }
    
    
    
    
}

extension UserDefaults {
  func getCheckPoint(_ key:String) -> [CheckPoint]? {
    // storedData: Data
      if let storedData = self.object(forKey: key) as? Data {
        // unarchivedObject: [CheckPoint] (Data to [CheckPoint])
        if let unarchivedObject = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(storedData) as? [CheckPoint] {
              return unarchivedObject
          }
      }
      return []
  }

  func setCheckPoint(_ checkPoint:[CheckPoint],_ key:String) {
    // data: Data ([CheckPoint] to Data)
      let data = try! NSKeyedArchiver.archivedData(withRootObject: checkPoint, requiringSecureCoding: false)
      self.set(data, forKey: key)
  }
}
