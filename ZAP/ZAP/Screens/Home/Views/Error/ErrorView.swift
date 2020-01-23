//
//  ErrorView.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

protocol ErrorViewDelegate: AnyObject {
    func didTap(_ view:ErrorView)
}

class ErrorView: UIView {
    // MARK: - Delegate
    weak var delegate: ErrorViewDelegate?

    // MARK: - Subviews
    private let imageView: UIImageView = .init()
    private let titleLabel: UILabel = .init()
    private let button: UIButton = .init()
    private let stackView: UIStackView = .init()

    // MARK: - Init
    init(delegate: ErrorViewDelegate? = nil) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Functions
    // MARK: Private
    @objc
    private func tap(_ button: UIButton) {
        delegate?.didTap(self)
    }

    private func setupLayoutStackView() {
        stackView.axis = .vertical
        stackView.spacing = 8
    }

    private func setupLayoutImageView() {
        imageView.image = Asset.errorIcon.image
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
    }

    private func setupLayoutTitleLabel() {
        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: 22)
        titleLabel.textAlignment = .center
    }

    private func setupLayoutButton() {
        button.backgroundColor = #colorLiteral(red: 0.01899999939, green: 0.6740000248, blue: 0.4050000012, alpha: 1)
        button.layer.cornerRadius = 8
        button.setTitleColor(#colorLiteral(red: 0.9840000272, green: 0.9840000272, blue: 0.9840000272, alpha: 1), for: .normal)
        button.setTitle(L10n.tryAgain, for: .normal)
    }

    private func setupButtonTarget() {
        button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
    }

    // MARK: Public
    func setup(text: String) {
        titleLabel.text = text
    }
}

extension ErrorView: CodeView {
    func setupViewHierarchy() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(button)
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

        setupLayoutStackView()
        setupLayoutTitleLabel()
        setupLayoutImageView()
        setupLayoutButton()
        setupButtonTarget()
    }

}
