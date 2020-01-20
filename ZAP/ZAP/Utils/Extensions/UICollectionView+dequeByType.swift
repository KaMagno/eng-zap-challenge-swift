//
//  UICollectionViewCell+dequebyType.swift
//  ZAP
//
//  Created by kaique.magno.santos on 17/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier : \(T.identifier)")
        }

        return cell
    }
}
