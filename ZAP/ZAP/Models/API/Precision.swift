//
//  Precision.swift
//  ZAP
//
//  Created by kaique.magno.santos on 20/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

enum Precision: String, Codable {
    case approximate = "APPROXIMATE"
    case geometricCenter = "GEOMETRIC_CENTER"
    case noGeocode = "NO_GEOCODE"
    case rangeInterpolated = "RANGE_INTERPOLATED"
    case rooftop = "ROOFTOP"
}
