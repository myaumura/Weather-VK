//
//  CollectionViewBuilder.swift
//  Weather
//
//  Created by Kirill Gusev on 25.03.2024.
//

import Foundation

protocol CollectionViewBuilder: AnyObject {
    
    var width: CGFloat { get set }
    
    func build() -> [SectionViewModel]
}
