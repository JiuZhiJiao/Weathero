//
//  QuizDatabase.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import Foundation
import RealmSwift

final class QuizDatabase: ObservableObject {
    private var quizResults: Results<QuizData>
    
    init(realm: Realm) {
        quizResults = realm.objects(QuizData.self)
        
        if quizResults.count == 0 {
            initQuizes()
        } else {
            addNewQuizes()
        }
    }
    
    var quizes: [QuizModel] {
        quizResults.map(QuizModel.init)
    }
    
}

extension QuizDatabase {
    // add new quiz data to database
    func create(mainTopic: String,topic: String, image: String, content: String, optionA: String, optionB: String, optionC: String, optionD: String, correct: Int, feedback: String) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            
            let quizData = QuizData()
            quizData.id = quizResults.count
            quizData.mainTopic = mainTopic
            quizData.topic = topic
            quizData.image = image
            quizData.content = content
            quizData.optionA = optionA
            quizData.optionB = optionB
            quizData.optionC = optionC
            quizData.optionD = optionD
            quizData.correct = correct
            quizData.selected = 0
            quizData.feedback = feedback
            
            try realm.write {
                realm.add(quizData)
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // initialize the database
    func initQuizes() {
        
        // Climate Change Chapter 01
        create(mainTopic: "Climate Change", topic: "Climate Change 1", image: "ClimateChangeP1", content: "What did climate change bring in the past decades?", optionA: "Sea level rise", optionB: "Earthquakes", optionC: "Raining", optionD: "Nothing happened", correct: 1, feedback: "In 2019, global mean sea level was 3.4 inches (87.6 millimeters) above the 1993 average.")
        create(mainTopic: "Climate Change", topic: "Climate Change 1", image: "ClimateChangeP2", content: "What are the three factors of climate?", optionA: "Atmospheric conditions, certain place, short time", optionB: "Atmospheric conditions, random place, short time", optionC: "Atmospheric conditions, certain place, long time", optionD: "Atmospheric conditions, random place, long time", correct: 3, feedback: "The climate everywhere around earth has changed altering the usual conditions of a place regarding precipitation and temperature.")
        create(mainTopic: "Climate Change", topic: "Climate Change 1", image: "ClimateChangeP3", content: "Which of the following is not a consequence of climate change?", optionA: "Droughts", optionB: "Floods", optionC: "Huge storms", optionD: "Sunny day", correct: 4, feedback: "Drought, floods, and huge storms are the consequence of global warming.")
        
        // Climate Change Chapter 02
        create(mainTopic: "Climate Change", topic: "Climate Change 2", image: "ClimateChangeP1", content: "Which of the following illustrates the role of atmosphere?", optionA: "Help to rain", optionB: "Allow part of the solar radiation to penetrate", optionC: "Don’t allow the solar radiation to penetrate", optionD: "Make fog", correct: 2, feedback: "The earth is surrounded by the atmosphere, a thin layer of gas which allows part of the solar radiation to penetrate.")
        create(mainTopic: "Climate Change", topic: "Climate Change 2", image: "ClimateChangeP2", content: "Which of the following is a kind of greenhouse gases?", optionA: "O2", optionB: "Ar", optionC: "H2", optionD: "CO2", correct: 4, feedback: "Carbon dioxide (0.04%), nitrous oxide, methane, and ozone are trace gases that account for almost 0.1% of Earth's atmosphere and have an appreciable greenhouse effect.")
        create(mainTopic: "Climate Change", topic: "Climate Change 2", image: "ClimateChangeP3", content: "The increase of Greenhouse gases will bring what?", optionA: "Increase of average temperature of the planet", optionB: "Nothing happened", optionC: "Decrease of average temperature of the planet", optionD: "Fluctuation of average temperature of the planet", correct: 1, feedback: "GHG’s capacity to retain solar radiation has been enhanced resulting in an increase of the average temperature of the planet.")
        
        // Climate Change Chapter 03
        create(mainTopic: "Climate Change", topic: "Climate Change 3", image: "ClimateChangeP1", content: "The average global temperature increased ___ degree fahrenheit?", optionA: "1", optionB: "3", optionC: "2", optionD: "5", correct: 3, feedback: "Over the past 150 years, the average global temperature increased almost 2 degrees fahrenheit.")
        create(mainTopic: "Climate Change", topic: "Climate Change 3", image: "ClimateChangeP2", content: "Which of the following is not a solution to reduce CO2 emission?", optionA: "Use renewable energy", optionB: "Use a private car", optionC: "Always recycle", optionD: "Use less plastic", correct: 2, feedback: "Using public transport,bicycle or walking can reduce CO2 emissions to some degree.")
        create(mainTopic: "Climate Change", topic: "Climate Change 3", image: "ClimateChangeP3", content: "Which statement is not true?", optionA: "The sea level has risen 7.5 inches", optionB: "Cars are responsible for 20% of CO2 emissions", optionC: "5 trees can absorb up to one metric ton of CO2 during their life cycle", optionD: "We would need less energy to make paper from old newspapers", correct: 2, feedback: "Cars are responsible for 11% of CO2 emissions in Australia.")
        
        // Droughts Chapter 01
        create(mainTopic: "Droughts", topic: "Droughts 1", image: "DroughtsP1", content: "According to the video, drought will negatively impact on the following except what? ", optionA: "Crops", optionB: "People’s live", optionC: "Animals live", optionD: "Academic performance", correct: 4, feedback: "Droughts affect crops and the lives of people and animals alike.")
        create(mainTopic: "Droughts", topic: "Droughts 1", image: "DroughtsP2", content: "Which of the following is not a kind of drought?", optionA: "Meteorological drought", optionB: "Agricultural drought", optionC: "Social drought", optionD: "Hydrological drought", correct: 3, feedback: "4 different types of drought: Meteorological drought, Agricultural drought, Hydrological drought, and Socioeconomic drought.")
        create(mainTopic: "Droughts", topic: "Droughts 1", image: "DroughtsP1", content: "Drought may lead to___?", optionA: "Improvement of crops", optionB: "Erosion of soil", optionC: "Plenty water supply", optionD: "Increase of economy", correct: 2, feedback: "Droughts can lead to the destruction of crops, erosion of soil, similar shortage of water supply, etc.")
        
        // Floods Chapter 01
        create(mainTopic: "Floods", topic: "Floods 1", image: "FloodsP1", content: "Which will cause the floods?", optionA: "Pellets of ice  fall during thunderstorms", optionB: "Whirling columns of thunderstorms", optionC: "Too much precipitation", optionD: "None of the above", correct: 3, feedback: "This is basic concept of floods.")
        create(mainTopic: "Floods", topic: "Floods 1", image: "FloodsP2", content: "What is a flash flood?", optionA: "A sophisticated flood", optionB: "Power lines fell in flood waters", optionC: "A deep flood", optionD: "It  happens fast without warning", correct: 4, feedback: "Flash flooding occurs when soil absorption, runoff or drainage cannot adequately disperse intense rainfall, and is usually caused by slow-moving thunderstorms.")
        create(mainTopic: "Floods", topic: "Floods 1", image: "FloodsP1", content: "What are the effects of floods?", optionA: "Uprooted trees", optionB: "Wash away bridges and buildings", optionC: "Destroy homes", optionD: "All the above", correct: 4, feedback: "The flood will have many effects on people's life.")
    }
    
    func addNewQuizes() {
        
    }
    
    // update the selected quiz and set the selected answer
    func selectedAnswer(id: Int, selected: Int) {
        objectWillChange.send()
        do {
            let realm = try Realm()
            try realm.write {
                realm.create(QuizData.self, value: ["id": id, "selected": selected], update: .modified)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // return all quizes with string
    func getQuiz(topic: String) -> [QuizModel] {
        var requiredQuiz = [QuizModel]()
        for quiz in quizes {
            if quiz.topic == topic {
                requiredQuiz.append(quiz)
            }
        }
        
        return requiredQuiz
    }
    
    func getQuiz(mainTopic: String) -> [QuizModel] {
        var requiredQuiz = [QuizModel]()
        for quiz in quizes {
            if quiz.mainTopic == mainTopic {
                requiredQuiz.append(quiz)
            }
        }
        
        return requiredQuiz
    }
}
