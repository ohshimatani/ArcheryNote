//
//  BowSettingsRC.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class BowSettingsRC: Object {
    // date
    @objc dynamic var year: Int = 0
    @objc dynamic var month: Int = 0
    @objc dynamic var day: Int = 0
    @objc dynamic var weekday: Int = 0

    // riser
    @objc dynamic var riserName: String = ""
    @objc dynamic var riserSize: String = ""
    
    //limb
    @objc dynamic var limbName: String = ""
    @objc dynamic var limbPound: String = ""
    @objc dynamic var limbSize: String = ""
    
    //arrow
    @objc dynamic var arrowName: String = ""
    @objc dynamic var arrowSpine: String = ""
    @objc dynamic var arrowLength: String = ""
    @objc dynamic var arrowPointWeight: String = ""
    @objc dynamic var arrowNock: String = ""
    @objc dynamic var arrowVane: String = ""
    
    // string
    @objc dynamic var stringOrigin: String = ""
    @objc dynamic var stringSub: String = ""
    @objc dynamic var stringLength: String = ""
    @objc dynamic var stringNum: String = ""
    
    // stabilizer
    @objc dynamic var centerName: String = ""
    @objc dynamic var centerSize: String = ""
    @objc dynamic var sideName: String = ""
    @objc dynamic var sideSize: String = ""
    
    // sight
    @objc dynamic var sightName: String = ""
    
    // plunger
    @objc dynamic var plungerName: String = ""
    
    // tab
    @objc dynamic var tabName: String = ""
    
    // others
    @objc dynamic var others: String = ""
    
    
    
    

}
