//
//  UIScrollView+Paging.swift
//  ZAP
//
//  Created by kaique.magno.santos on 20/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

extension UIScrollView {
    func hasReachedVerticalLimit() -> Bool {
        let usedOffset = contentOffset.y
        let availableOffset = contentSize.height - frame.height
        return usedOffset > availableOffset
    }

    func hasReachedHorizontalLimit() -> Bool {
        let usedOffset = contentOffset.x
        let availableOffset = contentSize.width - frame.width
        return usedOffset > availableOffset
    }

    func getCurrentPage() -> Int {
        let pageWidth = frame.width
        let contentOffSet = contentOffset.x
        return Int(round(contentOffSet / pageWidth))
    }
}

