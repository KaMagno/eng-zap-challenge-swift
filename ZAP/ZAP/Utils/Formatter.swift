//
//  Formatter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

final class Formatter {
    static func title(_ businessType: BusinessType) -> String {
        switch businessType {
        case .rental:
            return L10n.rental
        case .sale:
            return L10n.sale
        }
    }

    static func price(_ value: String) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal

        guard let number = formatter.number(from: value) else {
            return nil
        }

        formatter.numberStyle = .currency
        return formatter.string(from: number)
    }

    static func usableAreas(_ value: String) -> String? {
        return "\(value) m²"
    }

    static func bedRooms(_ value: Int) -> String {
        if value == 0 {
            return L10n.numberBedRooms(value)
        }else{
            return L10n.numberBedRoomsPlural(value)
        }
    }

    static func bathRooms(_ value: Int) -> String {
        if value == 0 {
            return L10n.numberBathRooms(value)
        }else{
            return L10n.numberBathRoomsPlural(value)
        }
    }

    static func usableAreas(_ value: Int) -> String {
        return "\(value) m²"
    }

    static func parkingAreas(_ value: Int) -> String {
        if value == 0 {
            return L10n.numberParkingArea(value)
        }else{
            return L10n.numberParkingAreaPlural(value)
        }
    }
}
