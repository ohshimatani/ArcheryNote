//
//  AddCPTuningViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class AddCPTuningViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var nockingPointTextView: UITextView!

    @IBOutlet weak var peepTextView: UITextView!
    
    @IBOutlet weak var memoTextView: UITextView!
    
    @IBOutlet weak var saveButton: UIButton!
    
    var today: String!
    
    var result: TuningCP!
    var isEdit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isEdit{
            titleTextField.text = result.title
            nockingPointTextView.text = result.nockingPoint
            peepTextView.text = result.peep
            memoTextView.text = result.memo
        }else{
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMdE", options: 0, locale: Locale(identifier: "ja_JP"))
            print(dateFormatter.string(from: date))
            
            today = dateFormatter.string(from: date)
            titleTextField.text = today
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func textFieldActionButtonInActive(_ sender: Any) {
        if titleTextField.text == ""{
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        let realm = try! Realm()
        if isEdit{
            try! realm.write {
                result.title = titleTextField.text!
                result.nockingPoint = nockingPointTextView.text
                result.peep = peepTextView.text
                result.memo = memoTextView.text
            }
        }else{
            let _tuningCPList = TuningCP()
            _tuningCPList.date = today
            _tuningCPList.title = titleTextField.text!
            _tuningCPList.nockingPoint = nockingPointTextView.text!
            _tuningCPList.peep = peepTextView.text!
            _tuningCPList.memo = memoTextView.text!
            try! realm.write {
                realm.add(_tuningCPList)
            }
        }
        
        print("done")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        if isEdit{
            if (titleTextField.text == result.title) && (nockingPointTextView.text == result.nockingPoint) && (peepTextView.text == result.peep) && (memoTextView.text == result.memo){
                self.dismiss(animated: true, completion: nil)
            }
        }
        if (titleTextField.text == "") && (nockingPointTextView.text == "") && (peepTextView.text == "") && (memoTextView.text == ""){
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
