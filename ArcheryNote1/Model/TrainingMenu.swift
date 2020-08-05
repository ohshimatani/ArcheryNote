//
//  TrainingMenu.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class TrainingMenu: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var detail: String = ""
    @objc dynamic var memo: String = ""
}
