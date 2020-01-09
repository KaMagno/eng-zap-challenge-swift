//
//  Address.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

struct Address: Codable {
    let city: String
    let neighborhood: String
    let geoLocation: GeoLocation
}
