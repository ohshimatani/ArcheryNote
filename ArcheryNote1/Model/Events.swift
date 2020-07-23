//
//  Events.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/06/29.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class Events: Object {
    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""
}
