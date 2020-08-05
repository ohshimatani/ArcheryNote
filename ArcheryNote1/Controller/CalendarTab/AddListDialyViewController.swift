//
//  AddListDialyViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class AddListDialyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var addTableView: UITableView!
    
    
    
    var selectedNumber: Int = 0
    var checkPointList: Results<CheckPoint>!
    var trainingMenuList: Results<TrainingMenu>!
    var CPTuningList: Results<TuningCP>!
    var RCTuningList: Results<TuningRC>!
    var modelList: [Any]!
    
    
    let globalBowDiscipline = "RC"
    
    let customCellVCName = "ListForAddingDialyTableViewCell"
    let customCellKeyName = "listForDialyCustomCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTableView.delegate = self
        addTableView.dataSource = self
        
        let nib = UINib(nibName: customCellVCName, bundle: .main)
        addTableView.register(nib, forCellReuseIdentifier: customCellKeyName)
        addTableView.tableFooterView = UIView()
        
        let realm = try! Realm()
        checkPointList = realm.objects(CheckPoint.self).sorted(byKeyPath: "howImportant", ascending: false)
        trainingMenuList = realm.objects(TrainingMenu.self)
        CPTuningList = realm.objects(TuningCP.self)
        RCTuningList = realm.objects(TuningRC.self)
        
        modelList = [checkPointList as Any, trainingMenuList as Any]
        
        if globalBowDiscipline == "CP" {
            modelList.append(CPTuningList as Any)
        }else{
            modelList.append(RCTuningList as Any)
        }
        
        
        
    }
    
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        selectedNumber = sender.selectedSegmentIndex
        
        addTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if modelList != nil{
            return (modelList[selectedNumber] as AnyObject).count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listForAddingDialyCustomCell", for: indexPath)
        
        return cell
    }
    
    
    
    
}
