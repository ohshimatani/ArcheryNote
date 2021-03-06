//
//  ChoiceDistanceViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/09.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit



protocol FromDistancePageDelegate {
    func fromDistancePage(intScoreSavingList: [[[Int]]], stringScoreSavingList: [[[String]]], pointXScoreSavingList: [[[Double]]], pointYScoreSavingList: [[[Double]]], distanceKey: String, distanceText: String, rounds: Int, isIndoor30: Bool, isIndoor60: Bool)
}

class ChoiceDistanceViewController: UIViewController {

    
    @IBOutlet weak var button70W: UIButton!
    @IBOutlet weak var button50W: UIButton!
    @IBOutlet weak var buttonSH: UIButton!
    @IBOutlet weak var button1440M: UIButton!
    @IBOutlet weak var button60W: UIButton!
    @IBOutlet weak var button1440W: UIButton!
    @IBOutlet weak var button18W: UIButton!
    @IBOutlet weak var button30W: UIButton!
    
    @IBOutlet weak var button90: UIButton!
    @IBOutlet weak var button70: UIButton!
    @IBOutlet weak var button60: UIButton!
    @IBOutlet weak var button50: UIButton!
    @IBOutlet weak var button30: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button1836: UIButton!
    @IBOutlet weak var button1830: UIButton!
    
    @IBOutlet weak var buttonFree36: UIButton!
    @IBOutlet weak var buttonFree72: UIButton!
    @IBOutlet weak var buttonFree144: UIButton!
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    var intScoreSavingList = [[[Int]]]()
    var stringScoreSavingList = [[[String]]]()
    var pointXScoreSavingList = [[[Double]]]()
    var pointYScoreSavingList = [[[Double]]]()
    
    var delegate: FromDistancePageDelegate?
    
    var selectedKey: String!
    var labelText: String!
    var rounds: Int!
    
    var isIndoor30: Bool = false
    var isIndoor60: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceLabel.text = labelText
        
        let buttonList = [button70W, button50W, buttonSH, button1440M, button60W, button1440W, button18W, button30W, button90, button70, button60, button50, button30, button12, button1836, button1830, buttonFree36, buttonFree72, buttonFree144]
        
        for button in buttonList {
            button?.addTarget(self, action: #selector(didTap(sender:)), for: .touchUpInside)
        }
        
        switch selectedKey {
        case "70W", "50W", "SH", "60W", "18W", "free_72":
            rounds = 2
        case "1440M", "1440W", "free_144":
            rounds = 4
        default:
            rounds = 1
        }
    }
    
    @objc func didTap(sender: UIButton) {
        print(sender == button60W)
        switch sender {
        // match
        case button70W:
            selectedKey = "70W"
            rounds = 2
        case button50W:
            selectedKey = "50W"
            rounds = 2
        case buttonSH:
            selectedKey = "SH"
            rounds = 2
        case button1440M:
            selectedKey = "1440M"
            rounds = 4
        case button60W:
            selectedKey = "60W"
            rounds = 2
        case button1440W:
            selectedKey = "1440W"
            rounds = 4
        case button18W:
            selectedKey = "18W"
            rounds = 2
        // 36
        case button90:
            selectedKey = "90"
            rounds = 1
        case button70:
            selectedKey = "70"
            rounds = 1
        case button60:
            selectedKey = "60"
            rounds = 1
        case button50:
            selectedKey = "50"
            rounds = 1
        case button30:
            selectedKey = "30"
            rounds = 1
        case button12:
            selectedKey = "12"
            rounds = 1
        case button1836:
            selectedKey = "18_36"
            rounds = 1
        case button1830:
            selectedKey = "18_30"
            rounds = 1
        // free
        case buttonFree36:
            selectedKey = "free_36"
            rounds = 1
        case buttonFree72:
            selectedKey = "free_72"
            rounds = 2
        case buttonFree144:
            selectedKey = "free_144"
            rounds = 4
        // default
        default:
            selectedKey = "free_72"
            rounds = 2
        }
        
        // is Indoor or not
        if selectedKey == "18_30" {
            isIndoor30 = true
        } else {
            isIndoor30 = false
        }
        if selectedKey == "18W" {
            isIndoor60 = true
        } else {
            isIndoor60 = false
        }
        distanceLabel.text = sender.titleLabel?.text
        
    }
    
    
    @IBAction func done(_ sender: Any) {
        delegate?.fromDistancePage(intScoreSavingList: intScoreSavingList, stringScoreSavingList: stringScoreSavingList, pointXScoreSavingList: pointXScoreSavingList, pointYScoreSavingList: pointYScoreSavingList, distanceKey: selectedKey, distanceText: distanceLabel.text!, rounds: rounds, isIndoor30: isIndoor30, isIndoor60: isIndoor60)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    

}
