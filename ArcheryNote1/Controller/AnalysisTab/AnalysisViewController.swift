//
//  AnalysisViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class AnalysisViewController: UIViewController {
    
    
    @IBOutlet weak var shotNumButton: UIButton!
    
    @IBOutlet weak var scoreButton: UIButton!
    
    @IBOutlet weak var bestButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        shotNumButton.layer.cornerRadius = 20.0
        scoreButton.layer.cornerRadius = 20.0
        bestButton.layer.cornerRadius = 20.0
        
        
        
        
        
    }
    
    
    
    @IBAction func toShotNum(_ sender: Any) {
        performSegue(withIdentifier: "toShotNum3month", sender: nil)
    }
    
    
    @IBAction func toScore(_ sender: Any) {
        performSegue(withIdentifier: "toScore3month", sender: nil)
    }
    
    
    @IBAction func toBestScore(_ sender: Any) {
        performSegue(withIdentifier: "toBestScore", sender: nil)
    }
    
    
    
    
    
    
    
}
