//
//  UnitsTableViewCell.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

class UnitsTableViewCell: UITableViewCell {
    private let stack: UIStackView = .init(frame: .zero)

    init(frame: CGRect = .zero) {
        super.init(style: .default, reuseIdentifier: nil)
        self.frame = frame
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(units: [(title: String, subtitle: String)]) {
        for unit in units {
            let unitView = UnitView()
            unitView.setup(title: unit.title, subtitle: unit.subtitle)
            stack.addArrangedSubview(unitView)
        }
    }
}

extension UnitsTableViewCell: CodeView {
    func setupViewHierarchy() {
        addSubview(stack)
    }

    func setupConstraints() {
        stack.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview().inset(8)
            make.top.bottom.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        stack.distribution = .fillEqually
        stack.spacing = 4
    }
}
