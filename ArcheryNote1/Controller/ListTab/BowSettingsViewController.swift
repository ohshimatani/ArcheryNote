//
//  BowSettingsViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class BowSettingsViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
    }
    
    @IBAction func addBowSettings(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            performSegue(withIdentifier: "toRCBowSettings", sender: nil)
        case 1:
            performSegue(withIdentifier: "toCPBowSettings", sender: nil)
        default:
            break
        }
    }
    
   
    
    
    
    
}
