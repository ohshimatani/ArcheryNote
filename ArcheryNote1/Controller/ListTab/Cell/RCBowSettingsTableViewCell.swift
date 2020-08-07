//
//  RCBowSettingsTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/06.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

protocol RCBowSettingsTableViewCellDelegate {
    func getTextFieldInformation(inputText: String)
}


class RCBowSettingsTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var delegate: RCBowSettingsTableViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.textField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("tttttttttt")
        let inputText = textField.text!
        print("bbb", inputText)
        textField.resignFirstResponder()
        delegate?.getTextFieldInformation(inputText: inputText)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("tttttttttt")
        let inputText = textField.text!
        print("aaa", inputText)
        textField.resignFirstResponder()
        delegate?.getTextFieldInformation(inputText: inputText)
        
    }
    
    
    
}
