//
//  HomeRouter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

protocol HomeRouterInterface: AnyObject {

}

final class HomeRouter {

    let view: HomeViewController
    let presenter: HomePresenterInterface
    let interactor: HomeInteractorInterface

    init(service: PropertiesServiceInterface = PropertiesService()) {

        let interactor = HomeInteractor(service: service)
        let view: HomeViewController = HomeViewController.instanceFromStoryboard()

        let presenter = HomePresenter(view: view, interactor: interactor)
        interactor.delegate = presenter
        view.delegate = presenter

        self.view = view
        self.presenter = presenter
        self.interactor = interactor
    }
}

extension HomeRouter: HomeRouterInterface {

}
