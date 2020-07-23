//
//  DialySheet.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/30.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class DialySheet: Object{
    @objc dynamic var date: String = ""
    @objc dynamic var place: String = ""
    @objc dynamic var shotNum: Int = 0
    @objc dynamic var reflection: String = ""
    //@objc dynamic var fromList: Any?
    
//    override static func primaryKey() -> String? {
//        return String(self.date)
//    }
    
//    init(_date: String, _place: String, _shotNum: Int, _reflection: String, _fromList: Any?) {
//        date = _date
//        place = _place
//        shotNum = _shotNum
//        reflection = _reflection
//        fromList = _fromList
//    }
//
//    override required init() {
//        fatalError("init() has not been implemented")
//    }
    
}
