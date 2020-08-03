//
//  AddTrainingViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class AddTrainingViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if titleTextField.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }

        
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func textFieldButtonActionInActive(_ sender: Any) {
        if titleTextField.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }

    }
    
    @IBAction func save(_ sender: Any) {
        let realm = try! Realm()
        let _trainingMenu = TrainingMenu()
        _trainingMenu.title = titleTextField.text!
        _trainingMenu.detail = detailTextView.text!
        _trainingMenu.memo = memoTextView.text!
        try! realm.write{
            realm.add(_trainingMenu)
        }
        print("save")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cansel(_ sender: Any) {
//        if (checkPointTextField.text == "") && (memoTextView.text == ""){
//            self.dismiss(animated: true, completion: nil)
//        }else{
//            MyFunctions.Alert(alertType: "cansel", viewController: self)
//        }
        if (titleTextField.text == "") && (detailTextView.text == "" || memoTextView.text == ""){
            self.dismiss(animated: true, completion: nil)
        }else{
            MyFunctions.Alert(alertType: "cansel", viewController: self)
        }

    }
    
    @IBAction func trash(_ sender: Any) {
    }
    
    
}
