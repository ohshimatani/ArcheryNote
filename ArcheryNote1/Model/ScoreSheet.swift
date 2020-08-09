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
    
    /*
    distance:
     - mach:
        - 70mW
        - 50mW
        - SH
        - 1440M
        - 1440W
        - indoor
        - 30mW
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
