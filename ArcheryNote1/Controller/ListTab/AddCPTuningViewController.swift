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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMdE", options: 0, locale: Locale(identifier: "ja_JP"))
        print(dateFormatter.string(from: date))
        
        today = dateFormatter.string(from: date)
        titleTextField.text = today
        
        
        
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
        let _tuningCPList = TuningCP()
        _tuningCPList.date = today
        _tuningCPList.title = titleTextField.text!
        _tuningCPList.nockingPoint = nockingPointTextView.text!
        _tuningCPList.peep = peepTextView.text!
        _tuningCPList.memo = memoTextView.text!
        try! realm.write {
            realm.add(_tuningCPList)
        }
        
        print("done")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    @IBAction func cancel(_ sender: Any) {
    }
    
    
    @IBAction func trash(_ sender: Any) {
    }
    
    
    
    
    
    

}
