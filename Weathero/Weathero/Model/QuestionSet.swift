//
//  QuestionSet.swift
//  Weathero
//
//  Created by 苏桐 on 30/3/21.
//

import Foundation

class QuestionSet {
    var setName: String
    var list = [Question]()
    
    init(setName: String, list: [Question]){
        self.setName = setName
        self.list = list
    }
}
