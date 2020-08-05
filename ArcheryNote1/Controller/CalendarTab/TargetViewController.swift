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
        
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    
    var colors: String = ""
    
    var point: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.text = colors
        

        
    }
    
    
    
    @IBAction func tapRedButton(_ sender: UIButton, forEvent event: UIEvent) {
        if colors == ""{
            colors += "red"
        }else{
            colors += ", red"
        }
        colorLabel.text = colors
        
        if let location = event.touches(for: sender)?.first?.location(in: self.view) {
            print(location)
            point = location
        }else{
            return
        }
        
        let dot = UIView()
        dot.frame = CGRect(x: point.x, y: point.y, width: 10, height: 10)
        dot.backgroundColor = .black
        dot.layer.cornerRadius = 5
        self.view.addSubview(dot)
        
    }
    
    
    @IBAction func tapYellowButton(_ sender: UIButton, forEvent event: UIEvent) {
        if colors == ""{
            colors += "yellow"
        }else{
            colors += ", yellow"
        }
        colorLabel.text = colors
        
        if let location = event.touches(for: sender)?.first?.location(in: self.view) {
            print(location)
            point = location
        }else{
            return
        }
        
        let dot = UIView()
        dot.frame = CGRect(x: point.x, y: point.y, width: 10, height: 10)
        dot.backgroundColor = .black
        dot.layer.cornerRadius = 5
        self.view.addSubview(dot)
    }
    
    
    
    
}
