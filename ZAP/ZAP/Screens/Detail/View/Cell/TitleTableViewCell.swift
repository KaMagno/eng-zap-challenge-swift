//
//  TitleTableViewCell.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    private let leftLabel: UILabel = .init(frame: .zero)
    private let rightLabel: UILabel = .init(frame: .zero)

    init(frame: CGRect = .zero) {
        super.init(style: .default, reuseIdentifier: nil)
        self.frame = frame
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(leftText: String, rightText: String) {
        leftLabel.text = leftText
        rightLabel.text = rightText
    }
}

extension TitleTableViewCell: CodeView {
    func setupViewHierarchy() {
        addSubview(leftLabel)
        addSubview(rightLabel)
    }

    func setupConstraints() {
        leftLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self).inset(8)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(rightLabel.snp.width)
            make.right.equalTo(rightLabel.snp.left).inset(-8)
        }
        rightLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self).inset(8)
            make.top.bottom.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        leftLabel.textAlignment = .left
        leftLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
        leftLabel.adjustsFontSizeToFitWidth = true

        rightLabel.textAlignment = .right
        rightLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        rightLabel.adjustsFontSizeToFitWidth = true
    }
}
