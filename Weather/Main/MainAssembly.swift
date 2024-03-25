//
//  MainAssembly.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import Foundation
import UIKit

final class MainAssembly: Assembly {
    
    func build() -> UIViewController {
        let viewModel = MainViewModel()
        return MainViewController(viewModel: viewModel)
    }
}
