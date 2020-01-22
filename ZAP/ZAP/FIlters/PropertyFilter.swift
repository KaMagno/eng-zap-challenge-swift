//
//  PropertyFilter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 21/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol PropertyFilter {
    func filteredProperties(_ properties: Properties) -> Properties
}

extension Array where Element == Property {
    func filter(_ filterElement: PropertyFilter) -> [Element] {
        return filterElement.filteredProperties(self)
    }
}
