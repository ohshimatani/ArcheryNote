//
//  PickDistanceViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

protocol PickDistanceDelegate {
    func pickDistanceForFree(distanceKeys: [String])
}


class PickDistanceViewController: UIViewController {
    
    
    
    @IBOutlet weak var label1R: UILabel!
    @IBOutlet weak var label2R: UILabel!
    @IBOutlet weak var label3R: UILabel!
    @IBOutlet weak var label4R: UILabel!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    
    @IBOutlet weak var button90: UIButton!
    @IBOutlet weak var button70: UIButton!
    @IBOutlet weak var button60: UIButton!
    @IBOutlet weak var button50: UIButton!
    @IBOutlet weak var button40: UIButton!
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button12: UIButton!
    
    var nowSelect = 0
    
    var roundsNum = 2
    var distanceKeys: [String] = ["", "", "", ""]
    
    var displayLabelList: [UILabel]!
    
    var delegate: PickDistanceDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        displayLabelList = [label1, label2, label3, label4]
        var index: Int = 0
        for label in displayLabelList {
            label.layer.borderColor = UIColor.black.cgColor
            label.layer.borderWidth = 2.0
            label.text = distanceKeys[index]
            index += 1
        }
        index = 0
        
        
        let buttonList = [button90, button70, button60, button50, button40, button30, button18, button12]
        
        for button in buttonList {
            button?.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        }
        
        var notDisplayList = [UILabel]()
        if roundsNum == 2 {
            notDisplayList.append(label3)
            notDisplayList.append(label4)
            notDisplayList.append(label3R)
            notDisplayList.append(label4R)
        } else if roundsNum == 1 {
            notDisplayList.append(label2)
            notDisplayList.append(label2R)
            notDisplayList.append(label3)
            notDisplayList.append(label4)
            notDisplayList.append(label3R)
            notDisplayList.append(label4R)
        }
        
        for label in notDisplayList {
            label.text = ""
            label.layer.borderWidth = 0.0
        }
        
        label1.backgroundColor = .systemYellow
        
    }
    
    @objc func didTap(sender: UIButton) {
        switch sender {
        case button90:
            displayLabelList[nowSelect].text = "90m"
        case button70:
            displayLabelList[nowSelect].text = "70m"
        case button60:
            displayLabelList[nowSelect].text = "60m"
        case button50:
            displayLabelList[nowSelect].text = "50m"
        case button40:
            displayLabelList[nowSelect].text = "40m"
        case button30:
            displayLabelList[nowSelect].text = "30m"
        case button18:
            displayLabelList[nowSelect].text = "18m"
        case button12:
            displayLabelList[nowSelect].text = "12m"
        default:
            break
        }
        increment()
    }
    
    func increment() {
        nowSelect += 1
        if nowSelect == roundsNum {
            for i in 0..<4 {
                distanceKeys[i] = displayLabelList[i].text!
            }
            delegate?.pickDistanceForFree(distanceKeys: distanceKeys)
            self.dismiss(animated: true, completion: nil)
        } else {
            displayLabelList[nowSelect-1].backgroundColor = .white
            displayLabelList[nowSelect].backgroundColor = .systemYellow
        }
        
        
    }
    
    
    
    


}
