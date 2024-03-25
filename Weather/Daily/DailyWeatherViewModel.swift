//
//  DailyWeatherViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import UIKit

final class DailyWeatherViewModel: NSObject {
    let manager = WManager()
    
    let latitude: Double
    let longitude: Double

    var metrics = DailyMetrics()
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func fetchDailyWeather() {
        let location = Location(latitude: latitude, longitude: longitude)
        
        let request = WRequestBuilder()
            .set(location: location)
            .set(type: .daily)
            .make()
        
        manager.execute(request, expecting: DailyWeatherData.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure:
                break
            }
        }
    }
}
