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
    
    class func getTodayInt() -> (Int, Int, Int, Int){
        let date = Date()
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMdHms", options: 0, locale: Locale(identifier: "ja_JP"))
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let weekday = tmpDate.component(.weekday, from: date)
        return (year, month, day, weekday)
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
    
    class func labelTexttoDistanceKey(text: String) -> String {
        switch text {
        case "70mW":
            return "70W"
        case "50mW":
            return "50W"
        case "ショートハーフ（5030）":
            return "SH"
        case "1440ラウンド(M)":
            return "1440M"
        case "1440ラウンド(W)":
            return "1440W"
        case "60mW":
            return "60W"
        case "インドアラウンド（18m×60射）":
            return "18W"
        case "30mW":
            return "30W"
        case "フリー（36射）":
            return "free_36"
        case "フリー（72射）":
            return "free_72"
        case "フリー（144射）":
            return "free_144"
        case "18m（30射）":
            return "18_30"
        case "18m（36射）":
            return "18_36"
        default:
            let result = text.prefix(text.count-1)
            return String(result)
        }
    }
    
    
//    class func dateString2Int(dateString: String) {
//        var yearString: String = ""
//        var mounthString: String = ""
//        var dayString: String = ""
//        if dateString.count == 8 {
//            for i in 0..<dateString.count {
//                if i < 4 {
//                    yearString += dateString[i]
//                } else if i < 6 {
//                    mounthString += dateString[i]
//                } else {
//                    dateString += dateString[i]
//                }
//
//            }
//        }
//
//
//    }
    
    
    
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = CGFloat(v / Int(powf(256, 2)) % 256) / 255
        let g = CGFloat(v / Int(powf(256, 1)) % 256) / 255
        let b = CGFloat(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b, alpha: min(max(alpha, 0), 1))
    }
}

