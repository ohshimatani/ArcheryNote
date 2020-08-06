//
//  MyFunctions.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/13.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import UIKit

class MyFunctions: NSObject{
    
    
    class func getDate() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyyMdE", options: 0, locale: Locale(identifier: "ja_JP"))
        print(dateFormatter.string(from: date))
        return dateFormatter.string(from: date)
    }
    
    class func Alert(alertType: String, viewController: UIViewController){
        switch alertType {
        case "cancel":
            // --------------このアラートのUXどうなん？-------------
            let alert = UIAlertController(title: "キャンセル", message: "本当にキャンセルしますか？", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "はい", style: .cancel) { (action) in
                viewController.dismiss(animated: true, completion: nil)
            }
            let NGAction = UIAlertAction(title: "いいえ", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(OKAction)
            alert.addAction(NGAction)
            viewController.present(alert, animated: true, completion: nil)
            break
        case "trash":
            let alert = UIAlertController(title: "本当に削除しますか？", message: "記入内容が失われてしまいます", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "はい", style: .destructive) { (action) in
                viewController.dismiss(animated: true, completion: nil)
            }
            let NGAction = UIAlertAction(title: "いいえ", style: .default) { (action) in
                alert.dismiss(animated: true, completion: nil)
            }
            alert.addAction(OKAction)
            alert.addAction(NGAction)
            viewController.present(alert, animated: true, completion: nil)
            
            // -----------------削除するコード--------------------
            
            
            // ------------------------------------------------
            break
        
        default:
            break
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
