//
//  Quiz.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

struct QuizModel: Identifiable {
    var id: Int = 0
    var topic: String = ""
    var image: String = ""
    var content: String = ""
    var optionA: String = ""
    var optionB: String = ""
    var optionC: String = ""
    var optionD: String = ""
    var correct: Int = 0
    var selected: Int = 0
    var feedback: String = ""
}

extension QuizModel {
    init(quizData: QuizData) {
        id = quizData.id
        topic = quizData.topic
        image = quizData.image
        content = quizData.content
        optionA = quizData.optionA
        optionB = quizData.optionB
        optionC = quizData.optionC
        optionD = quizData.optionD
        correct = quizData.correct
        selected = quizData.selected
        feedback = quizData.feedback
    }
}
