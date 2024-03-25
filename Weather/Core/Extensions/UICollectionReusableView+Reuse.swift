//
//  UICollectionReusableView+Reuse.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import UIKit

extension UICollectionReusableView {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
