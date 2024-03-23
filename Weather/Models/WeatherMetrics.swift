//
//  WeatherMetrics.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation

struct WeatherMetrics: Codable {
    var temperature: Double
    var windSpeed: Double
    var hourTemperature: Double
    var humidity: Int
}
