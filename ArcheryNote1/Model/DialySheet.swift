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
//    @objc dynamic
    
}
