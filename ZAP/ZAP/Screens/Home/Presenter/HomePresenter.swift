//
//  HomePresenter.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func show(properties: Properties)
    func show(error: PublishableError)
}

final class HomePresenter {

}

extension HomePresenter: HomePresenterInterface {
    func show(properties: Properties) {

    }
    
    func show(error: PublishableError) {

    }
}
