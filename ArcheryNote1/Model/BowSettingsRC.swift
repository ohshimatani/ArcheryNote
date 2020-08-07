//
//  BowSettingsRC.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/08/08.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class BowSettingsRC: Object {
    
    @objc dynamic var date: String = ""
    @objc dynamic var riser: [String: String] = ["name": "", "size": ""]
    @objc dynamic var limb: [String: String] = ["name": "", "size": ""]
    @objc dynamic var arrow: [String: String] = ["name": "",
                                                "spine": "",
                                                "length": "",
                                                "nock": "",
                                                "vane": "",
                                                "pointWeight": ""]
    @objc dynamic var string: [String: String] = ["name": "", "serving": "", "length": "", "stNum": ""]
    @objc dynamic var stabilizer: [String: String] = ["centerName": "",
                                                      "centerSize": "",
                                                      "sideName": "",
                                                      "sideSize": ""]
    @objc dynamic var sight: [String: String] = ["name": ""]
    @objc dynamic var plunger: [String: String] = ["name": ""]
    @objc dynamic var tab: [String: String] = ["name": ""]
    @objc dynamic var others: String = ""
}
