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

    var metrics = WeatherMetrics(temperature: 0, windSpeed: 0, hourTemperature: 0, humidity: 0)
    
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

extension DailyWeatherViewModel: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellIdentifier, for: indexPath)
                as? WeatherTableViewCell else { return UITableViewCell() }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
