//
//  OthersInBowSettingsTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class OthersInBowSettingsTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var othersTextView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        othersTextView.text = ""
        
        othersTextView.layer.cornerRadius = 10.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        if othersTextView.text != "" {
            othersTextView.text = ""
        }
    }
    
    
    
}
