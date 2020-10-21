//
//  BestScoreListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class BestScoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var bestScoreTableView: UITableView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    let cellKey: String = "bestAndAverageScoreCell"
    
    var keysList =  ["70W", "50W", "SH", "1440M", "1440W", "18W", "30W"]
    var defaultDistance: String!
    var distanceKey: String!
    
    var isCPPlayer: Bool!
    
    var results: Results<ScoreSheet>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bestScoreTableView.allowsSelection = false
        
        isCPPlayer = UserDefaults.standard.bool(forKey: "isCPPlayer")
        if isCPPlayer == true {
            segmentedControl.selectedSegmentIndex = 1
        } else {
            segmentedControl.selectedSegmentIndex = 0
        }
        
        setResult()

        
        let nib = UINib(nibName: "BestAndAverageScoreTableViewCell", bundle: .main)
        bestScoreTableView.register(nib, forCellReuseIdentifier: cellKey)
        bestScoreTableView.delegate = self
        bestScoreTableView.dataSource = self

        defaultDistance = UserDefaults.standard.string(forKey: "defaultDistance")
        if defaultDistance != nil && defaultDistance != "free_36" && defaultDistance != "free_72" && defaultDistance != "free_144"{
            let key = MyFunctions.labelTexttoDistanceKey(text: defaultDistance)
            var idx = -1
            for elem in keysList {
                idx += 1
                if elem == key {
                    keysList.remove(at: idx)
                    break
                }
            }
            keysList.insert(key, at: 0)
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bestScoreTableView.reloadData()
    }
    
    @IBAction func segmentIndexDidChange(_ sender: Any) {
        setResult()
        bestScoreTableView.reloadData()
    }
    
    func setResult() {
        let realm = try! Realm()
        if segmentedControl.selectedSegmentIndex == 0 {
            results = realm.objects(ScoreSheet.self).filter("isCP == false")
        } else {
            results = realm.objects(ScoreSheet.self).filter("isCP == true")
        }
    }
    
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellKey) as! BestAndAverageScoreTableViewCell
        distanceKey = keysList[indexPath.section]
        cell.setCell(_results: results, distanceKey: distanceKey)
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return MyFunctions.distanceKeytoLabelText(key: keysList[section])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keysList.count
    }
    
    
    
    
}
