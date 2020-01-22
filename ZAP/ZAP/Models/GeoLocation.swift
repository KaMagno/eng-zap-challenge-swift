//
//  GeoLocation.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

struct GeoLocation: Codable {
    let precision: Precision
    let location: Location
}

extension GeoLocation: Equatable {
    static func == (lhs: GeoLocation, rhs: GeoLocation) -> Bool {
        return lhs.precision == rhs.precision && lhs.location == rhs.location
    }
}
