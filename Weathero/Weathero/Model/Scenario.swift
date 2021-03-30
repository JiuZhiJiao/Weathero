//
//  Scenario.swift
//  Weathero
//
//  Created by 苏桐 on 30/3/21.
//

import Foundation
import UIKit

struct Scenario {
    var name: String
    var desc: String
    var coverImage: UIImage?
    var learningImage: UIImage?
}

let scenarios = [
    Scenario(name: "Climate Change", desc: "El Niño happens every few years in the tropical Pacific Ocean. It is the most dramatic year-to-year variation of the Earth’s climate system, affecting agriculture, public health, freshwater availability, power generation, and economic activity  around the globe. During El Niño, chances for drought increase across India, Indonesia and Australia and a large part of the Amazon.", coverImage: #imageLiteral(resourceName: "ClimateChange"), learningImage: #imageLiteral(resourceName: "ClimateChangeLearning")),
    Scenario(name: "Droughts", desc: "At the end of April 2007, most of Australia remained in the grip of severe drought. April was one of the driest on record for parts of Australia, reported the Australian Broadcasting Corporation, and water levels in the Murray-Darling basin were extremely low.", coverImage: #imageLiteral(resourceName: "Droughts"), learningImage: #imageLiteral(resourceName: "DroughtsLearning")),
    Scenario(name: "Floods", desc: "The floods in this rural part of Australia meant huge losses for farmers. After working to keep herbs alive during years of drought, farmers have now lost significant numbers of cattle to the flood. The exact numbers are still uncertain, but there are reports of farmers losing entire herds. Estimates of total cattle killed are on the order of hundreds of thousands.", coverImage: #imageLiteral(resourceName: "Floods"), learningImage: #imageLiteral(resourceName: "FloodsLearning"))
]
