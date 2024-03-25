//
//  SectionViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import Foundation

final class SectionViewModel {
    
    var height: CGFloat {
        var height = CGFloat.zero
        items.forEach {
            height += $0.size.height
        }
        return height
    }
    
    var count: Int {
        return items.count
    }
    
    private(set) var items = [CellViewModel]()
    
    func addCell(_ cell: CellViewModel) {
        items.append(cell)
    }
}
