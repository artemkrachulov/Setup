//
//  UIScrollView+pinSubview.swift
//  Extensions
//
//  Created by Artem on 16.01.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import UIKit

public extension UIScrollView {

    enum ScrollingDirection {
        case vertical
        case horizontal
    }
    
    func pinSubview(_ view: UIView, scrollingDirection: ScrollingDirection) {
        
        // Add
        pinSubview(view)
        // Set Scrolls
        
        switch scrollingDirection {
        case .vertical:
            
            view.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            
            let height = view.heightAnchor.constraint(equalTo: heightAnchor)
            height.priority = UILayoutPriority(rawValue: 200)
            height.isActive = true
            
        case .horizontal:
            
            view.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
            
            let height = view.widthAnchor.constraint(equalTo: widthAnchor)
            height.priority = UILayoutPriority(rawValue: 200)
            height.isActive = true
        }
    }
}
