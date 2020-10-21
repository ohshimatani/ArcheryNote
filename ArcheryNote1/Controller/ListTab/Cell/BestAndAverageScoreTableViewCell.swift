//
//  BestAndAverageScoreTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/09/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class BestAndAverageScoreTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var bestScoreLabel_practice: UILabel!
    @IBOutlet weak var bestScoreLabel_match: UILabel!
    @IBOutlet weak var averageScoreLabel_practice: UILabel!
    @IBOutlet weak var averageScoreLabel_match: UILabel!
    
    @IBOutlet weak var bestDateLabel_practice: UILabel!
    @IBOutlet weak var bestDateLabel_match: UILabel!
    
    @IBOutlet weak var bestTitleLabel_practice: UILabel!
    @IBOutlet weak var bestTitleLabel_match: UILabel!
    
//    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    func setCell(_results: Results<ScoreSheet>, distanceKey: String) {
//        let realm = try! Realm()
        let results = _results.filter("distanceKey == %@", distanceKey)
        let matchResults = results.filter("isMatch == true")
        let practiceResults = results.filter("isMatch == false")
        
        let (match1, match2, match3) = getBestScore(results: matchResults)
        if match1 != nil{
            bestDateLabel_match.text = match1
            bestTitleLabel_match.text = match2
            bestScoreLabel_match.text = String(match3!)
            bestScoreLabel_match.font = .systemFont(ofSize: 17.0, weight: .bold)
        } else {
            bestDateLabel_match.text = "-"
            bestTitleLabel_match.text = "-"
            bestScoreLabel_match.text = "-"
        }
        
        let (practice1, practice2, practice3) = getBestScore(results: practiceResults)
        if practice1 != nil {
            bestDateLabel_practice.text = practice1
            bestTitleLabel_practice.text = practice2
            bestScoreLabel_practice.text = String(practice3!)
            bestScoreLabel_practice.font = .systemFont(ofSize: 17.0, weight: .bold)
        } else {
            bestDateLabel_practice.text = "-"
            bestTitleLabel_practice.text = "-"
            bestScoreLabel_practice.text = "-"
        }
        
        let matchAverage = getAverageScore(results: matchResults)
        if matchAverage != nil {
            averageScoreLabel_match.text = String(matchAverage!)
            averageScoreLabel_match.font = .systemFont(ofSize: 17.0, weight: .bold)
        } else {
            averageScoreLabel_match.text = "-"
        }
        
        let practiceAverage = getAverageScore(results: practiceResults)
        if practiceAverage != nil {
            averageScoreLabel_practice.text = String(practiceAverage!)
            averageScoreLabel_practice.font = .systemFont(ofSize: 17.0, weight: .bold)
        } else {
            averageScoreLabel_practice.text = "-"
        }
        
        
        
        
        
        
        
    }
    
    func getBestScore(results: Results<ScoreSheet>) -> (String?, String?, Int?){
        if let result = results.sorted(byKeyPath: "totalScore", ascending: false).first {
            let year = result.year
            let month = result.month
            let day = result.day
            
            let weekdayString = result.weekday
            let dateLabelText = String(year) + "/" + String(month) + "/" + String(day) + "(" + weekdayString + ")"
            return (dateLabelText, result.title, result.totalScore)
        } else {
            return (nil, nil, nil)
        }
    }
    
    func getAverageScore(results: Results<ScoreSheet>) -> Double? {
        if results.count != 0 {
            var total: Int = 0
            for result in results {
                total += result.totalScore
            }
            return Double(total) / Double(results.count)
        } else {
            return nil
        }
        
    }
    
    
    func getDateText(date: String) {
        
    }
    
    
    
    
    
    
    
    
//    func setCell(bestScoreSheet_practice: ScoreSheet, bestScoreSheet_match: ScoreSheet, averageScore_practice: Double, averageScore_match: Double) {
//        if bestScoreSheet_practice != nil {
//            bestDateLabel_practice.text = bestScoreSheet_practice.date
//            bestTitleLabel_practice.text = bestScoreSheet_practice.title
//            bestScoreLabel_practice.text = String(bestScoreSheet_practice.totalScore)
//        } else {
//            bestScoreLabel_practice.text = "-"
//            bestTitleLabel_practice.text = "-"
//            bestScoreLabel_practice.text = "-"
//        }
//
//        if bestScoreSheet_match != nil {
//            bestDateLabel_match.text = bestScoreSheet_match.date
//            bestTitleLabel_match.text = bestScoreSheet_match.title
//            bestScoreLabel_match.text = String(bestScoreSheet_match.totalScore)
//        } else {
//           bestScoreLabel_match.text = "-"
//           bestTitleLabel_match.text = "-"
//           bestScoreLabel_match.text = "-"
//       }
//
//
//
//
//    }
    
    
    
    
    
    
}
