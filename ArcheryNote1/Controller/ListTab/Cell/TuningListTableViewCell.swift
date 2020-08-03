//
//  TuningListTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class TuningListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var variableNameLabel: UILabel!
    
    @IBOutlet weak var heightOrPeepLabel: UILabel!
    
    @IBOutlet weak var nockingPointLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.text = ""
        heightOrPeepLabel.text = "ー"
        nockingPointLabel.text = "ー"
        
        
    }

    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
    }
    
    
    
    
}
