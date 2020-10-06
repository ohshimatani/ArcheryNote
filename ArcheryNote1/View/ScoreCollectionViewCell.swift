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
            label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
            label.textColor = .black
        }
//        if button.backgroundImage(for: .normal) != nil {
//            button.setImage(nil, for: .normal)
//            button.backgroundColor = .white
//        }
//        if button.isEnabled {
//            button.isEnabled = false
//        }
//        if button.titleLabel?.text == "的中" {
//            button.setTitle("", for: .normal)
//        }
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
        if self.layer.borderWidth != 0 {
            self.layer.borderWidth = 0.0
        }
    }
    
    
    
    var intScoreSavingList: [[Int]]!
    var stringScoreSavingList: [[String]]!
    var pointXScoreSavingList: [[Double]]!
    var pointYScoreSavingList: [[Double]]!
    
    func setScorePageCell(scoreTableNum: Int, indexPath: IndexPath, stringScoreList: [[[String]]], intScoreList: [[[Int]]], isIndoor60: Bool, isIndoor30: Bool, sum10Lists: [[Int]], distanceKeys: [String]) {
        var query: Bool = (indexPath.section == 0)
        var sections: Int = 8
        
        if isIndoor60 || isIndoor30 {
            sections = 7
        } else {
            sections = 8
        }
        
        if scoreTableNum != 1{
            query = (indexPath.section % sections == 0)
        }
        
        if query {
            switch indexPath.row {
            case 0:
                let str = distanceKeys[Int(floor(Double(indexPath.section / sections)))]
                if str == "" {
                    print("--------in---------")
                    label.text = "+"
                    label.textColor = .systemBlue
                    label.font = UIFont.systemFont(ofSize: 25, weight: .regular)
                } else {
                    label.text = str
                    label.font = UIFont.systemFont(ofSize: 12)
                }
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
        }else if indexPath.section % sections == (sections-1){
            switch indexPath.row {
            case 5:
                label.text = "X:"
            case 6, 8:
                let round: Int = Int(floor(Double(indexPath.section / sections)))
                var sumX: Int!
                var sum10: Int!
                sumX = sum10Lists[round][0]
                sum10 = sum10Lists[round][1]
                if indexPath.row == 6 {
                    label.text = String(sumX)
                } else {
                    label.text = String(sum10)
                }
            case 7:
                label.text = "10:"
            default:
                break
            }
        } else {
            switch indexPath.row {
            case 0:
                self.label.text = String(indexPath.section % sections)
            case 9:
                label.text = "的中"
                label.font = UIFont.systemFont(ofSize: 12, weight: .light)
                label.textColor = .systemBlue
            case 7, 8:
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.black.cgColor
                let round = Int(floor(Double(indexPath.section/sections)))
                let end = Int(indexPath.section % sections) - 1
                if indexPath.row == 7 {
                    self.layer.borderWidth = 2
                    let sum = intScoreList[round][end].reduce(0, +)
                    if sum != 0 {
                        label.text = String(sum)
                    }
                }else{
                    self.layer.borderWidth = 0.5
                    let slicedList = intScoreList[round][0..<end+1]
                    var sum: Int = 0
                    var flag = false
                    for i in 0..<slicedList.count {
                        let _sum = slicedList[i].reduce(0, +)
                        if _sum == 0{
                            if stringScoreList[round][i].contains("") {
                                flag = true
                                break
                            }
                        }
                        sum += _sum
                    }
                    if flag { break }
                    if sum != 0 {
                        label.text = String(sum)
                        if sum > 99 {
                            label.font = UIFont.systemFont(ofSize: 15)
                        }
                        if indexPath.section == sections-2 {
                            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
                        }

                    }
                }
            default:
                let round = Int(floor(Double(indexPath.section/sections)))
                let end = Int(indexPath.section % sections) - 1
                let num = Int(indexPath.row - 1)
                self.backgroundColor = .white
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 0.5
                label.text = stringScoreList[round][end][num]
            
            }
        }

    }
    
    
    // for Target View Controller
    func setTargetPageCell(indexPath: IndexPath, pointsStringList: [String], pointsIntList: [Int], roundAndEnd: [Int], nowSelect: Int){
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 0.5
        
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                let round = roundAndEnd[0]
                let end = roundAndEnd[1]
                label.text = String(round + 1) + "R-" + String(end + 1)
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
                self.layer.borderWidth = 2
            } else if indexPath.row != 0 {
                label.text = pointsStringList[indexPath.row-1]
            }
            
        }

    }
    
    
    
    
    
    

}
