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
        
        let buttonsCornerRadiusValue: CGFloat = 25.0
        scoreListButton.layer.cornerRadius = buttonsCornerRadiusValue
        tuningListButton.layer.cornerRadius = buttonsCornerRadiusValue
        settingListButton.layer.cornerRadius = buttonsCornerRadiusValue
        pointsButton.layer.cornerRadius = buttonsCornerRadiusValue
        trainingListButton.layer.cornerRadius = buttonsCornerRadiusValue
        
        
    }
    
    
    // to ScoreList ViewController
    @IBAction func toScoreList(_ sender: Any) {
        performSegue(withIdentifier: "toScoreList", sender: nil)
    }
    
    // to TuningList ViewController
    @IBAction func toTuningList(_ sender: Any) {
        performSegue(withIdentifier: "toTuningList", sender: nil)
    }
    
    // to BowSettings ViewController
    @IBAction func toSettingsList(_ sender: Any) {
        performSegue(withIdentifier: "toBowSettings", sender: nil)
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
