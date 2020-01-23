//
//  DetailCellType.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

// MARK: - Enum
enum DetailCellType {
    case title(leftText: String, rightText: String)
    case image(imagePath: String)
    case unit(units: [(title: String, subtitle: String)])
}
