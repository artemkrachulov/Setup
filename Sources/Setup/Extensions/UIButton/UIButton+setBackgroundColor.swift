//
//  UIButton+setBackgroundColor.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /// Sets the background color to use for the specified button state.
    /// - Parameter color: The color of the title to use for the specified state.
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(UIImage(color: color), for: state)
    }
}
