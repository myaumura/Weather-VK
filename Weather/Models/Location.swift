//
//  Location.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import Foundation

struct Location {
    let latitude: Double
    let longitude: Double
}

extension Location: CustomStringConvertible {
    var description: String {
        return "latitude=\(latitude)&longitude=\(longitude)"
    }
}
