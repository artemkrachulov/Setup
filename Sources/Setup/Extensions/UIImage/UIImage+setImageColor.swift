//
//  UIImage+ setImageColor.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

extension UIImageView {
    
    /// Render image as template and sets the color for it.
    /// - Parameter color: The color of the rendered image.
    ///
    /// ### Source
    /// [Stackoverflow](https://stackoverflow.com/a/36591030/4314758)
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
}
