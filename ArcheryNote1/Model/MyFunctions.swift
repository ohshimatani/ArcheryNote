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
    
    class func distanceKeytoLabelText(key: String) -> String {
        switch key {
        case "70W":
            return "70mW"
        case "50W":
            return "50mW"
        case "SH":
            return "ショートハーフ（5030）"
        case "1440M":
            return "1440ラウンド(M)"
        case "1440W":
            return "1440ラウンド(W)"
        case "60W":
            return "60mW"
        case "18W":
            return "インドアラウンド（18m×60射）"
        case "30W":
            return "30mW"
        case "free_36":
            return "フリー（36射）"
        case "free_72":
            return "フリー（72射）"
        case "free_144":
            return "フリー（144射）"
        case "18_30":
            return "18m（30射）"
        case "18_36":
            return "18m（36射）"
        default:
            return key + "m"
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
