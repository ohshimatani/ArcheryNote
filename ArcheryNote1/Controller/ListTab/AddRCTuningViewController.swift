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
    
    var result: TuningRC!
    var isEdit = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.braceHeightTextField.keyboardType = UIKeyboardType.decimalPad
        self.upperTillerHeightTextField.keyboardType = UIKeyboardType.decimalPad
        self.lowerTillerHeightTextField.keyboardType = UIKeyboardType.decimalPad
        
        if isEdit{
            titleTextField.text = result.title
            braceHeightTextField.text = String(result.braceHeight)
            upperTillerHeightTextField.text = String(result.uppertillerHeight)
            lowerTillerHeightTextField.text = String(result.lowertillerHeight)
            nockingPointTextView.text = result.nockingPoint
            memoTextView.text = result.memo
        }else{
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMdE", options: 0, locale: Locale(identifier: "ja_JP"))
            print(dateFormatter.string(from: date))
            today = dateFormatter.string(from: date)
            titleTextField.text = today
        }

        memoTextView.delegate = self
        nockingPointTextView.delegate = self
        
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
        if isEdit{
            try! realm.write {
                result.title = titleTextField.text!
                result.braceHeight = braceHeightValue
                result.uppertillerHeight = uppertillerHeightValue
                result.lowertillerHeight = lowertillerHeightValue
                result.nockingPoint = nockingPointTextView.text
                result.memo = memoTextView.text
            }
        }else{
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

extension AddRCTuningViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        let upHeight: CGFloat = 200.0
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
