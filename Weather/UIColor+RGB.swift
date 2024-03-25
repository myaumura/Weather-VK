//
//  UIColor+RGB.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import UIKit

extension UIColor {
    
    static func rgb(r:CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r / 255,
                       green: g / 255,
                       blue: b / 255,
                       alpha: a)
    }
}
