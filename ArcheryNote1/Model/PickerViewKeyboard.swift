//
//  PickerViewKeyboard.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/06.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import UIKit

protocol PickerViewKeyboardDelegate {
    func titlesOfPickerViewKeyboard(sender: PickerViewKeyboard) -> Array<String>
    func initSelectedRow(sender: PickerViewKeyboard) -> Int
    func didCancel(sender: PickerViewKeyboard)
    func didDone(sender: PickerViewKeyboard, selectedData: String)
}

class PickerViewKeyboard: UIButton {
    var delegate: PickerViewKeyboardDelegate!
    var pickerView: UIPickerView!
    var selectedIndex: Int!

    override var canBecomeFirstResponder: Bool {
        return true
    }

    // ピッカーに表示させるデータ
    var data: Array<String> {
        return delegate.titlesOfPickerViewKeyboard(sender: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.addTarget(self, action: #selector(didTouchUpInside(_:)), for: .touchUpInside)
    }

    @objc func didTouchUpInside(_ sender: UIButton) {
        becomeFirstResponder()
    }

    override var inputView: UIView? {
        pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self

        let row = delegate.initSelectedRow(sender: self)
        selectedIndex = row
        pickerView.selectRow(row, inComponent: 0, animated: true)

        return pickerView
    }

    override var inputAccessoryView: UIView? {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)

        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(PickerViewKeyboard.cancelPicker))
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(PickerViewKeyboard.donePicker))

        let toolbarItems = [space, cancelItem, flexSpaceItem, doneButtonItem, space]

        toolbar.setItems(toolbarItems, animated: true)

        return toolbar
    }

    @objc func cancelPicker() {
        delegate.didCancel(sender: self)
    }

    @objc func donePicker() {
//        delegate.didDone(sender: self, selectedData: data[pickerView.selectedRow(inComponent: 0)])
        delegate.didDone(sender: self, selectedData: data[selectedIndex])

    }
}

extension PickerViewKeyboard: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
}
