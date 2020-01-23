//
//  Property.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

struct Property: Codable {
    let id: String
    let images: [String]
    let usableAreas: Int
    let parkingSpaces: Int?
    let owner: Bool
    let address: Address
    let bathrooms, bedrooms: Int
    let listingType: ListingType
    let listingStatus: ListingStatus
    let pricingInfos: PricingInfos
    let updatedAt: String
    let createdAt: String
}

extension Property: Equatable {
    static func == (lhs: Property, rhs: Property) -> Bool {
        return
            lhs.usableAreas == rhs.usableAreas &&
        lhs.listingType == rhs.listingType &&
        lhs.createdAt == rhs.createdAt &&
        lhs.listingStatus == rhs.listingStatus &&
        lhs.id == rhs.id &&
        lhs.parkingSpaces == rhs.parkingSpaces &&
        lhs.updatedAt == rhs.updatedAt &&
        lhs.owner == rhs.owner &&
        lhs.images == rhs.images &&
        lhs.address == rhs.address &&
        lhs.bathrooms == rhs.bathrooms &&
        lhs.bedrooms == rhs.bedrooms &&
        lhs.pricingInfos == rhs.pricingInfos 
    }
}
