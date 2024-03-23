//
//  HourlyWeather.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation

struct HourlyWeatherData: Codable {
    let latitude: Double
    let longitude: Double
    let generationtimeMS: Double
    let utcOffsetSeconds: Int
    let timezone:String
    let timezoneAbbreviation: String
    let elevation: Int
    let hourlyUnits: HourlyUnits
    let hourly: HourlyWeather
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case generationtimeMS = "generationtime_ms"
        case utcOffsetSeconds = "utc_offset_seconds"
        case timezone
        case timezoneAbbreviation = "timezone_abbreviation"
        case elevation
        case hourlyUnits = "hourly_units"
        case hourly
    }
}

// MARK: - Hourly

struct HourlyWeather: Codable {
    let time: [String]
    let temperature2M: [Double]
    let precipitation, weatherCode: [Int]
    let windSpeed10M: [Double]
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case precipitation
        case weatherCode = "weather_code"
        case windSpeed10M = "wind_speed_10m"
    }
}

// MARK: - Units

struct HourlyUnits: Codable {
    let time, temperature2M, precipitation, weatherCode: String
    let windSpeed10M: String
    
    enum CodingKeys: String, CodingKey {
        case time
        case temperature2M = "temperature_2m"
        case precipitation
        case weatherCode = "weather_code"
        case windSpeed10M = "wind_speed_10m"
    }
}
