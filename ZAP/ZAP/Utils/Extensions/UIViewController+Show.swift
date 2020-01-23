//
//  UIView+Show.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Change the view with an animation
    /// - Parameter newView: the view which will be shown
    /// - Returns: [discardable] the previous view
    @discardableResult
    func show(_ newView: UIView) -> UIView {
        DispatchQueue.main.async {
            newView.alpha = 0.0
            UIView.animate(withDuration: 0.25, animations: {
                self.view.alpha = 0.0
            }) { (finished) in
                self.view = newView
                if finished {
                    self.view.alpha = 1.0
                }
            }
        }
        return newView
    }
}

