//
//  TrainingMenu.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class TraingingMenu: Object{
    @objc var title: String = ""
    @objc var detail: String = ""
    @objc var memo: String = ""
}
