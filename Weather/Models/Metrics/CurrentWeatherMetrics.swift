//
//  CurrentWeatherMetrics.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation

struct CurrentWeatherMetrics: Codable {
    var temperature: Double
    var windSpeed: Double
    var precipitation: Int
    var weatherCode: Int
    var temperatureMeasure: String
    var windSpeedMeasure: String
    var precipitationMeasure: String
}
