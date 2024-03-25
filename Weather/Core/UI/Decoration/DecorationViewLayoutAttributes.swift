//
//  DecorationViewLayoutAttributes.swift
//  Weather
//
//  Created by Kirill Gusev on 25.03.2024.
//

import UIKit

final class DecorationViewLayoutAttributes: UICollectionViewLayoutAttributes {
    
    private(set) var cornerRadius: CGFloat = 16
    private(set) var backgroundColor: UIColor? = Colors.secondary
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone)
        guard let attribute = copy as? DecorationViewLayoutAttributes else { return copy }
        attribute.cornerRadius = cornerRadius
        attribute.backgroundColor = backgroundColor
        return attribute
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? DecorationViewLayoutAttributes else {
            return false
        }
        return super.isEqual(object)
        && object.cornerRadius == cornerRadius
        && object.backgroundColor == backgroundColor
    }
}
