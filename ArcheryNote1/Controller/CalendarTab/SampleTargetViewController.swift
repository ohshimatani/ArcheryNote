//
//  SampleTargetViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class SampleTargetViewController: UIViewController {

    
    @IBOutlet weak var colorLabel: UILabel!
        
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!


    @IBOutlet weak var whiteView: UIView!


    
    var colors: String = ""
    
    var point: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorLabel.text = colors
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(singleTap(_:)))
        whiteView.addGestureRecognizer(tapGesture)
//        whiteView.layer.cornerRadius = whiteView.frame.width / 2
        
    }
    
    @objc func singleTap(_ sender: UIView) {
        print("view tap !!!!!")
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
        
        // for: self.view
        if let location = event.touches(for: sender)?.first?.location(in: sender) {
            print(location)
            point = location
        }else{
            return
        }
        
        let dot = UIView()
        let dotRadius: CGFloat = 10.0
//        dot.frame = CGRect(x: point.x, y: point.y, width: 10, height: 10)
        let dotPoint: CGPoint = CGPoint(x: point.x, y: point.y)
        let dotSize: CGSize = CGSize(width: dotRadius, height: dotRadius)
        dot.frame = CGRect(origin: dotPoint, size: dotSize)
        dot.backgroundColor = .black
        dot.layer.cornerRadius = dotRadius/2
        self.view.addSubview(dot)
    }
        
        
        

}
