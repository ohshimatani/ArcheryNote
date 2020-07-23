//
//  CheckPoint.swift
//  ArcheryNote1
//
//  Created by 大島谷遼 on 2020/07/10.
//  Copyright © 2020 Ohshimatani Ryo. All rights reserved.
//

import Foundation
import RealmSwift

class CheckPoint: Object{
        
    @objc var checkPoint: String = ""
    @objc var howImportant: Int = 0
    @objc var memo: String = ""
    
//    init(_checkPoint: String, _howImportant: Int, _Memo: String) {
//        checkPoint = _checkPoint
//        howImportant = _howImportant
//        Memo = _Memo
//    }
    
//    required init?(coder: NSCoder) {
//        checkPoint = (coder.decodeObject(forKey: "checkPoint") as? String) ?? ""
//        howImportant = coder.decodeInteger(forKey: "howImportant")
//        Memo = (coder.decodeObject(forKey: "Memo") as? String) ?? ""
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(checkPoint, forKey: "checkPoint")
//        coder.encode(howImportant, forKey: "howImportant")
//        coder.encode(Memo, forKey: "Memo")
//    }
    
    

    
}
