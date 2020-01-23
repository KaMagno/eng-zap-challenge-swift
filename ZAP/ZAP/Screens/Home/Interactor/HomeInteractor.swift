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
    var propertyType: PropertyType {get set}

    func fetchProperties()
    func fetchMoreProperties()
}

protocol HomeInteractorDelegate: AnyObject {
    func didFetch(_ properties: Properties)
    func didFetchMore(_ properties: Properties)
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
    var propertyType: PropertyType = .ZAP

    // MARK: - Init
    init(service: PropertiesServiceInterface) {
        self.service = service
    }

    // MARK: - Functions
    private func filter(by propertyType: PropertyType) -> PropertyFilter {
        switch propertyType {
        case .ZAP:
            return ZAPFilter()
        case .VivaReal:
            return VivaRealFilter()
        }
    }

    private func handle(properties: Properties) {
        reset()
        allProperties = properties
        addMoreProperties()
        update()
    }

    private func addMoreProperties() {
        let initialIndex = page*numbersOfElementsInPage
        let lastIndex = initialIndex + numbersOfElementsInPage
        let propertyFilter = filter(by: propertyType)
        let filteredProperties = allProperties.filter(propertyFilter)

        for i in initialIndex..<lastIndex where i < filteredProperties.count {
            visibleProperties.append(filteredProperties[i])
        }
    }

    private func reset() {
        page = 0
        visibleProperties = []
    }

    private func update() {
        if page == 0 {
            delegate?.didFetch(visibleProperties)
        }else{
            delegate?.didFetchMore(visibleProperties)
        }
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
