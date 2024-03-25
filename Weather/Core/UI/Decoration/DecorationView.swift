//
//  DecorationView.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import UIKit

final class DecorationView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        guard let layoutAttributes = layoutAttributes as? DecorationViewLayoutAttributes else {
            return
        }
        layer.cornerRadius = layoutAttributes.cornerRadius
        backgroundColor = layoutAttributes.backgroundColor
    }
}
