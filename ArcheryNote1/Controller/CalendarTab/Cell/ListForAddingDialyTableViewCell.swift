//
//  ListForAddingDialyTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

protocol AddListDelegate {
    func addList()
}

class ListForAddingDialyTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var howImportantColor: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        howImportantColor.layer.cornerRadius = howImportantColor.bounds.width / 2.0
        howImportantColor.layer.masksToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        
        
        
    }
    
    
    @IBAction func add(_ sender: Any) {
        
    }
    
    
}
