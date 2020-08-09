//
//  ScoreSheet.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class ScoreSheet: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var distance: String = ""
    @objc dynamic var isMatch: Bool = false
    @objc dynamic var weather: Int = 0
    @objc dynamic var sight1: String = ""
    @objc dynamic var sight2: String = ""
    @objc dynamic var sight3: String = ""
    @objc dynamic var sight4: String = ""
    
    var points = List<OneRound>()
}
