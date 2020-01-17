//
//  HomeInteractor.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {
    func fetchProperties()
    func fetchMoreProperties()
}

final class HomeInteractor {

    private let service: PropertiesServiceInterface
    private let presenter: HomePresenterInterface
    private var allProperties: Properties = []
    private var visibleProperties: Properties = []
    private var page = 0
    private var numbersOfElementsInPage = 20

    init(service: PropertiesServiceInterface,
         presenter: HomePresenterInterface) {
        self.service = service
        self.presenter = presenter
    }

    private func handle(properties: Properties) {
        resetPage()
        allProperties = properties
        addMoreProperties()
    }

    private func addMoreProperties() {
        let initialIndex = page*numbersOfElementsInPage
        let lastIndex = initialIndex + numbersOfElementsInPage
        for i in initialIndex..<lastIndex {
            visibleProperties.append(allProperties[i])
        }
    }

    private func resetPage() {
        page = 0
    }

    private func update() {
        presenter.show(properties: visibleProperties)
    }
}

extension HomeInteractor: HomeInteractorInterface {
    func fetchProperties() {
        service.requestProperties { [weak self] (result) in
            switch result {
            case .success(let properties):
                self?.handle(properties: properties)

            case .failure(let error):
                self?.presenter.show(error: error)
            }
        }
    }

    func fetchMoreProperties() {
        addMoreProperties()
    }
}
