//
//  ScoreCollectionViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ScoreCollectionViewCell: UICollectionViewCell {

    
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = ""
        
    }

}
