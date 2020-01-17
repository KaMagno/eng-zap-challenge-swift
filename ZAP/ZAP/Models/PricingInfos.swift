//
//  PricingInfos.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

struct PricingInfos: Codable {
    let yearlyIptu: String
    let price: String
    let businessType: String
    let monthlyCondoFee: String
}
