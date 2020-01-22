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
