//
//  VivaRealFilter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

final class VivaRealFilter: PropertyFilter {
    let maximumRentalPrice = 4000.0
    let maximumRentalPricePercentageForInsideArea = 1.5 //50%
    let maximumPrice = 700000
    let percentageMinimumMonthlyCondoFeeOfRentalPrice = 0.3

    private func maximumRentalPrice(for location: Location) -> Double {
        if BoundingBoxFilter().isInsideArea(location: location) {
            return maximumRentalPrice * maximumRentalPricePercentageForInsideArea
        }else{
            return maximumRentalPrice
        }
    }

    private func isRentalPriceLessThanMaximum(_ property: Property) -> Bool {
        guard let rentalPrice = property.pricingInfos.rentalTotalPrice else {
            return false
        }

        let doubleRentalPrice = Double(rentalPrice)

        return doubleRentalPrice <= maximumRentalPrice(for: property.address.geoLocation.location)
    }

    private func isMonthlyCondoFeePercentageLessThirtyPercentLessThanRentalPrice(_ property: Property) -> Bool {
        guard let monthlyCondoFee = property.pricingInfos.monthlyCondoFee,
            let rentalPrice = property.pricingInfos.rentalTotalPrice else {
                return false
        }

        let doubleMonthlyCondoFee = Double(monthlyCondoFee)
        let doubleRentalPrice = Double(rentalPrice)

        return doubleMonthlyCondoFee < (percentageMinimumMonthlyCondoFeeOfRentalPrice * doubleRentalPrice)
    }

    private func isLessThanMaximumPrice(_ property: Property) -> Bool {
        return property.pricingInfos.price > maximumPrice
    }

    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            switch property.pricingInfos.businessType {
            case .rental:
                return isRentalPriceLessThanMaximum(property) &&
                    isMonthlyCondoFeePercentageLessThirtyPercentLessThanRentalPrice(property)

            case .sale:
                return isLessThanMaximumPrice(property)
            }
        }
    }
}
