//
//  QuestionBank.swift
//  Weathero
//
//  Created by JiuZhiJiao on 27/3/21.
//

import Foundation

class QuestionBank {
    var list = [Question]()
    
    init(){
        list.append(Question(question: "Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        list.append(Question(question: "Which of these countries has the highest per capita carbon dioxide emissions?", choiceA: "United States", choiceB: "Australia", choiceC: "Saudi Arabia", choiceD: "China", answer: 4))
        list.append(Question(question: "Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        list.append(Question(question: "Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        list.append(Question(question: "Which of these countries has the highest per capita carbon dioxide emissions?", choiceA: "United States", choiceB: "Australia", choiceC: "Saudi Arabia", choiceD: "China", answer: 4))
        list.append(Question(question: "Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
    }
}
