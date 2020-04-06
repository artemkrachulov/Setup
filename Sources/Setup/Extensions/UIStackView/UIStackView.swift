//
//  UIStackView.swift
//  Setup
//
//  Created by Artem on 16.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import UIKit

extension UIStackView {
    
    open func addStretchingView() {
        
        let view = UIView()
        view.setContentHuggingPriority(UILayoutPriority(rawValue: 1), for: .horizontal)
        view.backgroundColor = .clear

        addArrangedSubview(view)
    }
    
    open func removeArrangedSubviews() {
        arrangedSubviews.forEach({ $0.removeFromSuperview() })
     }
}

