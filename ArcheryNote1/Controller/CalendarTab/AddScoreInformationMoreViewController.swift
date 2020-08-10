//
//  AddScoreInformationMoreViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit


class AddScoreInformationMoreViewController: UIViewController, UINavigationControllerDelegate {

    
    @IBOutlet weak var averageOfThisMounthLabelText: UILabel!
    
    @IBOutlet weak var averageOfaverageLabel: UILabel!
    @IBOutlet weak var averageOf10PointsLabel: UILabel!
    @IBOutlet weak var averageOfXPointsLabel: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet weak var average1: UILabel!
    @IBOutlet weak var average2: UILabel!
    @IBOutlet weak var average3: UILabel!
    @IBOutlet weak var average4: UILabel!
    @IBOutlet weak var averageTotal: UILabel!
    
    @IBOutlet weak var sum10_1: UILabel!
    @IBOutlet weak var sum10_2: UILabel!
    @IBOutlet weak var sum10_3: UILabel!
    @IBOutlet weak var sum10_4: UILabel!
    @IBOutlet weak var sum10Total: UILabel!
    

    @IBOutlet weak var sumX_1: UILabel!
    @IBOutlet weak var sumX_2: UILabel!
    @IBOutlet weak var sumX_3: UILabel!
    @IBOutlet weak var sumX_4: UILabel!
    @IBOutlet weak var sumXTotal: UILabel!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    var distanceText: String = "フリー（72射）"
    var intScoreSavingList = [[[Int]]]()
    var stringScoreSavingList = [[[String]]]()
    var sum10Lists: [[Int]] = [[0, 0], [0, 0], [0, 0], [0, 0]]
    var total: String = "-"
    var memo: String = ""
    
    var roundAverageList: [Double] = [0.0, 0.0, 0.0, 0.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        print(intScoreSavingList)
        
        averageOfThisMounthLabelText.text = ""
        averageOfaverageLabel.text = ""
        averageOf10PointsLabel.text = ""
        averageOfXPointsLabel.text = ""
        distance.text = distanceText
        
        inintialization()
        
//        print(roundAverageList)
        
        if roundAverageList[0] != 0 {
            average1.text = String(format: "%.2f", roundAverageList[0])
        } else {
            average1.text = "-"
        }
        if roundAverageList[1] != 0 {
            average2.text = String(format: "%.2f", roundAverageList[1])
        } else {
            average2.text = "-"
        }
        if roundAverageList[2] != 0 {
            average3.text = String(format: "%.2f", roundAverageList[2])
        } else {
            average3.text = "-"
        }
        if roundAverageList[3] != 0 {
            average4.text = String(format: "%.2f", roundAverageList[3])
        } else {
            average4.text = "-"
        }
        
        let sum10s = [sum10_1, sum10_2, sum10_3, sum10_4]
        let sumXs = [sumX_1, sumX_2, sumX_3, sumX_4]
        for i in 0..<4 {
            sum10s[i]?.text = String(sum10Lists[i][0])
            sumXs[i]?.text = String(sum10Lists[i][1])
        }
        
        
        totalScore.text = total
        print(memo)
        memoTextView.text = memo
        
        navigationController?.delegate = self
        
    }
    
    
    func inintialization() {
        for round in 0..<4 {
            var roundSum: Int = 0
            var roundCount: Int = 0
            
            for end in 0..<6 {
                var endSum: Int = 0
                
                for num in 0..<6 {
                    roundCount += 1
                    endSum += intScoreSavingList[round][end][num]
                    if intScoreSavingList[round][end][num] == 0 {
                        if stringScoreSavingList[round][end][num] == "" {
                            roundCount -= 1
                        }
                    }
                }
                
                roundSum += endSum
            }
            
            if roundCount != 0 {
                print("in")
                roundAverageList[round] = Double(roundSum) / Double(roundCount)
            }
        }
        
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        print("in dissap")
//        delegate?.fromDetail(memo: memoTextView.text)
//    }

    @IBAction func saveMemo(_ sender: Any) {
//        delegate?.fromDetail(memo: memo)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    

    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if let controller = viewController as? ScoreListViewController {
            controller.memo = memoTextView.text
        }
    }

    
    
    
}
