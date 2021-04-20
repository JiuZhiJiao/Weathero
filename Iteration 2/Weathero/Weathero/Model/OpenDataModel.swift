//
//  OpenDataModel.swift
//  Weathero
//
//  Created by 苏桐 on 20/4/21.
//

import Foundation

struct openData: Decodable{
    var emissions: [emissions]
    var avgRainfallTemperture: [avgRainfallTemperture]
    var seaLandTemp: [seaLandTemp]
}



struct emissions: Decodable{
    var year: Int
    var population: Int
    var cgce: Int
    var doge: Int
    var vehicularEmissions: Int
    var railwayEmissions: Int
    var boatingEmissions: Int
    var aviationEmissions: Int
    var solidWasteEmissions: Int
    var wasteWaterEmissions: Int
    var totalEmissions: Int
}

struct avgRainfallTemperture: Decodable {
    var year: Int
    var rainfall: Float
    var temperture: Float
}

struct seaLandTemp: Decodable {
    var year: Int
    var seaTemp: Float
    var landTemp: Float
}
