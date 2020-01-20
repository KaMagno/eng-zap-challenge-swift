//
//  HomeInteractor.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol HomeInteractorInterface {
    var delegate: HomeInteractorDelegate? {get set}

    func fetchProperties()
    func fetchMoreProperties()
}

protocol HomeInteractorDelegate: AnyObject {
    func didFetch(_ properties: Properties)
    func didFetch(_ error: PublishableError)
}

final class HomeInteractor {

    // MARK: - Variable
    // MARK: Private
    private let service: PropertiesServiceInterface
    private var allProperties: Properties = []
    private var visibleProperties: Properties = []
    private var page = 0
    private var numbersOfElementsInPage = 20

    // MARK: Public
    weak var delegate: HomeInteractorDelegate?

    // MARK: - Init
    init(service: PropertiesServiceInterface) {
        self.service = service
    }

    // MARK: - Functions
    private func handle(properties: Properties) {
        resetPage()
        allProperties = properties
        addMoreProperties()
        update()
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
        delegate?.didFetch(visibleProperties)
    }
}

// MARK: - HomeInteractorInterface
extension HomeInteractor: HomeInteractorInterface {
    func fetchProperties() {
        service.requestProperties { [weak self] (result) in
            switch result {
            case .success(let properties):
                self?.handle(properties: properties)

            case .failure(let error):
                self?.delegate?.didFetch(error)
            }
        }
    }

    func fetchMoreProperties() {
        page += 1
        addMoreProperties()
        update()
    }
}
