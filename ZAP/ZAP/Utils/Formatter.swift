//
//  Formatter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

final class Formatter {
    private init() {}

    static func bussinessType(_ businessType: BusinessType) -> String {
        switch businessType {
        case .rental:
            return L10n.rental
        case .sale:
            return L10n.sale
        }
    }

    static func valueTitle() -> String {
        return L10n.value
    }

    static func price(_ value: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let number = NSNumber(integerLiteral: value)
        return formatter.string(from: number)
    }

    static func usableAreas(_ value: Int) -> String {
        "\(value) " + usableAreasUnit()
    }

    static func usableAreasUnit() -> String {
        return "m²"
    }

    static func bedRoomsUnit(isPlural: Bool) -> String {
        if isPlural {
            return L10n.numberBedRoomsPlural
        }else{
            return L10n.numberBedRooms
        }
    }

    static func bathRoomsUnit(isPlural: Bool) -> String {
        if isPlural {
            return L10n.numberBathRoomsPlural
        }else{
            return L10n.numberBathRooms
        }
    }

    static func parkingAreaUnit(isPlural: Bool) -> String {
        if isPlural {
            return L10n.numberParkingAreaPlural
        }else{
            return L10n.numberParkingArea
        }
    }

    static func bedRooms(_ value: Int) -> String {
        "\(value) " + Formatter.bedRoomsUnit(isPlural: value > 1).capitalized
    }

    static func bathRooms(_ value: Int) -> String {
        "\(value) " + Formatter.bathRoomsUnit(isPlural: value > 1).capitalized
    }

    static func parkingAreas(_ value: Int) -> String {
        "\(value) " + Formatter.parkingAreaUnit(isPlural: value > 1).capitalized
    }
}
