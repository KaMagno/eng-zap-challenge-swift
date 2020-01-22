//
//  UnitView.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit
import SnapKit

class UnitView: UIView {
    private let stack: UIStackView = .init(frame: .zero)
    private let titleLabel: UILabel = .init(frame: .zero)
    private let subtitleLabel: UILabel = .init(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(title: String, subtitle: String) {
        titleLabel.text = title
        subtitleLabel.text = subtitle
    }
}

extension UnitView: CodeView {
    func setupViewHierarchy() {
        addSubview(stack)
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(subtitleLabel)
    }

    func setupConstraints() {
        stack.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        stack.axis = .vertical

        titleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .bold)
        subtitleLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)

        titleLabel.textAlignment = .center
        subtitleLabel.textAlignment = .center
    }
}
