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
    var totalAverage: Double = 0
    
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
            sum10_1.text = "-"
            sumX_1.text = "-"
        }
        if roundAverageList[1] != 0 {
            average2.text = String(format: "%.2f", roundAverageList[1])
        } else {
            average2.text = "-"
            sum10_2.text = "-"
            sumX_2.text = "-"
        }
        if roundAverageList[2] != 0.0 {
            average3.text = String(format: "%.2f", roundAverageList[2])
        } else {
            average3.text = "-"
            sum10_3.text = "-"
            sumX_3.text = "-"
        }
        if roundAverageList[3] != 0 {
            average4.text = String(format: "%.2f", roundAverageList[3])
        } else {
            average4.text = "-"
            sum10_4.text = "-"
            sumX_4.text = "-"
        }
        if totalAverage != 0 {
            averageTotal.text = String(format: "%.2f", totalAverage)
        } else {
            averageTotal.text = "-"
            sum10Total.text = "-"
            sumXTotal.text = "-"
        }
        
        let sum10s = [sum10_1, sum10_2, sum10_3, sum10_4]
        let sumXs = [sumX_1, sumX_2, sumX_3, sumX_4]
        var total10s: Int = 0
        var totalXs: Int = 0
        for i in 0..<4 {
            sum10s[i]?.text = String(sum10Lists[i][0])
            sumXs[i]?.text = String(sum10Lists[i][1])
            total10s += sum10Lists[i][0]
            totalXs += sum10Lists[i][1]
        }
        if total10s == 0 {
            sum10Total.text = "-"
        }else{
            sum10Total.text = String(total10s)
        }
        if totalXs == 0 {
            sumXTotal.text = "-"
        }else{
            sumXTotal.text = String(totalXs)
        }
        
        
        
        totalScore.text = total
        memoTextView.text = memo
        
        navigationController?.delegate = self
        
    }
    
    
    func inintialization() {
        var grandCount: Int = 0
        var grandSum: Int = 0
        
        for round in 0..<4 {
            var roundSum: Int = 0
            var roundCount: Int = 0
            
            for end in 0..<6 {
                var endSum: Int = 0
                
                for num in 0..<6 {
                    roundCount += 1
                    grandCount += 1
                    endSum += intScoreSavingList[round][end][num]
                    if intScoreSavingList[round][end][num] == 0 {
                        if stringScoreSavingList[round][end][num] == "" {
                            grandCount -= 1
                            roundCount -= 1
                            
                        }
                    }
                }
                
                roundSum += endSum
                grandSum += endSum
            }
            
            if roundCount != 0 {
                roundAverageList[round] = Double(roundSum) / Double(roundCount)
            }
        }
        if grandCount != 0 {
            totalAverage = Double(grandSum) / Double(grandCount)
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
