//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation

struct CurrentWeatherData: Codable {
    let latitude, longitude, generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let currentUnits: CurrentUnits
    let current: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case currentUnits = "current_units"
        case current
    }
}

// MARK: - Current

struct CurrentWeather: Codable {
    let time: String
    let interval: Int
    let temperature2M: Double
    let precipitation: Int
    let weatherCode: Int
    let windSpeed10M: Double

    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature2M = "temperature_2m"
        case precipitation
        case weatherCode = "weather_code"
        case windSpeed10M = "wind_speed_10m"
    }
}

// MARK: - CurrentUnits

struct CurrentUnits: Codable {
    let time: String
    let interval: String
    let temperature2M: String
    let precipitation: String
    let weatherCode, windSpeed10M: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case interval
        case temperature2M = "temperature_2m"
        case precipitation
        case weatherCode = "weather_code"
        case windSpeed10M = "wind_speed_10m"
    }
}
