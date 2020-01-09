//
//  GenericError.swift
//  ZAP
//
//  Created by kaique.magno.santos on 09/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

class GenericError: PublishableError {
    var error: Error?
    var message: String

    init(error: Error) {
        self.error = error
        message = error.localizedDescription
    }

    init(message: String) {
        self.message = message
    }
}
