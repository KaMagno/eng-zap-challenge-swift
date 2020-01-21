//
//  PropertyFilter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol PropertyFilter {
    func filteredProperties(_ properties: Properties) -> Properties
}

extension Array where Element == Property {
    func filter(_ filterElement: PropertyFilter) -> [Element] {
        return filterElement.filteredProperties(self)
    }
}

final class DefaultFilter: PropertyFilter {
    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            property.address.geoLocation.location.lat != 0 && property.address.geoLocation.location.lon != 0
        }
    }
}

final class BoundingBoxFilter: PropertyFilter {
    let minimumLatitude: Double = -23.568704
    let minimumLongitude: Double = -46.693419
    let maximumLatitude: Double = -23.546686
    let maximumLongitude: Double = -46.641146

    func isInsideArea(location: Location) -> Bool {
        let insideLatitude = location.lat >= minimumLatitude && location.lat <= maximumLatitude
        let insideLongitude = location.lon >= minimumLongitude && location.lon <= maximumLongitude
        return insideLatitude && insideLongitude
    }

    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            isInsideArea(location: property.address.geoLocation.location)
        }
    }
}

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
