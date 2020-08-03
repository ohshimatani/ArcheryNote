//
//  Schedule.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/04.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class Schedule: Object {
    @objc var date: String = ""
    @objc var title: String = ""
    @objc var category: Int = 0
    @objc var memo: String = ""
}
