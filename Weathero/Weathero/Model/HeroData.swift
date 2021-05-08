//
//  HeroData.swift
//  Weathero
//
//  Created by JiuZhiJiao on 8/5/21.
//

import Foundation
import RealmSwift

class HeroData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var collect: Bool = false
    
    override class func primaryKey() -> String? {
        "id"
    }

}
