//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Kirill Gusev on 20.03.2024.
//

import UIKit

class CurrentWeatherView: UIView {
    
    private let viewModel = CurrentWeatherViewModel(latitude: 52.0, longitude: 52.0)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.text = "Location"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .red
        addSubview(titleLabel)
        setupConstraints()
        setupLayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLayer() {
        layer.cornerRadius = 15
        layer.borderWidth = 1
    }
}
