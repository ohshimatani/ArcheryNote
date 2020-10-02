//
//  BowSettingsViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class BowSettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
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
