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
    
    @IBOutlet weak var limbLabel: UILabel!
    
    @IBOutlet weak var arrowLabel: UILabel!
    
    @IBOutlet weak var othersTextView: UITextView!
    
    
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
    
}
