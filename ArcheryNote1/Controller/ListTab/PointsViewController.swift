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
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        checkPointList = realm.objects(CheckPoint.self).sorted(byKeyPath: "howImportant", ascending: false)
        self.checkPointTableView.reloadData()
        print(checkPointList[0])
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            
            let realm = try! Realm()
            try! realm.write{
                realm.delete(self.checkPointList[indexPath.row])
                print("deleted")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }

    
    
}


