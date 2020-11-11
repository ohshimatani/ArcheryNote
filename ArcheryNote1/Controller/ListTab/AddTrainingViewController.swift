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
    
    @IBOutlet weak var trashButton: UIBarButtonItem!
    
    var isEdit = false
    var result: TrainingMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if titleTextField.text! == "" && isEdit == false{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
        
        
        if result != nil {
            titleTextField.text = result.title
            detailTextView.text = result.detail
            memoTextView.text = result.memo
        }
        
        memoTextView.delegate = self
        
    }
    
    
    // close keyboard when tap any point
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
        if isEdit && result != nil{
            try! realm.write {
                result.title = titleTextField.text!
                result.detail = detailTextView.text
                result.memo = memoTextView.text
            }
        }else{
            let _trainingMenu = TrainingMenu()
            _trainingMenu.title = titleTextField.text!
            _trainingMenu.detail = detailTextView.text!
            _trainingMenu.memo = memoTextView.text!
            try! realm.write{
                realm.add(_trainingMenu)
            }
        }
        
        print("save")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cansel(_ sender: Any) {
        if (titleTextField.text == "") && (detailTextView.text == "" || memoTextView.text == ""){
            self.dismiss(animated: true, completion: nil)
        } else {
            print("else")
            MyFunctions.Alert(alertType: "cancel", viewController: self)
        }

    }
    
    
    @IBAction func trash(_ sender: Any) {
        if isEdit == false {
            self.dismiss(animated: true, completion: nil)
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
                self.dismiss(animated: true, completion: nil)
            }
            let noAction = UIAlertAction(title: "いいえ", style: .default) { (action) in
                print("no")
                alart.dismiss(animated: true, completion: nil)
            }
            alart.addAction(yesAction)
            alart.addAction(noAction)
            self.present(alart, animated: true, completion: nil)
//            self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
extension AddTrainingViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        let upHeight: CGFloat = 125.0
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= upHeight
        } else {
            let suggestionHeight = self.view.frame.origin.y + upHeight
            self.view.frame.origin.y -= suggestionHeight
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
