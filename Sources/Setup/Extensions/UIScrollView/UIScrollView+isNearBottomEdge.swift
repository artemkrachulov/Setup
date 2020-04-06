//
//  UIScrollView+isNearBottomEdge.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    func isNearBottomEdge(edgeOffset: CGFloat = 20.0) -> Bool {
        return contentOffset.y + frame.size.height + edgeOffset > contentSize.height
    }
}
