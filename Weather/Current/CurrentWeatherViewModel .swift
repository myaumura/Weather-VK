//
//  CurrentWeatherViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import UIKit

final class CurrentWeatherViewModel {

    let manager = WManager()
    
    let location: Location
    
    var metrics: CurrentWeatherMetrics?
    
    init(location: Location) {
        self.location = location
    }
    
    public func fetchCurrentWeather() {
        let request = WRequestBuilder()
            .set(location: location)
            .set(type: .current)
            .make()
        
        manager.execute(request, expecting: CurrentWeatherData.self) { [weak self] result in
            switch result {
            case .success(let model):
                print(String(describing: model))
                self?.metrics?.temperature = model.current.temperature2M
                self?.metrics?.windSpeed = model.current.windSpeed10M
            case .failure:
                break
            }
        }
    }
}
