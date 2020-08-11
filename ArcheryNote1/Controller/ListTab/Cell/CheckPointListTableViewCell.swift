//
//  CheckPointListTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/13.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class CheckPointListTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet weak var howImportantColor: UIView!
    
    @IBOutlet var howImportantLabel: UILabel!
    
    @IBOutlet weak var checkPointTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        howImportantColor.layer.cornerRadius = howImportantColor.bounds.width / 2.0
        howImportantColor.layer.masksToBounds = true
        
        checkPointTextView.text = ""
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    
    
    
    
    
}
