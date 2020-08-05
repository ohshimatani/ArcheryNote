//
//  TuningRC.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class TuningRC: Object{
    @objc dynamic var date: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var braceHeight: Double = 0
    @objc dynamic var uppertillerHeight: Double = 0
    @objc dynamic var lowertillerHeight: Double = 0
    @objc dynamic var nockingPoint: String = ""
    @objc dynamic var memo: String = ""
}
