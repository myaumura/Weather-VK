//
//  DailyWeather.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation

struct DailyWeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone, timezoneAbbreviation: String
    let elevation: Int
    let dailyUnits: DailyUnits
    let daily: DailyWeather
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case dailyUnits = "daily_units"
        case daily
    }
}

// MARK: - DailyWeather

struct DailyWeather: Codable {
    let time: [String]
    let weatherCode: [Int]
    let temperature2MMax: [Double]
    let temperature2MMin: [Double]
    let precipitationSum: [Double]
    let windSpeed10MMax: [Double]
    
    enum CodingKeys: String, CodingKey {
        case time
        case weatherCode = "weather_code"
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case precipitationSum = "precipitation_sum"
        case windSpeed10MMax = "wind_speed_10m_max"
    }
}

// MARK: - DailyUnits

struct DailyUnits: Codable {
    let time: String
    let weatherCode: String
    let temperature2MMax: String
    let temperature2MMin: String
    let precipitationSum, windSpeed10MMax: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case weatherCode = "weather_code"
        case temperature2MMax = "temperature_2m_max"
        case temperature2MMin = "temperature_2m_min"
        case precipitationSum = "precipitation_sum"
        case windSpeed10MMax = "wind_speed_10m_max"
    }
}
