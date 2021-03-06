//
//  Point.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class Point: Object {
    @objc dynamic var pointString: String = ""
    @objc dynamic var pointInt: Int = 0
    @objc dynamic var dotLocationX: Double = 0
    @objc dynamic var dotLocationY: Double = 0
}

