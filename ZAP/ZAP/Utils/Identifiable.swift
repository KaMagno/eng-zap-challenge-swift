//
//  Identifiable.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol Indentifiable {
    var identifier: String {get}
    static var identifier: String {get}
}

extension NSObject: Identifiable {
    public static var identifier: String {
        return String(describing: self)
    }
}
