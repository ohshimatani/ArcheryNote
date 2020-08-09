//
//  TargetCustomView.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class TargetCustomView: UIView {
    
    @IBOutlet weak var buttonX: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var buttonM: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        print("suc")
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        print("fault")
        loadNib()
    }
    
    func loadNib(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "TargetCustomView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = self.bounds
        // viewのbackgroundColorはここで設定する必要がある
//        view.backgroundColor = UIColor.cyan
        initializeTargetButton()
        self.addSubview(view)
    }
    
    func initializeTargetButton(){
        
        let yellow: UIColor = UIColor.yellow
        let red: UIColor = UIColor.red
        let blue: UIColor = UIColor.blue
        let black: UIColor = UIColor.black
//        let _black: UIColor = UIColor.init(displayP3Red: 0.1, green: 0.1, blue: 0.1, alpha: 1)
        let white: UIColor = UIColor.white
        buttonX.backgroundColor = yellow
        button10.backgroundColor = yellow
        button9.backgroundColor = yellow
        button8.backgroundColor = red
        button7.backgroundColor = red
        button6.backgroundColor = blue
        button5.backgroundColor = blue
        button4.backgroundColor = black
        button3.backgroundColor = black
        button2.backgroundColor = white
        button1.backgroundColor = white
        
        let buttonList = [buttonX, button10, button9, button8, button7, button6,  button5, button4, button3, button2, button1]
        for button in buttonList{
            button?.layer.cornerRadius = (button?.frame.width)! / 2
            if button?.backgroundColor == black{
                button?.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button?.layer.borderColor = black.cgColor
            }
            button?.layer.borderWidth = 1.0
        }
        
    }
    
    
    
}
