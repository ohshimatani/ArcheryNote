//
//  TargetViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/05.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {

    
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var drawnDotView: UIView!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    
    var colors: String = ""
    
    var point: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.text = colors
        
        
//        let dot = UIView()
//        dot.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
//        dot.backgroundColor = .black
//        self.view.addSubview(dot)

        
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            let location = touch.location(in: redButton)
//            print(location)
//            point = location
//        }
//    }
    
    
    
    
    @IBAction func tapRedButton(_ sender: Any, forEvent event: UIEvent) {
        
        if colors == ""{
            colors += "red"
        }else{
            colors += ", red"
        }
        colorLabel.text = colors
        
        if let location = event.touches(for: sender)?.first?.location(in: sender) {
            print(location)
            point = location
        }
        
        let dot = UIView()
        let x_val = point.x
        let y_val = point.y
        dot.frame = CGRect(x: x_val, y: y_val, width: 10, height: 10)
        dot.backgroundColor = .black
        self.view.addSubview(dot)
    }
    
    
    
    
    
    
    
    @IBAction func tapYellowButton(_ sender: Any) {
        if colors == ""{
            colors += "yellow"
        }else{
            colors += ", yellow"
        }
        colorLabel.text = colors
    }
    
    
    
}
