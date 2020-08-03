//
//  AddRCTuningViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/02.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit
import RealmSwift

class AddRCTuningViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var braceHeightTextField: UITextField!
    
    @IBOutlet weak var upperTillerHeightTextField: UITextField!
    
    @IBOutlet weak var lowerTillerHeightTextField: UITextField!
    
    @IBOutlet weak var tillerDifferenceLabel: UILabel!
    
    @IBOutlet weak var nockingPointTextView: UITextView!
    
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
        
        self.braceHeightTextField.keyboardType = UIKeyboardType.decimalPad
        self.upperTillerHeightTextField.keyboardType = UIKeyboardType.decimalPad
        self.lowerTillerHeightTextField.keyboardType = UIKeyboardType.decimalPad
        
        

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
    
    
    @IBAction func upperTillerHeightDidEnd(_ sender: Any) {
        if let lowerValue = Double(lowerTillerHeightTextField.text!), let upperValue = Double(upperTillerHeightTextField.text!){
            tillerDifferenceLabel.text = String(upperValue - lowerValue)
        }
    }
    
    @IBAction func lowerTillerHeightDidEnd(_ sender: Any) {
        if let lowerValue = Double(lowerTillerHeightTextField.text!), let upperValue = Double(upperTillerHeightTextField.text!){
            let diff = upperValue - lowerValue
            tillerDifferenceLabel.text = String(format: "%.2f", diff)
        }
    }
    
    
    
    
    @IBAction func save(_ sender: Any) {
        var valueList = [0.0, 0.0, 0.0]
        let textFieldList = [braceHeightTextField, upperTillerHeightTextField, lowerTillerHeightTextField]
        for index in 0..<valueList.count{
            if let num = Double(textFieldList[index]!.text!){
                valueList[index] = num
            }else{
                valueList[index] = 0.0
            }
        }
        let braceHeightValue: Double = valueList[0]
        let uppertillerHeightValue: Double = valueList[1]
        let lowertillerHeightValue: Double  = valueList[2]
        let realm = try! Realm()
        let _tuningRC = TuningRC()
        _tuningRC.date = today
        _tuningRC.title = titleTextField.text!
        _tuningRC.braceHeight = braceHeightValue
        _tuningRC.uppertillerHeight = uppertillerHeightValue
        _tuningRC.lowertillerHeight = lowertillerHeightValue
        _tuningRC.nockingPoint = nockingPointTextView.text!
        _tuningRC.memo = memoTextView.text
        
        try! realm.write {
            realm.add(_tuningRC)
        }
        
        print("save")
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        if (braceHeightTextField.text == "") && (upperTillerHeightTextField.text == "") && (lowerTillerHeightTextField.text == "") && (nockingPointTextView.text == "") && (memoTextView.text == ""){
            self.dismiss(animated: true, completion: nil)
        }else{
            MyFunctions.Alert(alertType: "cancel", viewController: self)
        }

    }
    
    
    @IBAction func trash(_ sender: Any) {
    }
    
    
    
}
