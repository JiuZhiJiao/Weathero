//
//  QuizData.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import Foundation
import RealmSwift

class QuizData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var topic: String = ""
    @objc dynamic var image: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var optionA: String = ""
    @objc dynamic var optionB: String = ""
    @objc dynamic var optionC: String = ""
    @objc dynamic var optionD: String = ""
    @objc dynamic var correct: Int = 0
    @objc dynamic var selected: Int = 0
    @objc dynamic var feedback: String = ""
    
    override class func primaryKey() -> String? {
        "id"
    }

}
