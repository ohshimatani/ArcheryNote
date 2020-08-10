//
//  PointsOneEnd.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class PointsOneEnd: Object {
//    @objc dynamic var round: Int = 0
//    @objc dynamic var end: Int = 0
    var points = List<Point>()
}
