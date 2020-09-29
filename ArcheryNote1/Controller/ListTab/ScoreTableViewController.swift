//
//  ScoreTableViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/11.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class ScoreTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var scoreTableView: UITableView!
    
    var scoreSheets: Results<ScoreSheet>!
    
    
    var passResult = ScoreSheet()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        
        
        let nib = UINib(nibName: "ScoreTableTableViewCell", bundle: .main)
        scoreTableView.register(nib, forCellReuseIdentifier: "scoreTableCell")
        scoreTableView.tableFooterView = UIView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        let obj = realm.objects(ScoreSheet.self)
        if obj.count != 0 {
            scoreSheets = obj.sorted(byKeyPath: "date", ascending: true)
        } else {
            scoreSheets = obj
        }
        scoreTableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if scoreSheets != nil {
            return scoreSheets.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreTableCell") as! ScoreTableTableViewCell
        let scoreSheet = scoreSheets[indexPath.row]
        cell.setCell(date: scoreSheet.date, weekday: scoreSheet.weekday, distance: scoreSheet.distanceKey, totalScore: scoreSheet.totalScore, isMatch: scoreSheet.isMatch, title: scoreSheet.title)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Calendar", bundle: nil)
        let NC: UINavigationController = storyboard.instantiateViewController(identifier: "scoreSheetNC") as! UINavigationController
        let VC = NC.viewControllers[0] as! ScoreListViewController
        passResult = scoreSheets[indexPath.row]
//        if let year = passResult.date[0..<4] as Int {
//            if let month = passResult.date[4..<6] as Int {
//                if let day = passResult.date[6..<8] as Int {
//
//                }
//            }
//
//        }
        
        VC.result = passResult
        VC.isEdit = true
        NC.modalPresentationStyle = .fullScreen
        self.present(NC, animated: true, completion: nil)
//        passResult = ScoreSheet()
        scoreTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            
            let realm = try! Realm()
            try! realm.write{
                realm.delete(self.scoreSheets[indexPath.row])
                print("deleted")
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    @IBAction func toBestAndAverageScore(_ sender: Any) {
        performSegue(withIdentifier: "toBestScores", sender: nil)
    }
    

    
}
