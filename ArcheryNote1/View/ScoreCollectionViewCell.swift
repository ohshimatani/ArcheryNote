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
    
    @IBOutlet weak var button: UIButton!
    
    var callFrom: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.text = ""
        button.titleLabel?.text = ""
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.isEnabled = false
        
    }
    
    @IBAction func didTap(_ sender: Any) {
        print("tap!!!")
//        let storyboard = UIStoryboard(name: "Calendar", bundle: nil)
//        let destination = storyboard.instantiateViewController(identifier: "target")
//        self.present(destination, animated: true, completion: nil)
        
    }
    
    
    // initiate cell before reuse
    override func prepareForReuse() {
//        super.prepareForReuse()
        if label.text != nil {
            label.text = ""
            label.font = UIFont.systemFont(ofSize: 18)
        }
//        if button.backgroundImage(for: .normal) != nil {
//            button.setImage(nil, for: .normal)
//            button.backgroundColor = .white
//        }
        if button.isEnabled {
            button.isEnabled = false
        }
        if button.titleLabel?.text == "的中" {
            button.setTitle("", for: .normal)
        }
        if self.backgroundColor != .white {
            self.backgroundColor = .white
        }
//        if label.backgroundColor == UIColor.systemYellow {
//            label.backgroundColor = .white
//        }
//        if button.titleLabel?.text != "" {
//            button.titleLabel?.text = ""
//        }
        if self.layer.borderColor == UIColor.black.cgColor{
            self.layer.borderColor = UIColor.white.cgColor
        }
        if self.layer.borderWidth == 0.5 {
            self.layer.borderWidth = 0.0
        }
    }
    
    
    
    
    func setScorePageCell(scoreTableNum: Int, indexPath: IndexPath) {
        var query: Bool = (indexPath.section == 0)
        if scoreTableNum != 1{
            query = (indexPath.section % 7 == 0)
        }
        if query {
            switch indexPath.row {
            case 0:
                label.text = "50m"
                label.font = UIFont.systemFont(ofSize: 12)
            case 7:
                label.text = "小計"
                label.font = UIFont.systemFont(ofSize: 12)
            case 8:
                label.text = "計"
                label.font = UIFont.systemFont(ofSize: 12)
            case 9:
                break
            default:
                label.text = String(indexPath.row)
            }

        }else{
            switch indexPath.row {
            case 0:
                self.label.text = String(indexPath.section % 7)
            case 9:
                button.isEnabled = true
                button.setTitle("的中", for: .normal)
            default:
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 0.5
            }
        }

    }
    
    
    // for Target View Controller
    func setTargetPageCell(indexPath: IndexPath, pointsStringList: [String], pointsIntList: [Int], nowSelect: Int){
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.5
        
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                label.text = "70m"
                label.font = UIFont.systemFont(ofSize: 12)
            case 7:
                label.text = "計"
                label.font = UIFont.systemFont(ofSize: 12)
            default:
                label.text = String(indexPath.row)
            }
        } else {
            if nowSelect == indexPath.row {
                self.backgroundColor = UIColor.systemYellow
//                label.backgroundColor = UIColor.systemYellow
            }
            if indexPath.row == 7 {
                label.text = String(pointsIntList.reduce(0, +))
            } else if indexPath.row != 0 {
                label.text = pointsStringList[indexPath.row-1]
            }
            
        }

    }
    
    
    
    
    
    

}
