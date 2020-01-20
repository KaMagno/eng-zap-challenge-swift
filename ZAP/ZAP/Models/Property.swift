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
    let listingType: ListingType
    let createdAt: String
    let listingStatus: ListingStatus
    let id: String
    let parkingSpaces: Int?
    let updatedAt: String
    let owner: Bool
    let images: [String]
    let address: Address
    let bathrooms, bedrooms: Int
    let pricingInfos: PricingInfos
}
