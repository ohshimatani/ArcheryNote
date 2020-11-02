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
    
    
    
    @IBOutlet weak var RCorCPSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var scoreTableView: UITableView!
    
    var RCScoreSheets: Results<ScoreSheet>!
    var CPScoreSheets: Results<ScoreSheet>!
    
    
    var passResult = ScoreSheet()
    
    var isCPPlayer: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreTableView.delegate = self
        scoreTableView.dataSource = self
        
        
        
        let nib = UINib(nibName: "ScoreTableTableViewCell", bundle: .main)
        scoreTableView.register(nib, forCellReuseIdentifier: "scoreTableCell")
        scoreTableView.tableFooterView = UIView()
        
        isCPPlayer = UserDefaults.standard.bool(forKey: "isCPPlayer")
        if isCPPlayer == true {
            RCorCPSegmentedControl.selectedSegmentIndex = 1
        } else {
            RCorCPSegmentedControl.selectedSegmentIndex = 0
        }

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let realm = try! Realm()
        let objRC = realm.objects(ScoreSheet.self).filter("isCP == false")
        if objRC.count != 0 {
            RCScoreSheets = objRC.sorted(byKeyPath: "date", ascending: true)
        } else {
            RCScoreSheets = objRC
        }
        let objCP = realm.objects(ScoreSheet.self).filter("isCP == true")
        if objCP.count != 0 {
            CPScoreSheets = objCP.sorted(byKeyPath: "date", ascending: true)
        } else {
            CPScoreSheets = objCP
        }
        scoreTableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if RCorCPSegmentedControl.selectedSegmentIndex == 0 {
            if RCScoreSheets != nil {
                return RCScoreSheets.count
            }
            return 0
        } else {
            if CPScoreSheets != nil {
                return CPScoreSheets.count
            }
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scoreTableCell") as! ScoreTableTableViewCell
        var scoreSheet: ScoreSheet!
        if RCorCPSegmentedControl.selectedSegmentIndex == 0 {
            scoreSheet = RCScoreSheets[indexPath.row]
        } else {
            scoreSheet = CPScoreSheets[indexPath.row]
        }
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
        if RCorCPSegmentedControl.selectedSegmentIndex == 0 {
            passResult = RCScoreSheets[indexPath.row]
        } else {
            passResult = CPScoreSheets[indexPath.row]
        }
        VC.result = passResult
        VC.isEdit = true
        NC.modalPresentationStyle = .fullScreen
        self.present(NC, animated: true, completion: nil)
        scoreTableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "削除") { (_, _, completionHandler) in
            let alert = UIAlertController(title: "削除", message: "本当に削除しますか？", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "はい", style: .cancel) { (action) in
                print("ok")
                
                let realm = try! Realm()
                try! realm.write{
                    realm.delete(self.RCScoreSheets[indexPath.row])
                    print("deleted")
                }
                tableView.deleteRows(at: [indexPath], with: .automatic)
                
                completionHandler(true)
                
            }
            let NGAction = UIAlertAction(title: "いいえ", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
                completionHandler(false)
            }
            alert.addAction(OKAction)
            alert.addAction(NGAction)
            self.present(alert, animated: true, completion: nil)

            
        }
        
        return UISwipeActionsConfiguration(actions: [action])

    }
        
    @IBAction func RCCPSegmentedControlDidChange(_ sender: Any) {
        scoreTableView.reloadData()
    }
    
    
    

    
}
