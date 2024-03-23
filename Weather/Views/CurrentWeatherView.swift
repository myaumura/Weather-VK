//
//  CurrentWeatherView.swift
//  Weather
//
//  Created by Kirill Gusev on 20.03.2024.
//

import UIKit

class CurrentWeatherView: UIView {
    
    public let viewModel = CurrentWeatherViewModel(latitude: 52.0, longitude: 52.0)
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
        setupLayer()
        viewModel.fetchCurrentWeather()
        configure(with: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupLayer() {
        layer.cornerRadius = 15
        layer.borderWidth = 1
    }
    
    public func configure(with viewModel: CurrentWeatherViewModel) {
        guard let metrics = viewModel.metrics else { return }
        self.titleLabel.text = "\(metrics.temperature) " + metrics.temperatureMeasure
    }
}
