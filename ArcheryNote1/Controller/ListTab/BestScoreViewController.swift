//
//  BestScoreViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/09/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class BestScoreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var bestScoreTableView: UITableView!
    
    var scoreList_70W_match: Results<ScoreSheet>!
    var scoreList_50W_match: Results<ScoreSheet>!
    var scoreList_SH_match: Results<ScoreSheet>!
    var scoreList_1440M_match: Results<ScoreSheet>!
    var scoreList_60W_match: Results<ScoreSheet>!
    var scoreList_1440W_match: Results<ScoreSheet>!
    var scoreList_18W_match: Results<ScoreSheet>!
    var scoreList_30W_match: Results<ScoreSheet>!
    
    var scoreList_70W_practice: Results<ScoreSheet>!
    var scoreList_50W_practice: Results<ScoreSheet>!
    var scoreList_SH_practice: Results<ScoreSheet>!
    var scoreList_1440M_practice: Results<ScoreSheet>!
    var scoreList_60W_practice: Results<ScoreSheet>!
    var scoreList_1440W_practice: Results<ScoreSheet>!
    var scoreList_18W_practice: Results<ScoreSheet>!
    var scoreList_30W_practice: Results<ScoreSheet>!

    var best_70W_match = ScoreSheet()
    var best_50W_match = ScoreSheet()
    var best_SH_match = ScoreSheet()
    var best_1440M_match = ScoreSheet()
    var best_60W_match = ScoreSheet()
    var best_1440W_match = ScoreSheet()
    var best_18W_match = ScoreSheet()
    var best_30W_match = ScoreSheet()
    
    var best_70W_practice = ScoreSheet()
    var best_50W_practice = ScoreSheet()
    var best_SH_practice = ScoreSheet()
    var best_1440M_practice = ScoreSheet()
    var best_60W_practice = ScoreSheet()
    var best_1440W_practice = ScoreSheet()
    var best_18W_practice = ScoreSheet()
    var best_30W_practice = ScoreSheet()

    var average_70W_match: Double!
    var average_50W_match: Double!
    var average_SH_match: Double!
    var average_1440M_match: Double!
    var average_60W_match: Double!
    var average_1440W_match: Double!
    var average_18W_match: Double!
    var average_30W_match: Double!

    var average_70W_practice: Double!
    var average_50W_practice: Double!
    var average_SH_practice: Double!
    var average_1440M_practice: Double!
    var average_60W_practice: Double!
    var average_1440W_practice: Double!
    var average_18W_practice: Double!
    var average_30W_practice: Double!

    let cellKey: String = "bestAndAverageScoreCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readRealmObjects()
        setBestAndAverage()
        
        let nib = UINib(nibName: "BestAndAverageScoreTableViewCell", bundle: .main)
        bestScoreTableView.register(nib, forCellReuseIdentifier: cellKey)
        bestScoreTableView.delegate = self
        bestScoreTableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellKey) as! BestAndAverageScoreTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "title"
    }
    
    
    func readRealmObjects() {
        let realm = try! Realm()
        scoreList_70W_match = realm.objects(ScoreSheet.self).filter("distanceKey == '70W' AND isMatch == true")
        scoreList_50W_match = realm.objects(ScoreSheet.self).filter("distanceKey == '50W' AND isMatch == true")
        scoreList_SH_match = realm.objects(ScoreSheet.self).filter("distanceKey == 'SH' AND isMatch == true")
        scoreList_1440M_match = realm.objects(ScoreSheet.self).filter("distanceKey == '1440M' AND isMatch == true")
        scoreList_60W_match = realm.objects(ScoreSheet.self).filter("distanceKey == '60W' AND isMatch == true")
        scoreList_1440W_match = realm.objects(ScoreSheet.self).filter("distanceKey == '1440W' AND isMatch == true")
        scoreList_18W_match = realm.objects(ScoreSheet.self).filter("distanceKey == '18W' AND isMatch == true")
        scoreList_30W_match = realm.objects(ScoreSheet.self).filter("distanceKey == '30W' AND isMatch == true")
        
        scoreList_70W_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '70W' AND isMatch == false")
        scoreList_50W_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '50W' AND isMatch == false")
        scoreList_SH_practice = realm.objects(ScoreSheet.self).filter("distanceKey == 'SH' AND isMatch == false")
        scoreList_1440M_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '1440M' AND isMatch == false")
        scoreList_60W_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '60W' AND isMatch == false")
        scoreList_1440W_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '1440W' AND isMatch == false")
        scoreList_18W_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '18W' AND isMatch == false")
        scoreList_30W_practice = realm.objects(ScoreSheet.self).filter("distanceKey == '30W' AND isMatch == false")
        
    }
    
    func setBestAndAverage() {
        
        var bestList_match = [best_70W_match, best_50W_match, best_SH_match, best_1440M_match, best_60W_match, best_1440W_match, best_18W_match, best_30W_match]
        var bestList_practice = [best_70W_practice, best_50W_practice, best_SH_practice, best_1440M_practice, best_60W_practice, best_1440W_practice, best_18W_practice, best_30W_practice]
        let scoreList_match = [scoreList_70W_match, scoreList_50W_match, scoreList_SH_match, scoreList_1440M_match, scoreList_60W_match, scoreList_1440W_match, scoreList_18W_match, scoreList_30W_match]
        let scoreList_practice = [scoreList_70W_practice, scoreList_50W_practice, scoreList_SH_practice, scoreList_1440M_practice, scoreList_60W_practice, scoreList_1440W_practice, scoreList_18W_practice, scoreList_30W_practice]
        
        for i in 0..<scoreList_match.count {
            if scoreList_match[i]?.sorted(byKeyPath: "totalScore", ascending: false).first != nil {
                bestList_match[i] = (scoreList_match[i]?.sorted(byKeyPath: "totalScore", ascending: false).first)!
            }
            if scoreList_practice[i]?.sorted(byKeyPath: "totalScore", ascending: false).first != nil {
                bestList_practice[i] = (scoreList_practice[i]?.sorted(byKeyPath: "totalScore", ascending: false).first)!
            }
        }
        
//        best_70W_match = scoreList_70W_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_50W_match = scoreList_50W_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_SH_match = scoreList_SH_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_1440M_match = scoreList_1440M_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_60W_match = scoreList_60W_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_1440W_match = scoreList_1440W_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_18W_match = scoreList_18W_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_30W_match = scoreList_30W_match.sorted(byKeyPath: "totalScore", ascending: false).first!
//
//        best_70W_practice = scoreList_70W_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_50W_practice = scoreList_50W_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_SH_practice = scoreList_SH_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_1440M_practice = scoreList_1440M_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_60W_practice = scoreList_60W_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_1440W_practice = scoreList_1440W_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_18W_practice = scoreList_18W_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
//        best_30W_practice = scoreList_30W_practice.sorted(byKeyPath: "totalScore", ascending: false).first!
        
        average_70W_match = calculationAverage(scoreList: scoreList_70W_match)
        average_50W_match = calculationAverage(scoreList: scoreList_50W_match)
        average_SH_match = calculationAverage(scoreList: scoreList_SH_match)
        average_1440M_match = calculationAverage(scoreList: scoreList_1440M_match)
        average_60W_match = calculationAverage(scoreList: scoreList_60W_match)
        average_1440W_match = calculationAverage(scoreList: scoreList_1440W_match)
        average_18W_match = calculationAverage(scoreList: scoreList_18W_match)
        average_30W_match = calculationAverage(scoreList: scoreList_30W_match)
        
        average_70W_practice = calculationAverage(scoreList: scoreList_70W_practice)
        average_50W_practice = calculationAverage(scoreList: scoreList_50W_practice)
        average_SH_practice = calculationAverage(scoreList: scoreList_SH_practice)
        average_1440M_practice = calculationAverage(scoreList: scoreList_1440M_practice)
        average_60W_practice = calculationAverage(scoreList: scoreList_60W_practice)
        average_1440W_practice = calculationAverage(scoreList: scoreList_1440W_practice)
        average_18W_practice = calculationAverage(scoreList: scoreList_18W_practice)
        average_30W_practice = calculationAverage(scoreList: scoreList_30W_practice)
        
    }
    
    func calculationAverage(scoreList: Results<ScoreSheet>) -> Double {
        var total: Int = 0
        var num: Int = 0
        for scoreSheet in scoreList {
            total += scoreSheet.totalScore
            num += 1
        }
        if num != 0 {
            return Double(total / num)
        } else {
            return 0.0
        }
    }
    
    
    
    
    
    
    
}
