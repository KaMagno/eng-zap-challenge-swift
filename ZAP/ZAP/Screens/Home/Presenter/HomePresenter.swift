//
//  HomePresenter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    var view: HomeViewInterface {get set}
    var interactor: HomeInteractorInterface {get set}
}

final class HomePresenter: HomePresenterInterface {

    var view: HomeViewInterface
    var interactor: HomeInteractorInterface

    init(view: HomeViewInterface,
         interactor: HomeInteractorInterface) {
        self.view = view
        self.interactor = interactor

        self.view.delegate = self
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didFetch(_ properties: Properties) {
        view.set(properties)
        view.show(.default)
        view.resetView()
    }

    func didFetchMore(_ properties: Properties) {
        view.set(properties)
        view.show(.default)
    }

    func didFetch(_ error: PublishableError) {
        view.show(.error)
    }
}

extension HomePresenter: HomeViewDelegate {
    func handlePropertyTypeValueChanged(_ viewController: HomeViewController, propertyType: PropertyType) {
        interactor.propertyType = propertyType
        interactor.fetchProperties()
        view.show(.loading)
    }

    func handleEmpty(_ viewController: HomeViewController) {
        view.show(.empty)
    }

    func handleFetchData(_ viewController: HomeViewController) {
        interactor.fetchProperties()
        view.show(.loading)
    }

    func handleFetchMoreData(_ viewController: HomeViewController) {
        interactor.fetchMoreProperties()
    }
}
