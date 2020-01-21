//
//  PricingInfos.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

struct PricingInfos: Codable {
    let yearlyIptu: Int?
    let price: Int
    let businessType: BusinessType
    let monthlyCondoFee: Int?
    let period: Period?
    let rentalTotalPrice: Int?

    enum CodingKeys: String, CodingKey {
        case businessType
        case monthlyCondoFee
        case price
        case yearlyIptu
        case period
        case rentalTotalPrice
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        businessType = try values.decode(BusinessType.self, forKey: .businessType)
        period = try values.decodeIfPresent(Period.self, forKey: .period)

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        let stringPrice = try values.decode(String.self, forKey: .price)
        guard let formattedPrice = numberFormatter.number(from: stringPrice) else {
            throw NumberFormatterErrors.convertString
        }
        price = formattedPrice.intValue

        if let stringMonthlyCondoFee = try values.decodeIfPresent(String.self, forKey: .monthlyCondoFee),
            let formattedMonthlyCondoFee = numberFormatter.number(from: stringMonthlyCondoFee) {
            monthlyCondoFee = formattedMonthlyCondoFee.intValue
        }else {
            monthlyCondoFee = nil
        }

        if let stringYearlyIptu = try values.decodeIfPresent(String.self, forKey: .yearlyIptu),
            let formattedYearlyIptu = numberFormatter.number(from: stringYearlyIptu) {
            yearlyIptu = formattedYearlyIptu.intValue

        }else {
            yearlyIptu = nil
        }

        if let stringRentalTotalPrice = try values.decodeIfPresent(String.self, forKey: .rentalTotalPrice),
            let formattedRentalTotalPrice = numberFormatter.number(from: stringRentalTotalPrice) {
            rentalTotalPrice = formattedRentalTotalPrice.intValue
        }else {
            rentalTotalPrice = nil
        }
    }
}
