//
//  File.swift
//  ZAP
//
//  Created by kaique.magno.santos on 15/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol CodeView {
    func setupViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        setupViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    func setupAdditionalConfiguration() {}
}
