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
    
    var result: CheckPoint!
    var isEdit = false
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        howImportantColor.layer.cornerRadius = howImportantColor.bounds.width / 2.0
        howImportantColor.layer.masksToBounds = true
        
        if checkPointTextField.text == "" && isEdit == false{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
        
        checkPointTextField.text = result.checkPoint
        howImportant = result.howImportant
        howImportantColor.backgroundColor = setColor(howImportant: howImportant)
        howImportantSegmentedControl.selectedSegmentIndex = howImportant
        memoTextView.text = result.memo
    }
    
    
    func setColor(howImportant: Int) -> UIColor{
        switch howImportant {
        case 0:
            return UIColor.blue
        case 1:
            return UIColor.systemYellow
        case 2:
            return UIColor.red
        default:
            return UIColor.blue
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
        howImportant = sender.selectedSegmentIndex
        howImportantColor.backgroundColor = setColor(howImportant: howImportant)
    }
    
    
    
    // Tap save button.
    @IBAction func save(_ sender: Any) {
        let realm = try! Realm()
        if isEdit {
            try! realm.write{
                result.checkPoint = checkPointTextField.text!
                result.howImportant = howImportant
                result.memo = memoTextView.text
            }
        }else{
            let _checkPoint = CheckPoint()
            _checkPoint.checkPoint = checkPointTextField.text!
            _checkPoint.howImportant = howImportant
            _checkPoint.memo = memoTextView.text!
            try! realm.write {
                realm.add(_checkPoint)
            }
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
        if isEdit == false {
            return
        }else{
            let alart = UIAlertController(title: "削除", message: "本当に削除しますか？", preferredStyle: .alert)
            let yesAction = UIAlertAction(title: "はい", style: .default) { (action) in
                print("yes")
                if self.result != nil{
                    let realm = try! Realm()
                    try! realm.write{
                        realm.delete(self.result)
                    }
                }
            }
            let noAction = UIAlertAction(title: "いいえ", style: .default) { (action) in
                print("no")
            }
            alart.addAction(yesAction)
            alart.addAction(noAction)
            self.present(alart, animated: true, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    
    
}

