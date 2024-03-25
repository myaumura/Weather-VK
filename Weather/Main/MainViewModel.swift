//
//  MainViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import Foundation

final class MainViewModel {
    
    private(set) var sections = [SectionViewModel]()
    
    let builder: CollectionViewBuilder = MainCollectionViewBuilder()
    
    var reload: (() -> Void)?
    
    func build(width: CGFloat) {
        builder.width = width
        sections = builder.build()
        reload?()
    }
}
