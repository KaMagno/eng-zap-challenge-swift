//
//  ImagesTableViewCell.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesTableViewCell: UITableViewCell, DefaultHeightTableViewCell {
    var defaultHeight: CGFloat {
        return 200.0
    }

    private let fullImageView: UIImageView = .init(frame: .zero)

    init(frame: CGRect = .zero) {
        super.init(style: .default, reuseIdentifier: nil)
        self.frame = frame
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(imagePath: String) {
        guard let url = URL(string: imagePath) else { return }
        fullImageView.kf.setImage(with: url)
    }
}

extension ImagesTableViewCell: CodeView {
    func setupViewHierarchy() {
        addSubview(fullImageView)
    }

    func setupConstraints() {
        fullImageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    func setupAdditionalConfiguration() {
        fullImageView.image = Asset.photoPlaceholder.image
    }
}
