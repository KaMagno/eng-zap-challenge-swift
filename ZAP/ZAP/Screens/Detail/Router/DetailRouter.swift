//
//  DetailRouter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 22/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation


final class DetailRouter {
    private(set) var view: DetailViewController
    let presenter: DetailPresenter
    let interactor: DetailInteractor

    init(property: Property) {
        view = DetailViewController()
        interactor = DetailInteractor(property: property)
        presenter = DetailPresenter(view: view, interactor: interactor)
        view.delegate = presenter
        presenter.handleData()
    }
}
