//
//  ScoreTableTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/11.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreTableTableViewCell: UITableViewCell {

    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        distanceLabel.text = "_m"
        scoreLabel.text = "0"
        dateLabel.text = "9999/99/99(9)"
        colorView.layer.cornerRadius = colorView.frame.width / 2
        scoreLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(date: String, weekday: String, distance: String, totalScore: Int, isMatch: Bool, title: String) {
        let year = date[date.index(date.startIndex, offsetBy: 0)..<date.index(date.startIndex, offsetBy: 4)]
        let month = date[date.index(date.startIndex, offsetBy: 4)..<date.index(date.startIndex, offsetBy: 6)]
        let day = date[date.index(date.startIndex, offsetBy: 6)..<date.index(date.startIndex, offsetBy: 8)]
        dateLabel.text = year + "/" + month + "/" + day + "/" + "(" + weekday + ")"
        dateLabel.font = UIFont.systemFont(ofSize: 11, weight: .light)
        scoreLabel.text = String(totalScore)
        if isMatch == true {
            colorView.backgroundColor = .systemRed
        }
        distanceLabel.text = MyFunctions.distanceKeytoLabelText(key: distance)
        titleLabel.text = title
        
    }
    
    
    
    
    
}
