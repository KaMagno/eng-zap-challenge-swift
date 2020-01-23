//
//  MinimumRequirementsFilter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

final class MinimumRequirementsFilter: PropertyFilter {
    func filteredProperties(_ properties: Properties) -> Properties {
        properties.filter { (property) -> Bool in
            property.address.geoLocation.location.lat != 0 && property.address.geoLocation.location.lon != 0
        }
    }
}
