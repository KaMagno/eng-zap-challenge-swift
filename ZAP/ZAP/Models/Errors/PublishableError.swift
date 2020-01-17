//
//  Error.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol PublishableError: Error {
    var message: String {get}
}

