//
//  TargetViewController.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/05.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {

    
    @IBOutlet weak var targetView: TargetCustomView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonList = [targetView.buttonX, targetView.button10, targetView.button9, targetView.button8, targetView.button7, targetView.button6,  targetView.button5, targetView.button4, targetView.button3, targetView.button2, targetView.button1, targetView.buttonM]
        
        for button in buttonList {
            button?.clipsToBounds = true
            button?.layer.masksToBounds = true
        }
        
        targetView.buttonX.addTarget(self, action: #selector(didTapX(sender:forEvent:)), for: .touchUpInside)
        targetView.button10.addTarget(self, action: #selector(didTap10(sender:forEvent:)), for: .touchUpInside)
        targetView.button9.addTarget(self, action: #selector(didTap9(sender:forEvent:)), for: .touchUpInside)
        targetView.button8.addTarget(self, action: #selector(didTap8(sender:forEvent:)), for: .touchUpInside)
        targetView.button7.addTarget(self, action: #selector(didTap7(sender:forEvent:)), for: .touchUpInside)
        targetView.button6.addTarget(self, action: #selector(didTap6(sender:forEvent:)), for: .touchUpInside)
        targetView.button5.addTarget(self, action: #selector(didTap5(sender:forEvent:)), for: .touchUpInside)
        targetView.button4.addTarget(self, action: #selector(didTap4(sender:forEvent:)), for: .touchUpInside)
        targetView.button3.addTarget(self, action: #selector(didTap3(sender:forEvent:)), for: .touchUpInside)
        targetView.button2.addTarget(self, action: #selector(didTap2(sender:forEvent:)), for: .touchUpInside)
        targetView.button1.addTarget(self, action: #selector(didTap1(sender:forEvent:)), for: .touchUpInside)
        targetView.buttonM.addTarget(self, action: #selector(didTapM(sender:forEvent:)), for: .touchUpInside)
        
        
        
    }
    
    func getLocation(sender: UIButton, event: UIEvent){
        print(sender)
        var point: CGPoint!
        if let location = event.touches(for: sender)?.first?.location(in: self.targetView) {
            print(location)
            point = location
        }else{
            return
        }
        addDot(sender: sender, point: point)
    }
    
    func addDot(sender: UIButton, point: CGPoint){
        let dot = UIView()
        let rad: CGFloat = 10
        dot.frame = CGRect(x: point.x - rad/2, y: point.y - rad/2, width: rad, height: rad)
        if (sender == targetView.button3) || (sender == targetView.button4) {
            dot.backgroundColor = .white
        } else {
            dot.backgroundColor = .black
        }
        dot.layer.cornerRadius = 5
        self.targetView.addSubview(dot)
    }
    
    @objc func didTapX(sender: UIButton, forEvent event: UIEvent) {
        print("X")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap10(sender: UIButton, forEvent event: UIEvent) {
        print("10")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap9(sender: UIButton, forEvent event: UIEvent) {
        print("9")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap8(sender: UIButton, forEvent event: UIEvent) {
        print("8")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap7(sender: UIButton, forEvent event: UIEvent) {
        print("7")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap6(sender: UIButton, forEvent event: UIEvent) {
        print("6")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap5(sender: UIButton, forEvent event: UIEvent) {
        print("5")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap4(sender: UIButton, forEvent event: UIEvent) {
        print("4")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap3(sender: UIButton, forEvent event: UIEvent) {
        print("3")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap2(sender: UIButton, forEvent event: UIEvent) {
        print("2")
        getLocation(sender: sender, event: event)
    }
    @objc func didTap1(sender: UIButton, forEvent event: UIEvent) {
        print("1")
        getLocation(sender: sender, event: event)
    }
    @objc func didTapM(sender: UIButton, forEvent event: UIEvent) {
        print("M")
        getLocation(sender: sender, event: event)
    }
    
    
    
}
