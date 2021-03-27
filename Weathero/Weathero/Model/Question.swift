//
//  Question.swift
//  Weathero
//
//  Created by JiuZhiJiao on 27/3/21.
//

import Foundation

class Question {
    var questionText: String
    var optionA: String
    var optionB: String
    var optionC: String
    var optionD: String
    var correctAnswer: Int
    
    init(question: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int) {
        self.questionText = question
        self.optionA = choiceA
        self.optionB = choiceB
        self.optionC = choiceC
        self.optionD = choiceD
        self.correctAnswer = answer
    }
}
