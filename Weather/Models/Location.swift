//
//  Location.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation
import CoreLocation

struct Location {
    let latitude: Double
    let longitude: Double
}

extension Location: CustomStringConvertible {

    var description: String {
        return "latitude=\(latitude)&longitude=\(longitude)"
    }
}

extension Location {
    
    init(location: CLLocationCoordinate2D) {
        self.init(latitude: location.latitude, longitude: location.longitude)
    }
}

