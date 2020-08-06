//
//  TrainingListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class TrainingListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    
    @IBOutlet weak var trainingListTableView: UITableView!
    
    
    let customCellVCName = "TrainingListTableViewCell"
    let customCellKeyName = "trainingCustomCell"
    
    var passTitle = ""
    var passTrainingMenu = ""
    var passMemo = ""
    var trainingMenuList: Results<TrainingMenu>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let realm = try! Realm()
//        trainingMenuList = realm.objects(TrainingMenu.self)
        
        trainingListTableView.delegate = self
        trainingListTableView.dataSource = self
        
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        trainingListTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        trainingListTableView.tableFooterView = UIView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        trainingMenuList = realm.objects(TrainingMenu.self)
        trainingListTableView.reloadData()
//        print(trainingMenuList[0])
    }
    
    
    
    @IBAction func addTrainingMenu(_ sender: Any) {
        performSegue(withIdentifier: "newTrainingMenu", sender: nil)
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if trainingMenuList != nil{
            return trainingMenuList.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: customCellKeyName) as! TrainingListTableViewCell
        cell.trainingTitle.text = trainingMenuList[indexPath.row].title

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            
            let realm = try! Realm()
            try! realm.write{
                realm.delete(self.trainingMenuList[indexPath.row])
                print("deleted")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passTitle = trainingMenuList[indexPath.row].title
        passTrainingMenu = trainingMenuList[indexPath.row].detail
        passMemo = trainingMenuList[indexPath.row].memo
        performSegue(withIdentifier: "newTrainingMenu", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newTrainingMenu" {
            let NC = segue.destination as! UINavigationController
            let VC = NC.topViewController as! AddTrainingViewController
            VC.titleText = passTitle
            VC.trainingMenuText = passTrainingMenu
            VC.memoText = passMemo
            VC.isEdit = true
            passTitle = ""
            passTrainingMenu = ""
            passMemo = ""
        }
    }

    

}
