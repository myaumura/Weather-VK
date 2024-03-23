//
//  WRequestBuilder.swift
//  Weather
//
//  Created by Kirill Gusev on 19.03.2024.
//

import Foundation

final class WRequestBuilder {
    
    enum Constants {
        static let baseURL = "https://api.open-meteo.com"
        static let version = "v1"
    }
    
    enum Endpoint: String {
        case forecast = "forecast"
        case week = "forecast_days=7"
    }
    
    var location: Location?
    var endpoint: Endpoint?
    
    enum RequestType {
        case current
        case hourly
        case daily
    }
    
    var type: RequestType = .current
    
    @discardableResult
    func set(endpoint: Endpoint) -> Self {
        self.endpoint = endpoint
        return self
    }
    
    @discardableResult
    func set(location: Location) -> Self {
        self.location = location
        return self
    }
    
    @discardableResult
    func set(type: RequestType) -> Self {
        self.type = type
        return self
    }
    
    func make() -> WRequest {
        
        let url = [Constants.baseURL, Constants.version, Endpoint.forecast.rawValue].joined(separator: "/")
        
        var components = [CustomStringConvertible]()
        
        if let location {
            components.append(location)
        }
        
        components.append(type.type)
        components.append(type.endpoint)
        
        let joined = components.map({
            $0.description
        }).joined(separator: "&")
        
        let result = [url, joined].joined(separator: "?")
        print("\(result)")
        
        return WRequest(url: result)
    }
}

final class WRequest {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}

extension WRequestBuilder.RequestType {
    var type: String {
        switch self {
        case .current:
            return "current=temperature_2m,precipitation,weather_code,wind_speed_10m"
        case .hourly:
            return "hourly=temperature_2m,precipitation,weather_code,wind_speed_10m"
        case .daily:
            return "daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_sum,wind_speed_10m_max"
        }
    }
    
    var endpoint: String {
        switch self {
        case .current, .hourly:
            return "forecast_days=1"
        case .daily:
            return ""
        }
    }
}
