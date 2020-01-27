//
//  LivePhotosCollectionViewLayout.swift
//  MyAppSaveliyRadchyck
//
//  Created by Saveliy Radchyck on 1/22/20.
//  Copyright © 2020 Saveliy Radchyck. All rights reserved.
//

import UIKit

class LivePhotosCollectionViewLayout: UICollectionViewFlowLayout {

    private let offsetBetweenCells: CGFloat = 40

    override init() {
        super.init()
        commonInit()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func commonInit() {
        scrollDirection = .horizontal
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
    }
}

// MARK: - UICollectionViewFlowLayout overrides
extension LivePhotosCollectionViewLayout {

    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

    override func prepare() {
        super.prepare()
        if let collectionView = collectionView {
            let size = collectionView.bounds.size
            if size != itemSize {
                itemSize = size
            }
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return super.layoutAttributesForElements(in: rect)?
            .compactMap { $0 as UICollectionViewLayoutAttributes }
            .compactMap(prepareAttributes)
    }

    private func prepareAttributes(attributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let collectionView = self.collectionView else { return attributes }

        let width = itemSize.width
        let centerX = width / 2
        let distanceToCenter = attributes.center.x - collectionView.contentOffset.x
        let relativeDistanceToCenter = (distanceToCenter - centerX) / width

        if abs(relativeDistanceToCenter) >= 1 {
            attributes.transform = .identity
        } else {
            attributes.transform = CGAffineTransform(translationX: relativeDistanceToCenter * offsetBetweenCells, y: 0)
        }
        return attributes
    }
}
