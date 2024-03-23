//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by Kirill Gusev on 20.03.2024.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "WeatherCollectionViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        backgroundColor = .blue
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(viewModel: HourlyWeatherViewModel) {
        titleLabel.text = "Text"
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
