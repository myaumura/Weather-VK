//
//  Bindable.swift
//  Weather
//
//  Created by Kirill Gusev on 25.03.2024.
//

import Foundation
import UIKit

typealias BindableCell = UICollectionViewCell & Bindable

protocol Bindable {
    func bind(viewModel: CellViewModel)
}
