//
//  EmptyView.swift
//  ZAP
//
//  Created by kaique.magno.santos on 15/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

class EmptyView: UIView {
    // MARK: - Subviews
    private let imageView: UIImageView = .init()
    private let titleLabel: UILabel = .init()
    private let stackView: UIStackView = .init()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    func setup(text: String) {
        titleLabel.text = text
    }
}

extension EmptyView: CodeView {
    func setupViewHierarchy() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        addSubview(stackView)
    }

    func setupConstraints() {
        //I did not use SnapKit in this view with porpose of show my knowledge
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 54).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -54).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        let imageAspectRatio: CGFloat = 246 / 140
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: imageAspectRatio).isActive = true
        imageView.widthAnchor.constraint(lessThanOrEqualToConstant: 246).isActive = true
    }

    func setupAdditionalConfiguration() {
        backgroundColor = .white

        stackView.axis = .vertical
        stackView.spacing = 8

        imageView.image = UIImage(imageLiteralResourceName: "EmptyImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        titleLabel.textAlignment = .center

    }
}
