//
//  DetailFactoryCell.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit



final class DetailFactoryCell {



    // MARK: - Variable
    // MARK: Private
    private let types: [DetailCellType]

    // MARK: Public
    var numberOfCells: Int {
        return types.count
    }

    // MARK: - Init
    init(_ types: [DetailCellType]) {
        self.types = types
    }

    // MARK: - Function
    // MARK: Private
    private func cell(by type: DetailCellType) -> UITableViewCell {
        var cell: UITableViewCell

        switch type {
        case .title(leftText: let left, rightText: let right):
            let titleCell = TitleTableViewCell()
            titleCell.setup(leftText: left, rightText: right)
            cell = titleCell

        case .image(imagePath: let path):
            let imagesCell = ImagesTableViewCell()
            imagesCell.setup(imagePath: path)
            cell = imagesCell

        case .unit(units: let units):
            let unitsCell = UnitsTableViewCell()
            unitsCell.setup(units: units)
            cell = unitsCell
        }

        return cell
    }

    // MARK: Public
    func cell(for indexPath: IndexPath) -> DefaultHeightTableViewCell {
        let type = types[indexPath.row]
        guard let heightCell = cell(by: type) as? DefaultHeightTableViewCell else {
            fatalError("Could not cast cell to a DefaultHeightTableViewCell")
        }
        return heightCell
    }
}
