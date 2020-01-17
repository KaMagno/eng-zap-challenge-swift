//
//  Result.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(PublishableError)
}
