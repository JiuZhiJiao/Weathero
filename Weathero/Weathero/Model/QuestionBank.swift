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
        qList.append(Question(questionNum: 1,question: "How can extreme events like hurricanes, drought, & wildfires impact energy infrastructure?", choiceA: "Water shortages", choiceB: "Power outages", choiceC: "Higher electricity price", choiceD: "All above correct", answer: 4, feedback: "Extreme weather can cause many social problems, such as water shortages, power outages, higher electricity and gas price."))
        qList.append(Question(questionNum: 2,question: "Which of the following is a possible condition during an El Niño event?", choiceA: "Drought in Australia", choiceB: "More rain in dry season", choiceC: "Trade winds weaken", choiceD: "All the above", answer: 4, feedback: "During El Niño, chances for drought increase across India, Indonesia and Australia and a large part of the Amazon."))
        qList.append(Question(questionNum: 3,question: "Which of the following is a greenhouse gas?", choiceA: "CO2", choiceB: "CH4", choiceC: "Water Vapor", choiceD: "All of the above", answer: 4, feedback: "These gases include carbon dioxide (CO2), methane (CH4), water vapor, nitrous oxide (N2O) and ozone (O3)."))
        setList.append(QuestionSet(setName: "Climate Change", list: qList))
        qList.removeAll()
        
        qList.append(Question(questionNum: 1,question: "What is a drought?", choiceA: "Shortage/Deficiency of water", choiceB: "Too much precipitation", choiceC: "Too many people use water", choiceD: "Strong winds", answer: 1, feedback: "A drought is a period of time when an area or region experiences below-normal precipitation."))
        qList.append(Question(questionNum: 2,question: "What are the effects of droughts?", choiceA: "Crop failure", choiceB: "Famine", choiceC: "Economic loss", choiceD: "All the above", answer: 4, feedback: "The lack of adequate precipitation, either rain or snow, can cause reduced soil moisture or groundwater, diminished stream flow, crop damage, and a general water shortage."))
        qList.append(Question(questionNum: 3,question: "Which type of rain helps alleviate drought the most?", choiceA: "Shower", choiceB: "Thunderstorm", choiceC: "Soaking", choiceD: "Purple", answer: 3, feedback: "One soaking rain may help improve drought conditions. However, multiple soaking rains over several months are needed to truly return things to normal."))
        setList.append(QuestionSet(setName: "Droughts", list: qList))
        qList.removeAll()
        
        qList.append(Question(questionNum: 1,question: "What are the floods?", choiceA: "Ice fall during thunderstorms", choiceB: "Whirling columns of thunderstorms", choiceC: "Too much precipitation", choiceD: "None of the above", answer: 3, feedback: "This is basic concept of floods."))
        qList.append(Question(questionNum: 2,question: "What is a flash flood?", choiceA: "A sophisticated flood", choiceB: "Power lines fell in flood waters", choiceC: "A deep flood", choiceD: "Happens fast without warning", answer: 4, feedback: "Flash flooding occurs when soil absorption, runoff or drainage cannot adequately disperse intense rainfall, and is usually caused by slow-moving thunderstorms."))
        qList.append(Question(questionNum: 3,question: "What are the effects of floods?", choiceA: "Uprooted trees", choiceB: "Wash away bridges and buildings", choiceC: "Destroy homes", choiceD: "All the above", answer: 4, feedback: "The flood will have many effects on people's life"))
        setList.append(QuestionSet(setName: "Floods", list: qList))
        qList.removeAll()
        
        self.list = setList
    }

}
