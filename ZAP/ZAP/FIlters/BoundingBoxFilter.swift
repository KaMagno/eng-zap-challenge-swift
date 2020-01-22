//
//  BoundingBoxFilter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

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
