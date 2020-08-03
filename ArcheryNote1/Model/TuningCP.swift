//
//  TuningCP.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/03.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class TuningCP: Object{
    @objc var date: String = ""
    @objc var title: String = ""
    @objc var nockingPoint: String = ""
    @objc var peep: String = ""
    @objc var memo: String = ""
}
