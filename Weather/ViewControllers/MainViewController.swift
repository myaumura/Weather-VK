//
//  ViewController.swift
//  Weather
//
//  Created by Kirill Gusev on 19.03.2024.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    private let locationManager = CLLocationManager()
    
    private let currentWeatherView = CurrentWeatherView()
    private let hourlyWeatherView = HourlyWeatherView()
    private let dailyWeatherView = DailyWeatherView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
        setupLocationManager()
    }
    
    private func addSubviews() {
        view.addSubview(currentWeatherView)
        view.addSubview(hourlyWeatherView)
        view.addSubview(dailyWeatherView)
    }
    
    private func setupLocationManager() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            currentWeatherView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            currentWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            currentWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            currentWeatherView.heightAnchor.constraint(equalToConstant: 300),
            
            hourlyWeatherView.topAnchor.constraint(equalTo: currentWeatherView.bottomAnchor, constant: 20),
            hourlyWeatherView.leadingAnchor.constraint(equalTo: currentWeatherView.leadingAnchor),
            hourlyWeatherView.trailingAnchor.constraint(equalTo: currentWeatherView.trailingAnchor),
            hourlyWeatherView.heightAnchor.constraint(equalToConstant: 60),
            
            dailyWeatherView.topAnchor.constraint(equalTo: hourlyWeatherView.bottomAnchor, constant: 20),
            dailyWeatherView.leadingAnchor.constraint(equalTo: currentWeatherView.leadingAnchor),
            dailyWeatherView.trailingAnchor.constraint(equalTo: currentWeatherView.trailingAnchor),
            dailyWeatherView.heightAnchor.constraint(equalToConstant: 305),
        ])
    }
}

extension MainViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
    }
}
