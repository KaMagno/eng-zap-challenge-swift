//
//  StoryboardInitiable.swift
//  ZAP
//
//  Created by kaique.magno.santos on 19/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

protocol StoryboardInitiable {
    static func instanceFromStoryboard<T: UIViewController> () -> T
}

extension StoryboardInitiable {
    static func instanceFromStoryboard<T: UIViewController> () -> T {
        let identifier = String(describing: self)
        let storyboard = UIStoryboard(name: identifier, bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: identifier)
        guard let castedController = controller as? T else {
            fatalError("Could not cast viewController to \(String(describing: T.self))")
        }
        return castedController
    }
}
