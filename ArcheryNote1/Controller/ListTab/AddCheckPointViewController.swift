//
//  AddCheckPointViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class AddCheckPointViewController: UIViewController {

    @IBOutlet weak var checkPointTextField: UITextField!
    
    @IBOutlet weak var howImportantSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var howImportantColor: UIView!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var howImportant: Int = 0
//    let UserDefaultsKey = "CheckPointList"
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        howImportantColor.layer.cornerRadius = howImportantColor.bounds.width / 2.0
        howImportantColor.layer.masksToBounds = true
        
        if checkPointTextField.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // Save button can only use(activate) when text field is not nil.
    @IBAction func textFieldActionButtonInActive(_ sender: Any) {
        if checkPointTextField.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    
    // Tap segmented control
    @IBAction func tapSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            howImportant = 0
            howImportantColor.backgroundColor = UIColor.blue
            break
        case 1:
            howImportant = 1
            howImportantColor.backgroundColor = UIColor.systemYellow
            break
        case 2:
            howImportant = 2
            howImportantColor.backgroundColor = UIColor.red
            break
        default:
            print("default")
            break
        }
    }
    
    
    
    // Tap save button.
    @IBAction func save(_ sender: Any) {
        let realm = try! Realm()
        let _checkPoint = CheckPoint()
        _checkPoint.checkPoint = checkPointTextField.text!
        _checkPoint.howImportant = howImportant
        _checkPoint.memo = memoTextView.text!
        try! realm.write {
            realm.add(_checkPoint)
        }
        
        print("done")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cansel(_ sender: Any) {
        if (checkPointTextField.text == "") && (memoTextView.text == ""){
            self.dismiss(animated: true, completion: nil)
        }else{
            MyFunctions.Alert(alertType: "cancel", viewController: self)
        }
    }
    
    
    @IBAction func trash(_ sender: Any) {
        //-------------------------------------------
        if checkPointTextField.text == nil && memoTextView.text == nil{
            return
        }else{
            MyFunctions.Alert(alertType: "trash", viewController: self)
        }

    }
    
    
    
}

