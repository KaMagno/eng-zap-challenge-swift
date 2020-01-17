//
//  Property.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

struct Property: Codable {
    let usableAreas: Int
    let listingType: String
    let createdAt: String
    let listingStatus: String
    let id: String
    let parkingSpaces: Int
    let updatedAt: String
    let owner: Bool
    let images: [String]
    let address: Address
    let bathrooms: Int
    let bedrooms: Int
    let pricingInfos: PricingInfos
}
