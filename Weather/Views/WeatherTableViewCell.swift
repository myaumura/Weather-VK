//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Kirill Gusev on 23.03.2024.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    static let cellIdentifier = "WeatherTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(viewModel: DailyWeatherViewModel) {
        
    }
    
    override func prepareForReuse() {

    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
    
}
