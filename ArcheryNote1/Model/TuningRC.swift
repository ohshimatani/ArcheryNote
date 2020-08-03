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
    @objc var date: String = ""
    @objc var title: String = ""
    @objc var braceHeight: Double = 0
    @objc var uppertillerHeight: Double = 0
    @objc var lowertillerHeight: Double = 0
    @objc var nockingPoint: String = ""
    @objc var memo: String = ""
}
