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
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(bestScoreSheet_practice: ScoreSheet, bestScoreSheet_match: ScoreSheet, averageScore_practice: Double, averageScore_match: Double) {
        if bestScoreSheet_practice != nil {
            bestDateLabel_practice.text = bestScoreSheet_practice.date
            bestTitleLabel_practice.text = bestScoreSheet_practice.title
            bestScoreLabel_practice.text = String(bestScoreSheet_practice.totalScore)
        } else {
            bestScoreLabel_practice.text = "-"
            bestTitleLabel_practice.text = "-"
            bestScoreLabel_practice.text = "-"
        }
        
        if bestScoreSheet_match != nil {
            bestDateLabel_match.text = bestScoreSheet_match.date
            bestTitleLabel_match.text = bestScoreSheet_match.title
            bestScoreLabel_match.text = String(bestScoreSheet_match.totalScore)
        } else {
           bestScoreLabel_match.text = "-"
           bestTitleLabel_match.text = "-"
           bestScoreLabel_match.text = "-"
       }

        
        
        
    }
    
    
    
    
    
    
}
