//
//  BestScoreListViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class BestScoreListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var bestScoreTableView: UITableView!
    
    let cellKey: String = "bestAndAverageScoreCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "BestAndAverageScoreTableViewCell", bundle: .main)
        bestScoreTableView.register(nib, forCellReuseIdentifier: cellKey)
        bestScoreTableView.delegate = self
        bestScoreTableView.dataSource = self

        
        
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellKey) as! BestAndAverageScoreTableViewCell
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "title"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    
    
    
}
