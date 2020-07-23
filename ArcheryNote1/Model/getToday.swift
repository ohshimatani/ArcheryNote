//
//  getToday.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/11.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation

class func getToday(format:String = "yyyy/MM/dd HH:mm:ss") -> String {
    let now = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = format
    return formatter.string(from: now as Date)
}

