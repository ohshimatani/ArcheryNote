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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        targetView = (Bundle(for: type(of: self)).loadNibNamed("TargetCustomView", owner: self, options: nil)!.first as? UIView as! TargetCustomView)
//        self.view.addSubview(targetView)

        
    }
    
    
    
    
}
