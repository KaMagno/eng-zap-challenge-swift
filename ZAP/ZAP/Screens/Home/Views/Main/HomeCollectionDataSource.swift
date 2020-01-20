//
//  HomeCollectionDataSource.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

final class HomeCollectionDataSource: NSObject {
    var properties: Properties = []

}

extension HomeCollectionDataSource: UICollectionViewDataSource {

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
