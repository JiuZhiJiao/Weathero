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
        
        // Climate Change Quiz
        create(mainTopic: "Climate Change", topic: "Climate Change 0", image: "ClimateChangeP10", content: "Globally, which of the following economic sectors emit the largest percentage of greenhouse gas emissions?", optionA: "Transportation", optionB: "Buildings", optionC: "Industry", optionD: "Electricity and heat preduction", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Climate Change", topic: "Climate Change 0", image: "ClimateChangeP11", content: "What can you do to help fight climate change?", optionA: "Divest from fossil fuels companies", optionB: "Engage yourself in the science behind climate change", optionC: "Vote from political candidates who will advocate for climate-related legislation and policy", optionD: "All of the above", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Climate Change", topic: "Climate Change 0", image: "ClimateChangeP12", content: "What is the Greenhouse effect?", optionA: "The name of climate change legislation that was passed by Congress", optionB: "When you paint you house green to become an environmentalist", optionC: "When the gases in our atmosphere trap heat and block it from escaping out planet", optionD: "When you build a green house", correct: 3, feedback: "No Feedback.")
        create(mainTopic: "Climate Change", topic: "Climate Change 0", image: "ClimateChangeP13", content: "Which of these countries emits the most of carbon dioxide?", optionA: "China", optionB: "USA", optionC: "UK", optionD: "Russia", correct: 1, feedback: "No Feedback.")
        create(mainTopic: "Climate Change", topic: "Climate Change 0", image: "ClimateChangeP14", content: "What percentage of the global greenhouse gas emissions does the transportation sector emit?", optionA: "1%", optionB: "14%", optionC: "33%", optionD: "70%", correct: 2, feedback: "No Feedback.")
        create(mainTopic: "Climate Change", topic: "Climate Change 0", image: "ClimateChangeP15", content: "Which has been the hottest year on record?", optionA: "2016", optionB: "2020", optionC: "All of the above", optionD: "None of the above", correct: 3, feedback: "No Feedback.")
        
        // Climate Change Chapter 01
        create(mainTopic: "Climate Change", topic: "Climate Change 1", image: "ClimateChangeP1", content: "What did climate change bring in the past decades?", optionA: "Sea level rise", optionB: "Earthquakes", optionC: "Raining", optionD: "Nothing happened", correct: 1, feedback: "In 2019, global mean sea level was 3.4 inches (87.6 millimeters) above the 1993 average.")
        create(mainTopic: "Climate Change", topic: "Climate Change 1", image: "ClimateChangeP2", content: "What are the three factors of climate?", optionA: "Atmospheric conditions, certain place, short time", optionB: "Atmospheric conditions, random place, short time", optionC: "Atmospheric conditions, certain place, long time", optionD: "Atmospheric conditions, random place, long time", correct: 3, feedback: "The climate everywhere around earth has changed altering the usual conditions of a place regarding precipitation and temperature.")
        create(mainTopic: "Climate Change", topic: "Climate Change 1", image: "ClimateChangeP3", content: "Which of the following is not a consequence of climate change?", optionA: "Droughts", optionB: "Floods", optionC: "Huge storms", optionD: "Sunny day", correct: 4, feedback: "Drought, floods, and huge storms are the consequence of global warming.")
        
        // Climate Change Chapter 02
        create(mainTopic: "Climate Change", topic: "Climate Change 2", image: "ClimateChangeP4", content: "Which of the following illustrates the role of atmosphere?", optionA: "Help to rain", optionB: "Allow part of the solar radiation to penetrate", optionC: "Don’t allow the solar radiation to penetrate", optionD: "Make fog", correct: 2, feedback: "The earth is surrounded by the atmosphere, a thin layer of gas which allows part of the solar radiation to penetrate.")
        create(mainTopic: "Climate Change", topic: "Climate Change 2", image: "ClimateChangeP5", content: "Which of the following is a kind of greenhouse gases?", optionA: "O2", optionB: "Ar", optionC: "H2", optionD: "CO2", correct: 4, feedback: "Carbon dioxide (0.04%), nitrous oxide, methane, and ozone are trace gases that account for almost 0.1% of Earth's atmosphere and have an appreciable greenhouse effect.")
        create(mainTopic: "Climate Change", topic: "Climate Change 2", image: "ClimateChangeP6", content: "The increase of Greenhouse gases will bring what?", optionA: "Increase of average temperature of the planet", optionB: "Nothing happened", optionC: "Decrease of average temperature of the planet", optionD: "Fluctuation of average temperature of the planet", correct: 1, feedback: "GHG’s capacity to retain solar radiation has been enhanced resulting in an increase of the average temperature of the planet.")
        
        // Climate Change Chapter 03
        create(mainTopic: "Climate Change", topic: "Climate Change 3", image: "ClimateChangeP7", content: "The average global temperature increased ___ degree fahrenheit?", optionA: "1", optionB: "3", optionC: "2", optionD: "5", correct: 3, feedback: "Over the past 150 years, the average global temperature increased almost 2 degrees fahrenheit.")
        create(mainTopic: "Climate Change", topic: "Climate Change 3", image: "ClimateChangeP8", content: "Which of the following is not a solution to reduce CO2 emission?", optionA: "Use renewable energy", optionB: "Use a private car", optionC: "Always recycle", optionD: "Use less plastic", correct: 2, feedback: "Using public transport,bicycle or walking can reduce CO2 emissions to some degree.")
        create(mainTopic: "Climate Change", topic: "Climate Change 3", image: "ClimateChangeP9", content: "Which statement is not true?", optionA: "The sea level has risen 7.5 inches", optionB: "Cars are responsible for 20% of CO2 emissions", optionC: "5 trees can absorb up to one metric ton of CO2 during their life cycle", optionD: "We would need less energy to make paper from old newspapers", correct: 2, feedback: "Cars are responsible for 11% of CO2 emissions in Australia.")
        
        
        // Droughts Quiz
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP7", content: "Which watering method is NOT the best way to conserve water?", optionA: "By hand, manual", optionB: "Overhead sprinklers", optionC: "Drip system", optionD: "Soaker hose", correct: 2, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP8", content: "Which is the better watering regime under general conditions?", optionA: "Daily, 10 minutes", optionB: "Every other day, 20 minutes", optionC: "Weekly, 20 minutes", optionD: "Weekly, one or two hours", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP9", content: "Gray water is recommended for watering gardens. What is it?", optionA: "Dirty rain water", optionB: "Leftover household water such as from dishes", optionC: "Unchlorinated water", optionD: "Rainwater from gutters", correct: 2, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP10", content: "Which of the following is generally LESS resistant to drought?", optionA: "Amsonia", optionB: "Baptisia", optionC: "Gaura", optionD: "Monarda", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP11", content: "One consequence of el nino is___.", optionA: "Strong trade winds", optionB: "Flooding", optionC: "Strong winter storms", optionD: "Drought", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP12", content: "An el nino in Australia causes ___ rainfall.", optionA: "Above average", optionB: "Below average", optionC: "Average", optionD: "None of the above", correct: 2, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP13", content: "In a La Nina event, the SOI is strongly ___ and the air pressure in Darwin is ___ than in Tahiti", optionA: "Positive, lower", optionB: "Positive, higher", optionC: "Negative, lower", optionD: "Negative, higher", correct: 1, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP14", content: "Which of the following would not be a good choice for drought in the shade?", optionA: "Plantain Lily", optionB: "Dead Nettle", optionC: "Periwinkle", optionD: "Peony", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Droughts", topic: "Droughts 0", image: "DroughtsP15", content: "Without question, ENSO events: ___", optionA: "Are preventable", optionB: "Eliminate sources of rain", optionC: "Are really scary", optionD: "Impact everyone on the planet somehow", correct: 4, feedback: "No Feedback.")
        
        
        // Droughts Chapter 01
        create(mainTopic: "Droughts", topic: "Droughts 1", image: "DroughtsP1", content: "According to the video, drought will negatively impact on the following except what?", optionA: "Crops", optionB: "People’s live", optionC: "Animals live", optionD: "Academic performance", correct: 4, feedback: "Droughts affect crops and the lives of people and animals alike.")
        create(mainTopic: "Droughts", topic: "Droughts 1", image: "DroughtsP2", content: "Which of the following is not a kind of drought?", optionA: "Meteorological drought", optionB: "Agricultural drought", optionC: "Social drought", optionD: "Hydrological drought", correct: 3, feedback: "4 different types of drought: Meteorological drought, Agricultural drought, Hydrological drought, and Socioeconomic drought.")
        create(mainTopic: "Droughts", topic: "Droughts 1", image: "DroughtsP3", content: "Drought may lead to___?", optionA: "Improvement of crops", optionB: "Erosion of soil", optionC: "Plenty water supply", optionD: "Increase of economy", correct: 2, feedback: "Droughts can lead to the destruction of crops, erosion of soil, similar shortage of water supply, etc.")
        
        // Droughts Chapter 02
        create(mainTopic: "Droughts", topic: "Droughts 2", image: "DroughtsP4", content: "What is the major rule to survive droughts?", optionA: "Saving water", optionB: "Wasting water", optionC: "Using public transport", optionD: "Eatting organic food", correct: 1, feedback: "According to the video2, the major rule to survive drought is saving water.")
        create(mainTopic: "Droughts", topic: "Droughts 2", image: "DroughtsP5", content: "Which of the following is not a way to save water?", optionA: "Wash fruits and vegetables in a bowl of water", optionB: "Don’t leave the water running while washing your face", optionC: "Fill bathtub full with water", optionD: "Recycle the water", correct: 3, feedback: "Take smaller shots or if you use a bathtub, for example, fill it halfway with water.")
        create(mainTopic: "Droughts", topic: "Droughts 2", image: "DroughtsP6", content: "How much freshwater is on the surface of the earth?", optionA: "0.1%", optionB: "0.3%", optionC: "2%", optionD: "30%", correct: 2, feedback: "Only 0.3% of water on earth is fresh water, available for human consumption.")
        
        
        // Floods Quiz
        create(mainTopic: "Floods", topic: "Floods 0", image: "FloodsP1", content: "In Australia, which of the following is the most expensive natural disaster?", optionA: "Droughts", optionB: "Floods", optionC: "Bushfires", optionD: "Cyclones", correct: 2, feedback: "No Feedback.")
        create(mainTopic: "Floods", topic: "Floods 0", image: "FloodsP2", content: "Which of the following is an environmental consequence of floods?", optionA: "Dispersal of weed species", optionB: "Erosion of soil", optionC: "Release of pollutants into waterways", optionD: "All of the above", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Floods", topic: "Floods 0", image: "FloodsP3", content: "The size of a flood is measured by ___", optionA: "Rate of flow of water in a waterway or river", optionB: "The level of water in a water-body", optionC: "A river gauging station", optionD: "All of the above", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Floods", topic: "Floods 0", image: "FloodsP4", content: "Which of the following potentially affects the size of a flood?", optionA: "Bridges and other structures in waterways", optionB: "The size and windiness of a river", optionC: "Vegetation in and around a river", optionD: "All of the above", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Floods", topic: "Floods 0", image: "FloodsP5", content: "Which of the following is true? Flood warnings:", optionA: "Should not be released until the information is certain", optionB: "Should indicate what the threat is, what action should be taken, by whom and when", optionC: "Are better if received from a single source", optionD: "All of the above", correct: 4, feedback: "No Feedback.")
        create(mainTopic: "Floods", topic: "Floods 0", image: "FloodsP6", content: "Flood risk refers to ___", optionA: "The chance of a flood occurring", optionB: "The number of people and properties exposed to flood waters ", optionC: "The vulnerability of people and properties that are exposed to floodwaters", optionD: "All of the above", correct: 4, feedback: "No Feedback.")
        
        // Floods Chapter 01
        create(mainTopic: "Floods", topic: "Floods 1", image: "FloodsP7", content: "Which one of the following best describes floods?", optionA: "Fast moving winds", optionB: "Overflowing of water", optionC: "Scarcity of water", optionD: "Sudden violent shaking of ground", correct: 2, feedback: "An overflow of a large amount of water beyond its normal limits, especially over what is normally dry land.")
        create(mainTopic: "Floods", topic: "Floods 1", image: "FloodsP8", content: "A flood can vary in: ___", optionA: "Size", optionB: "Speed of water flow", optionC: "Duration", optionD: "All of the above", correct: 4, feedback: "Floods may vary in size, speed and duration depending on the intensity and it’s cause.The volume, rate of rise and areal extent mat also vary.")
        create(mainTopic: "Floods", topic: "Floods 1", image: "FloodsP9", content: "Which of the following can be the driving force for floods?", optionA: "Rise in Temperature", optionB: "Underwater earthquakes", optionC: "Strong winds", optionD: "All the above", correct: 4, feedback: "Rise in temperature where there is ample of snow can lead to floods. Underwater earthquakes result in tsunamis which eventually can cause floods on the dry land. Additionally, strong winds that push water to the shore can cause hurricanes which then cause floods.")
        
        // Floods Chapter 02
        create(mainTopic: "Floods", topic: "Floods 2", image: "FloodsP10", content: "In which type of floods, are authorities able to issue warnings before time?", optionA: "Slow-onset floods", optionB: "Rapid-onset floods", optionC: "Flash floods", optionD: "Authorities can never issue warning before time in floods", correct: 1, feedback: "Slow-onset floods as the name suggests are slow and go on for weeks or months and hence the authority can issue warnings and preventive measures can be taken to minimise the destruction of these kinds of floods.")
        create(mainTopic: "Floods", topic: "Floods 2", image: "FloodsP11", content: "What is a flash flood?", optionA: "A sophisticated flood", optionB: "Power lines fell in flood waters", optionC: "A deep flood", optionD: "It happens fast without warning", correct: 1, feedback: "Flash floods induce severe impacts in both the built and the natural environment. Especially within urban areas, the effects of flash floods can be catastrophic and show extensive diversity, ranging from damages in buildings and infrastructure to impacts on vegetation, human lives and livestock.")
        create(mainTopic: "Floods", topic: "Floods 2", image: "FloodsP12", content: "Rate from highest to closest the type of floods on the basis of their destruction causing capability.\n     1. Slow-onset floods\n     2. Rapid-onset floods\n     3. Flash floods", optionA: "1,2,3", optionB: "2,3,1", optionC: "3,1,2", optionD: "3,2,1", correct: 4, feedback: "Flash floods are the most sudden floods and have a potential to cause a lot of destruction. Rapid-onset floods are not as sudden as flash floods but have a higher risk of death and damage of property.")
        
        // Floods Chapter 03
        create(mainTopic: "Floods", topic: "Floods 3", image: "FloodsP13", content: "Why is flood water not suitable for playing?", optionA: "Risk of life", optionB: "They are deep and flow very fast", optionC: "They sometimes cover the drain", optionD: "All of the above", correct: 4, feedback: "Kids are advised to not play in it as there is a possibility of drowning in this water as they can be deep and the flow can be very fast. Sometimes, flood waters cover the open drains and other harmful things and there is a possibility of harming oneself in such a scenario.")
        create(mainTopic: "Floods", topic: "Floods 3", image: "FloodsP14", content: "Consider a situation where you are asked to evacuate during floods but you suddenly realise that you have left some of your belongings in the building. What will you do?", optionA: "Only go back if they are your identification proofs and other highly important documents", optionB: "Wait for the situation to look better and then go to collect your belongings", optionC: "Quickly run back and get all your belongings", optionD: "Never go back unless asked to do so by the authorities", correct: 4, feedback: "In case of an evacuation, never go return until asked to do so. Remember that your life is more important than your belongings.")
        create(mainTopic: "Floods", topic: "Floods 3", image: "FloodsP15", content: "What are the different  modes of information during times of floods?", optionA: "Internet", optionB: "Radio", optionC: "State/territory emergency service media", optionD: "All of the above", correct: 4, feedback: "When in a situation of floods keep a close check of instruction/information modes so that you are aware of the situation and can follow instructions provided by the authority via television, radio, internet or emergency media.")
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
