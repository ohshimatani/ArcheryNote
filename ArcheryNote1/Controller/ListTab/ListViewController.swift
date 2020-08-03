//
//  ListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    
    
    @IBOutlet weak var scoreListButton: UIButton!
    
    @IBOutlet weak var tuningListButton: UIButton!
    
    @IBOutlet weak var settingListButton: UIButton!
    
    @IBOutlet weak var pointsButton: UIButton!
    
    @IBOutlet weak var trainingListButton: UIButton!
    
    let buttonsCornerRadiusNumber = 20.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonsCornerRadiusNumber: CGFloat = 25.0
        scoreListButton.layer.cornerRadius = buttonsCornerRadiusNumber
        tuningListButton.layer.cornerRadius = buttonsCornerRadiusNumber
        pointsButton.layer.cornerRadius = buttonsCornerRadiusNumber
        trainingListButton.layer.cornerRadius = buttonsCornerRadiusNumber
        
        
    }
    
    
    // to ScoreList ViewController
    @IBAction func toScoreList(_ sender: Any) {
        performSegue(withIdentifier: "toScoreList", sender: nil)
    }
    
    // to TuningList ViewController
    @IBAction func toTuningList(_ sender: Any) {
        performSegue(withIdentifier: "toTuningList", sender: nil)
    }
    
    // to Points ViewController
    @IBAction func toPoints(_ sender: Any) {
        performSegue(withIdentifier: "toPoints", sender: nil)
    }
    
    // to TrainingList ViewController
    @IBAction func toTrainingList(_ sender: Any) {
        performSegue(withIdentifier: "toTrainingList", sender: nil)
    }
    
    
    
    
        
}
