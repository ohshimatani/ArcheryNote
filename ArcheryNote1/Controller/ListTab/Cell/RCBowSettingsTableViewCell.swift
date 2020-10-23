//
//  RCBowSettingsTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/06.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

protocol RCBowSettingTableViewCellDelegate {
    func getTextFieldInformation(text: String, section: Int, row: Int)
}


class RCBowSettingsTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
   
    var titleList = [[String]]()
    
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var rowLabel: UILabel!
    
    
    var indexPath: IndexPath!
    
    var delegate: RCBowSettingTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        label.text = ""
        
        // riser
        titleList.append(["- 名前", "- サイズ"])
        // limb
        titleList.append(["- 名前", "- ポンド", "- サイズ"])
        // arrow
        titleList.append(["- 名前", "- スパイン", "- 長さ", "- ポイント", "- ノック", "- 羽"])
        // string
        titleList.append(["- 原糸", "- サービング",  "- 長さ", "- ストランド数"])
        // stabilizer
        titleList.append(["- センターロッド", "- サイズ", "- センターロッド", "- サイズ"])
        // sight
        titleList.append(["- 名前"])
        // plunger
        titleList.append(["- 名前"])
        // tab
        titleList.append(["- 名前"])
        // others
//        titleList.append(["- その他"])
        // ---------------------
        
        sectionLabel.textColor = .white
        rowLabel.textColor = .white
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        if label.text! != "" {
            label.text! = ""
        }
//        if textField.text != "" {
//            textField.text = ""
//        }
    }
    
    
    func setCell(indexPath: IndexPath, textArray: [[String]]) {
        label.text = titleList[indexPath.section][indexPath.row]
        textField.text = textArray[indexPath.section][indexPath.row]
        sectionLabel.text = String(indexPath.section)
        rowLabel.text = String(indexPath.row)
        
//        self.indexPath = indexPath
//        textField.text = textArray[indexPath.section][indexPath.row]
//        textArray[indexPath.section][indexPath.row] = textField.text!
//        delegate?.getTextFieldInformation(text: textField.text!, indexPath: indexPath)
    }
    
    
    
    
    
    
    
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if let _section = Int(sectionLabel.text!) {
            if let _row = Int(rowLabel.text!) {
                delegate?.getTextFieldInformation(text: textField.text!, section: _section, row: _row)
                print("bbbbbbbbbbb")
            } else {
                print("else1")
            }
        } else {
            print("else2")
        }

    }
    
    
    
}
