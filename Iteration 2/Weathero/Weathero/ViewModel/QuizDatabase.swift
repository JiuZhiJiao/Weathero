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
    func create(topic: String, image: String, content: String, optionA: String, optionB: String, optionC: String, optionD: String, correct: Int, feedback: String) {
        objectWillChange.send()
        
        do {
            let realm = try Realm()
            
            let quizData = QuizData()
            quizData.id = quizResults.count
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
        create(topic: "Climate Change", image: "ImageName", content: "Which of the following statements is true?", optionA: "Extreme weather can be stopped", optionB: "Scientists cannot predict extreme weather", optionC: "Scientists warn about extreme weather", optionD: "Extreme weather doesn’t  have patterns", correct: 3, feedback: "Usually,Scientists use a professional prediction model and reliable data to predict what will happen in the following years.")
        create(topic: "Climate Change", image: "ImageName", content: "Which of the following is a possible condition during an El Niño event?", optionA: "Drought in Australia", optionB: "More rain in dry season", optionC: "Trade winds weaken", optionD: "All the above", correct: 4, feedback: "During El Niño, chances for drought increase across India, Indonesia and Australia and a large part of the Amazon.")
        create(topic: "Climate Change", image: "ImageName", content: "Which of the following is a greenhouse gas?", optionA: "CO2", optionB: "CH4", optionC: "Water Vapor", optionD: "All of the above", correct: 4, feedback: "These gases include carbon dioxide (CO2), methane (CH4), water vapor, nitrous oxide (N2O) and ozone (O3).")
        create(topic: "Droughts", image: "ImageName", content: "What is a drought?", optionA: "Shortage/deficiency of water", optionB: "Too much precipitation", optionC: "Too many people use water", optionD: "Strong winds", correct: 1, feedback: "A drought is a period of time when an area or region experiences below-normal precipitation.")
        create(topic: "Droughts", image: "ImageName", content: "What are the effects of droughts?", optionA: "Crop failure", optionB: "Famine", optionC: "Economic loss", optionD: "All the above", correct: 4, feedback: "The lack of adequate precipitation, either rain or snow, can cause reduced soil moisture or groundwater, diminished stream flow, crop damage, and a general water shortage.")
        create(topic: "Droughts", image: "ImageName", content: "Which type of rain helps alleviate drought the most?", optionA: "Shower", optionB: "Thunderstorm", optionC: "Soaking", optionD: "purple", correct: 3, feedback: "One soaking rain may help improve drought conditions. However, multiple soaking rains over several months are needed to truly return things to normal.")
        create(topic: "Floods", image: "ImageName", content: "Which will cause the floods?", optionA: "Pellets of ice  fall during thunderstorms", optionB: "Whirling columns of thunderstorms", optionC: "Too much precipitation", optionD: "None of the above", correct: 3, feedback: "This is basic concept of floods.")
        create(topic: "Floods", image: "ImageName", content: "What is a flash flood?", optionA: "A sophisticated flood", optionB: "Power lines fell in flood waters", optionC: "A deep flood", optionD: "It  happens fast without warning", correct: 4, feedback: "Flash flooding occurs when soil absorption, runoff or drainage cannot adequately disperse intense rainfall, and is usually caused by slow-moving thunderstorms.")
        create(topic: "Floods", image: "ImageName", content: "What are the effects of floods?", optionA: "Uprooted trees", optionB: "Wash away bridges and buildings", optionC: "Destroy homes", optionD: "All the above", correct: 4, feedback: "The flood will have many effects on people's life.")
    }
    
    func addNewQuizes() {
        
    }
    
    // update the selected quiz and set the selected answer
    func update(id: Int, selected: Int) {
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
}
