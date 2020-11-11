//
//  RCBowSettingsTableViewHeaderFooterView.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit


protocol RCBowSettingsTableViewHeaderFooterViewDelegate: AnyObject {
    func RCHeaderFooterView(_ header: RCBowSettingsTableViewHeaderFooterView, section: Int)
}

class RCBowSettingsTableViewHeaderFooterView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    
    var delegate: RCBowSettingsTableViewHeaderFooterViewDelegate?
    var section: Int = 0
    
    override func awakeFromNib() {
        contentView.backgroundColor = .white
    }
        
    @IBAction func didTap(_ sender: Any) {
        delegate?.RCHeaderFooterView(self, section: section)
    }
    

}
