//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import UIKit

final class CurrentWeatherViewModel {
    let manager = WManager()
    
    let latitude: Double
    let longitude: Double
    
    var metrics = WeatherMetrics(temperature: 0, windSpeed: 0, hourTemperature: 0, humidity: 0)
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func fetchCurrentWeather() {
        let location = Location(latitude: latitude, longitude: longitude)
        
        let request = WRequestBuilder()
            .set(location: location)
            .set(type: .current)
            .make()
        
        manager.execute(request, expecting: CurrentWeatherData.self) { [weak self] result in
            switch result {
            case .success(let model):
                print(String(describing: model))
                self?.metrics.temperature = model.current.temperature2M
                self?.metrics.windSpeed = model.current.windSpeed10M
            case .failure:
                break
            }
        }
    }
}
