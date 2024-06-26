//
//  HourlyWeatherViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import UIKit

final class HourlyWeatherViewModel: NSObject {
    let manager = WManager()
    
    let latitude: Double
    let longitude: Double

    var metrics: [HourlyMetrics] = []
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    public func fetchHourlyWeather() {
        let location = Location(latitude: latitude, longitude: longitude)
        
        let request = WRequestBuilder()
            .set(location: location)
            .set(type: .hourly)
            .make()
        
        manager.execute(request, expecting: HourlyWeatherData.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure:
                break
            }
        }
    }
}

extension HourlyWeatherViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: WeatherCollectionViewCell.self, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout MainCollectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
       return CGSize(width: 55, height: 55)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
