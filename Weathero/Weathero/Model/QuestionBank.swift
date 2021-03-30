//
//  QuestionBank.swift
//  Weathero
//
//  Created by JiuZhiJiao on 27/3/21.
//

import Foundation

class QuestionBank {
    var list = [QuestionSet]()
    
    init(){
        var setList = [QuestionSet]()
       
        var qList = [Question]()
        qList.append(Question(questionNum: 1,question: "Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        qList.append(Question(questionNum: 2,question: "Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        qList.append(Question(questionNum: 3,question: "Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        qList.append(Question(questionNum: 4,question: "Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        qList.append(Question(questionNum: 5,question: "Which of these countries has the highest per capita carbon dioxide emissions?", choiceA: "United States", choiceB: "Australia", choiceC: "Saudi Arabia", choiceD: "China", answer: 4))
        qList.append(Question(questionNum: 6,question: "Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        setList.append(QuestionSet(setName: "Climate Change", list: qList))
        qList.removeAll()
        
        qList.append(Question(questionNum: 1,question: "2Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        qList.append(Question(questionNum: 2,question: "2Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        qList.append(Question(questionNum: 3,question: "2Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        qList.append(Question(questionNum: 4,question: "2Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        qList.append(Question(questionNum: 5,question: "2Which of these countries has the highest per capita carbon dioxide emissions?", choiceA: "United States", choiceB: "Australia", choiceC: "Saudi Arabia", choiceD: "China", answer: 4))
        qList.append(Question(questionNum: 6,question: "2Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        setList.append(QuestionSet(setName: "Droughts", list: qList))
        qList.removeAll()
        
        qList.append(Question(questionNum: 1,question: "3Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        qList.append(Question(questionNum: 2,question: "3Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        qList.append(Question(questionNum: 3,question: "3Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        qList.append(Question(questionNum: 4,question: "3Which of these greenhouse gases is most abundant in the atmosphere?", choiceA: "Carbon dioxide", choiceB: "Methane", choiceC: "Nitrous oxide", choiceD: "Water vapour", answer: 1))
        qList.append(Question(questionNum: 5,question: "3Which of these countries has the highest per capita carbon dioxide emissions?", choiceA: "United States", choiceB: "Australia", choiceC: "Saudi Arabia", choiceD: "China", answer: 4))
        qList.append(Question(questionNum: 6,question: "3Which of the following activities contributes the most to carbon emissions globally?", choiceA: "Agriculture", choiceB: "Transport", choiceC: "Forestry", choiceD: "Energy Supply", answer: 3))
        setList.append(QuestionSet(setName: "Floods", list: qList))
        qList.removeAll()
        
        self.list = setList
    }

}
