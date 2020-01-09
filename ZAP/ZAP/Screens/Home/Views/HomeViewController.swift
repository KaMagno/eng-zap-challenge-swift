//
//  ViewController.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

protocol HomeViewInterface: LoadingPresentable {
    func show(properties:Properties)
    func show(error:PublishableError)
}

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension HomeViewController: HomeViewInterface {
    func show(properties: Properties) {
        
    }

    func show(error: PublishableError) {

    }
}
