//
//  ZAPFilter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

final class ZAPFilter: PropertyFilter {
    let minimumRentalPrice: Double = 3500.0
    let maximumPrice: Double = 600000.0
    let minimumRentalPricePercentageForInsideArea = 0.9 //10%

    private func minimumRentalPrice(for location: Location) -> Double {
        if BoundingBoxFilter().isInsideArea(location: location) {
            return minimumRentalPrice * minimumRentalPricePercentageForInsideArea
        }else{
            return maximumPrice
        }
    }

    private func isRentalPriceMoreThanMinimun(_ property: Property) -> Bool {
        guard let rentalPrice = property.pricingInfos.rentalTotalPrice else {
            return false
        }

        let doubleRentalPrice = Double(rentalPrice)

        return doubleRentalPrice > minimumRentalPrice(for: property.address.geoLocation.location)
    }

    private func isMoreThanMinimun(price: Int) -> Bool {
        let doublePrice = Double(price)
        return doublePrice > maximumPrice
    }

    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            switch property.pricingInfos.businessType {
            case .rental:
                return isRentalPriceMoreThanMinimun(property)
            case .sale:
                return isMoreThanMinimun(price: property.pricingInfos.price)
            }
        }
    }
}
