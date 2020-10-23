//
//  CPBowSettingsTableViewCell.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/06.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

protocol CPBowSettingTableViewCellDelegate {
    func getTextFieldInformation(text: String, section: Int, row: Int)
}


class CPBowSettingsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    var titleList = [[String]]()
    
    @IBOutlet weak var sectionLabel: UILabel!
    
    @IBOutlet weak var rowLabel: UILabel!
    
    var delegate: CPBowSettingTableViewCellDelegate?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = ""
        
        // riser
        titleList.append(["- 名前", "- 引き尺", "- アクセル間", "- ポンド"])
        // sight
        titleList.append(["- 名前", "- スコープ倍率", "- スコープ径", "- ドット", "- リング", "- ファイバー"])
        // stabilizer
        titleList.append(["- 名前", "- 長さ", "- ウェイトバランス"])
        // arrow
        titleList.append(["- 名前", "- スパイン", "- 長さ", "- ポイント", "- ノック", "- 羽"])
        // releaser
        titleList.append(["- 種類"])
        // others
//        titleList.append(["- その他"])
        
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
    }
    
    
    func setCell(indexPath: IndexPath, textArray: [[String]]) {
        label.text = titleList[indexPath.section][indexPath.row]
        textField.text = textArray[indexPath.section][indexPath.row]
        sectionLabel.text = String(indexPath.section)
        rowLabel.text = String(indexPath.row)
        if indexPath == [2, 2] {
            label.font = .systemFont(ofSize: 10)
        }
    }
    
    @IBAction func textFieldDidChange(_ sender: UITextField) {
        if let _section = Int(sectionLabel.text!) {
            if let _row = Int(rowLabel.text!) {
                delegate?.getTextFieldInformation(text: textField.text!, section: _section, row: _row)
            } else {
                print("else1")
            }
        } else {
            print("else2")
        }
    }
    
    
    
    
    
}
