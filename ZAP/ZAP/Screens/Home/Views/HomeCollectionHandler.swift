//
//  HomeCollectionHandler.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

protocol HomeCollectionHandlerDelegate: AnyObject {
    func didSelect(_ property: Property)
    func didEndPage()
}

final class HomeCollectionHandler: NSObject {
    var properties: Properties = []
    weak var delegate: HomeCollectionHandlerDelegate?
}

extension HomeCollectionHandler: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.backgroundView?.isHidden = !properties.isEmpty
        return properties.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PropertyCellCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)

        let property = properties[indexPath.row]
        let url = URL(string: property.images.first ?? "nil")

        cell.setup(imageURL: url,
                   title: property.pricingInfos.businessType,
                   price: property.pricingInfos.price,
                   bedRooms: property.bedrooms,
                   bathRooms: property.bathrooms,
                   usableAreas: property.usableAreas,
                   parkingAreas: property.parkingSpaces)

        return cell
    }
}

extension HomeCollectionHandler: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (properties.count - 5) {
            delegate?.didEndPage()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell: PropertyCellCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.outletImageView.kf.cancelDownloadTask()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let property = properties[indexPath.row]
        delegate?.didSelect(property)
    }
}

extension HomeCollectionHandler: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 360/400
        let width = collectionView.bounds.width
        let heigth: CGFloat = width * ratio
        return .init(width: width, height: heigth)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
