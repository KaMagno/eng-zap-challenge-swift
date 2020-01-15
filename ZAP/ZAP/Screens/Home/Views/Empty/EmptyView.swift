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
}

extension EmptyView: CodeView {
    func setupViewHierarchy() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        addSubview(stackView)
    }
    func setupConstraints() {
        //I did not use SnapKit in this view with porpose of show my knowledge
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

    }
    func setupAdditionalConfiguration() {
        stackView.axis = .vertical
        stackView.spacing = 8

        imageView.image = UIImage(imageLiteralResourceName: "EmptyView")
    }
}
