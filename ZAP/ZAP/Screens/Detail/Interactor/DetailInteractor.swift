//
//  DetailInteractor.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol DetailInteractorInterface {
    var value: String {get}
    var imagePath: String {get}
    var price: String {get}
    var bussinessType: String {get}
    var bedroomsValue: String {get}
    var bedroomsUnit: String {get}
    var bathroomValue: String {get}
    var bathroomUnit: String {get}
    var usableAreaValue: String {get}
    var usableAreaUnit: String {get}
    var parkingSpaceValue: String {get}
    var parkingSpaceUnit: String {get}
}

final class DetailInteractor: DetailInteractorInterface {
    private var property: Property

    var value: String {
        Formatter.valueTitle()
    }

    var imagePath: String {
        guard let path = property.images.first else {
            return ""
        }
        return path
    }

    var price: String {
        guard let priceString = Formatter.price(property.pricingInfos.price) else {
            return "N/A"
        }

        return priceString
    }

    var bussinessType: String {
        Formatter.bussinessType(property.pricingInfos.businessType).capitalized
    }

    var bedroomsValue: String {
        "\(property.bedrooms)"
    }

    var bedroomsUnit: String {
        Formatter.bedRoomsUnit(isPlural: property.bedrooms > 1)
    }

    var bathroomValue: String {
        "\(property.bathrooms)"
    }

    var bathroomUnit: String {
        Formatter.bathRoomsUnit(isPlural: property.bathrooms > 1)
    }

    var usableAreaValue: String {
        "\(property.usableAreas)"
    }

    var usableAreaUnit: String {
        Formatter.usableAreasUnit()
    }

    var parkingSpaceValue: String {
        guard let parkingSpaces = property.parkingSpaces else {
            return "-"
        }
        return "\(parkingSpaces)"
    }

    var parkingSpaceUnit: String {
        Formatter.parkingAreaUnit(isPlural: (property.parkingSpaces ?? 0) > 1)
    }

    init(property: Property) {
        self.property = property
    }
}
