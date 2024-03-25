//
//  CellViewModel.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import Foundation

class CellViewModel {
    let viewModel: CellBaseViewModel
    let cellId: String
    let size: CGSize
    
    init(viewModel: CellBaseViewModel, cellId: String, size: CGSize) {
        self.viewModel = viewModel
        self.cellId = cellId
        self.size = size
    }
}
