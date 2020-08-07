//
//  DialyAddList.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/07.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class DialyAddList: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var checkPoint: CheckPoint!
    @objc dynamic var trainingMenu: TrainingMenu!
    @objc dynamic var tuningRC: TuningRC!
    @objc dynamic var tuningCP: TuningCP!
}
