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
    @objc dynamic var title: String = ""
    @objc dynamic var distanceKey: String = ""
    @objc dynamic var distance1R: String = ""
    @objc dynamic var distance2R: String = ""
    @objc dynamic var distance3R: String = ""
    @objc dynamic var distance4R: String = ""
    @objc dynamic var isMatch: Bool = false
    @objc dynamic var weather: Int = 0
    @objc dynamic var sight1: String = ""
    @objc dynamic var sight2: String = ""
    @objc dynamic var sight3: String = ""
    @objc dynamic var sight4: String = ""
    @objc dynamic var memo: String = ""
    
    var points = List<OneRound>()
    
    /*
    distance:
     - mach:
        - 70W
        - 50W
        - SH
        - 1440M
        - 60W
        - 1440W
        - 18W(indoor)
        - 30W
     - 36:
        - 90
        - 70
        - 60
        - 50
        - 30
        - 18_30
        - 18_36
        - 40
        - 12
     - others:
        - free_36
        - free_72
        - free_144
     */
}
