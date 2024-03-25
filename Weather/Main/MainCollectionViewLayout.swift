//
//  MainCollectionViewLayout.swift
//  Weather
//
//  Created by Kirill Gusev on 24.03.2024.
//

import UIKit

final class MainCollectionViewLayout: UICollectionViewFlowLayout {
    
    var excludedSections = IndexSet()
    
    private var cache = [Int: UICollectionViewLayoutAttributes]()
    
    private let viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init()
        register(DecorationView.self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        guard let collectionView else { return false }
        let topOffset = collectionView.contentInset.top + newBounds.origin.y
        return collectionView.bounds != newBounds || topOffset < 0
    }
    
    override func layoutAttributesForDecorationView(ofKind elementKind: String,
                                                    at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard elementKind == DecorationView.reuseIdentifier else {
            return nil
        }
        
        guard !excludedSections.contains(indexPath.section) else {
            return nil
        }
        
        if let cachedDecorationAttrs = cache[indexPath.section] {
            return cachedDecorationAttrs
        }

        let decorationAttrs = DecorationViewLayoutAttributes(forDecorationViewOfKind: DecorationView.reuseIdentifier,
                                                             with: indexPath)

        guard let attributes = layoutAttributesForItem(at: indexPath),
              let section = viewModel.sections[safe: indexPath.section] else {
            return nil
        }
        
        var frame = attributes.frame
        if attributes.representedElementKind != UICollectionView.elementKindSectionHeader {
            var height = CGFloat.zero
            (0 ..< indexPath.item).forEach { index in
                let itemVM = viewModel.sections[indexPath.section].items[index]
                height += itemVM.size.height
            }
            frame.origin.y -= height
        }
        frame.size.height = section.height

        decorationAttrs.frame = attributes.frame
        decorationAttrs.zIndex = -1
        cache[indexPath.section] = decorationAttrs

        return decorationAttrs
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttributes = super.layoutAttributesForElements(in: rect) else {
            return nil
        }
        
        var attributes = layoutAttributes.compactMap {
            return $0.copy() as? UICollectionViewLayoutAttributes
        }
        
        let decorations = layoutAttributes.compactMap {
            return layoutAttributesForDecorationView(ofKind: DecorationView.reuseIdentifier, at: $0.indexPath)
        }
        
        attributes.append(contentsOf: decorations)
        
        return attributes
    }
    
    override func prepare() {
        super.prepare()
        cache.removeAll()
    }
}

extension UICollectionViewLayout {
    
    func register<T: UICollectionReusableView>(_ classType: T.Type) {
        register(classType, forDecorationViewOfKind: classType.reuseIdentifier)
    }
}
