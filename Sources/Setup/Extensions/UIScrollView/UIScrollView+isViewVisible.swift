//
//  UIScrollView+isViewVisible.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

public extension UIScrollView {

    func isViewVisible(_ view: UIView) -> Bool {
        return bounds.intersects(view.frame)
    }
}
