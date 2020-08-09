//
//  PointsOneEndList.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/09.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation

import Foundation
import RealmSwift

class PointsOneEndList: Object {
    @objc dynamic var end: Int = 1
    var points = List<PointOneEnd>()
}
