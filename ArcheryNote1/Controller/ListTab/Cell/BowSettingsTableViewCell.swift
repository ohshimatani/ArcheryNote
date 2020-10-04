//
//  BowSettingsTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class BowSettingsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var riserLabel: UILabel!
    
    @IBOutlet weak var limbOrSightLabel: UILabel!
    
    @IBOutlet weak var arrowLabel: UILabel!
    
    @IBOutlet weak var othersTextView: UITextView!
    
    @IBOutlet weak var secondNameLabel: UILabel!
    
    let weekdayList = ["日", "月", "火", "水", "木", "金", "土"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        othersTextView.text = ""
        
        othersTextView.layer.cornerRadius = 10.0
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellRC(year: Int, month: Int, day: Int, weekday: Int, riserList: [String], limbList: [String], arrowList: [String], other: String) {
        secondNameLabel.text = "リム："
        setDateLabel(year: year, month: month, day: day, weekday: weekday)
        
        riserLabel.text = riserList[0] + "/" + riserList[1]
        limbOrSightLabel.text = limbList[0] + "/" + limbList[1] + "/" + limbList[2]
        arrowLabel.text = arrowList[0] + "/" + arrowList[1] + "/" + arrowList[2]
        
        othersTextView.text = other
    }
    
    func setCellCP(year: Int, month: Int, day: Int, weekday: Int, riserList: [String], sightList: [String], arrowList: [String], other: String) {
        secondNameLabel.text = "サイト："
        setDateLabel(year: year, month: month, day: day, weekday: weekday)
        
        riserLabel.text = riserList[0] + "/" + riserList[1] + "/" + riserList[2] + "/" + riserList[3]
        limbOrSightLabel.text = sightList[0] + "/" + sightList[1] + "/" + sightList[2]
        arrowLabel.text = arrowList[0] + "/" + arrowList[1] + "/" + arrowList[2]
        
        othersTextView.text = other
        
    }
    
    func setDateLabel(year: Int, month: Int, day: Int, weekday: Int) {
        let weekdayText = weekdayList[weekday]
        let dateText = String(year) + "/" + String(month) + "/" + String(day) + "（" + weekdayText + "）"
        dateLabel.text = dateText
    }
    
    
    
    
    
}
