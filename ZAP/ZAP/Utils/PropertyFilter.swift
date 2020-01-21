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

    private func isInsideArea(latitude: Double, longitude: Double) -> Bool {
        let insideLatitude = latitude >= minimumLatitude && latitude <= maximumLatitude
        let insideLongitude = latitude >= minimumLongitude && latitude <= maximumLongitude
        return insideLatitude && insideLongitude
    }

    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            isInsideArea(latitude: property.address.geoLocation.location.lat, longitude: property.address.geoLocation.location.lon)
        }
    }
}

final class ZAPFilter: PropertyFilter {
    let minimumRentalPrice = 3500
    let maximumPrice = 600000

    private func isMoreThanMinimun(rentalPrice: Int?) -> Bool {
        guard let rentalPrice = rentalPrice else {
            return false
        }

        return rentalPrice > minimumRentalPrice
    }

    private func isMoreThanMinimun(price: Int) -> Bool {
        return price > maximumPrice
    }

    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            switch property.pricingInfos.businessType {
            case .rental:
                return isMoreThanMinimun(rentalPrice: property.pricingInfos.rentalTotalPrice)
            case .sale:
                return isMoreThanMinimun(price: property.pricingInfos.price)
            }
        }
    }
}

final class VivaRealFilter: PropertyFilter {
    let maximumRentalPrice = 4000.0
    let maximumPrice = 700000
    let percentageMinimumMonthlyCondoFeeOfRentalPrice = 0.3

    private func isLessThanMaximum(rentalPrice: Int?) -> Bool {
        guard let rentalPrice = rentalPrice else {
            return false
        }

        let doubleRentalPrice = Double(rentalPrice)



        return doubleRentalPrice <= maximumRentalPrice
    }

    private func isMonthlyCondoFee(_ monthlyCondoFee: Int?, lessThirtyPercentLessThanRentalPrice rentalPrice: Int?) -> Bool {
        guard let monthlyCondoFee = monthlyCondoFee,
            let rentalPrice = rentalPrice else {
                return false
        }

        let doubleMonthlyCondoFee = Double(monthlyCondoFee)
        let doubleRentalPrice = Double(rentalPrice)

        return doubleMonthlyCondoFee < (percentageMinimumMonthlyCondoFeeOfRentalPrice * doubleRentalPrice)
    }

    private func isLessThanMaximum(price: Int) -> Bool {
        return price > maximumPrice
    }

    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            switch property.pricingInfos.businessType {
            case .rental:
                let rentalPrice = property.pricingInfos.rentalTotalPrice
                return isLessThanMaximum(rentalPrice: rentalPrice) &&
                    isMonthlyCondoFee(property.pricingInfos.monthlyCondoFee, lessThirtyPercentLessThanRentalPrice: rentalPrice)

            case .sale:
                return isLessThanMaximum(rentalPrice: property.pricingInfos.price)
            }
        }
    }
}
