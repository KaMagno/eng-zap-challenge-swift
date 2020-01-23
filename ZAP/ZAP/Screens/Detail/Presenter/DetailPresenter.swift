//
//  DetailPresenter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

final class DetailPresenter {

    let view: DetailViewInterface
    let interactor: DetailInteractorInterface

    init(view: DetailViewInterface,
         interactor: DetailInteractorInterface) {
        self.view = view
        self.interactor = interactor
    }
}

extension DetailPresenter: DetailViewDelegate {
    func handleData() {
        var cellTypes: [DetailCellType] = []

        if !interactor.imagePath.isEmpty {
            cellTypes.append(.image(imagePath: interactor.imagePath))
        }

        cellTypes.append(
            .title(
                leftText: interactor.value,
                rightText: interactor.price))

        cellTypes.append(
            .unit(units: [
                (title: interactor.usableAreaValue, subtitle: interactor.usableAreaUnit),
                (title: interactor.bedroomsValue, subtitle: interactor.bedroomsUnit),
                (title: interactor.bathroomValue, subtitle: interactor.bathroomUnit),
                (title: interactor.parkingSpaceValue, subtitle: interactor.parkingSpaceUnit),
            ]))

        view.setViewTitle(interactor.bussinessType)
        view.setup(cellTypes)
    }
}
