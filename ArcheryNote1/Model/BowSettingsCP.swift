//
//  BowSettingsCP.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/10/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class BowSettingsCP: Object {
    @objc dynamic var year: Int = 0
    @objc dynamic var month: Int = 0
    @objc dynamic var day: Int = 0
    @objc dynamic var weekday: Int = 0

    // riser
    @objc dynamic var riserName: String = ""
    @objc dynamic var riserLength: String = ""
    @objc dynamic var riserAxcel: String = ""
    @objc dynamic var riserPound: String = ""
    
    // sight
    @objc dynamic var sightName: String = ""
    @objc dynamic var sightMagnification: String = ""
    @objc dynamic var sightRadius: String = ""
    @objc dynamic var sightDot: String = ""
    @objc dynamic var sightRing: String = ""
    @objc dynamic var sightFiber: String = ""
    
    // stabilizer
    @objc dynamic var stabilizerName: String = ""
    @objc dynamic var stabilizerLength: String = ""
    @objc dynamic var stabilizerWeight: String = ""
    
    // arrow
    @objc dynamic var arrowName: String = ""
    @objc dynamic var arrowSpine: String = ""
    @objc dynamic var arrowLength: String = ""
    @objc dynamic var arrowPointWeight: String = ""
    @objc dynamic var arrowNock: String = ""
    @objc dynamic var arrowVane: String = ""
    
    // releaser
    @objc dynamic var releaserName: String = ""
    
    // other
    @objc dynamic var others: String = ""
    
}
