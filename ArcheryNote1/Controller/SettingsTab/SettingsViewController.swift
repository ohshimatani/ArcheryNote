//
//  SettingsViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController{
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var distanceChangeButton: PickerViewKeyboard!
    
    
    @IBOutlet weak var handSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var RCCPSegmentedControl: UISegmentedControl!
    
    var distance: String!
    var isRightHanded: Bool!
    var isCPPlayer: Bool!
    
    var idx: Int = 0
    
    let keysList =  ["free_72", "free_36", "free_144", "70", "70W", "1440M"]
    var dataSource: [String] = []
    var nowIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        distanceChangeButton.delegate = self
        
        distance = UserDefaults.standard.string(forKey: "defaultDistance") ?? "フリー（72射）"
        isRightHanded = UserDefaults.standard.bool(forKey: "isRightHanded")
        isCPPlayer = UserDefaults.standard.bool(forKey: "isCPPlayer")
        
        initializeSegmentedControlls()
        
        distanceLabel.text = distance
        
        for key in keysList {
            dataSource.append(MyFunctions.distanceKeytoLabelText(key: key))
        }
        
        var i = -1
        for data in dataSource {
            i += 1
            if data == distanceLabel.text {
                nowIndex = i
                break
            }
        }
        
    }
    
    func initializeSegmentedControlls() {
        if isRightHanded == false {
            handSegmentedControl.selectedSegmentIndex = 0
        } else {
            handSegmentedControl.selectedSegmentIndex = 1
        }
        if isCPPlayer == false {
            RCCPSegmentedControl.selectedSegmentIndex = 0
        } else {
            RCCPSegmentedControl.selectedSegmentIndex = 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    @IBAction func handSegmentedControlDidChange(_ sender: Any) {
        if handSegmentedControl.selectedSegmentIndex == 0 {
            UserDefaults.standard.set(false, forKey: "isRightHanded")
        } else {
            UserDefaults.standard.set(true, forKey: "isRightHanded")
        }
    }
    
    @IBAction func RCCPSegmentedControlDidChange(_ sender: Any) {
        if RCCPSegmentedControl.selectedSegmentIndex == 0 {
            UserDefaults.standard.set(false, forKey: "isCPPlayer")
        } else {
            UserDefaults.standard.set(true, forKey: "isCPPlayer")
        }
    }
    
    

}



extension SettingsViewController: PickerViewKeyboardDelegate {
    func titlesOfPickerViewKeyboard(sender: PickerViewKeyboard) -> Array<String> {
        return dataSource
    }
    func initSelectedRow(sender: PickerViewKeyboard) -> Int {
        return nowIndex
    }
    func didDone(sender: PickerViewKeyboard, selectedData: String) {
        print(selectedData)
        self.view.endEditing(true)
        distanceLabel.text = selectedData
        UserDefaults.standard.set(selectedData, forKey: "defaultDistance")
    }
    func didCancel(sender: PickerViewKeyboard) {
        print("canceled")
        self.view.endEditing(true)
    }
}
