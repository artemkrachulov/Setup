//
//  String+capitalizingFirstLetter.swift
//  Extensions
//
//  Created by Artem on 25.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import Foundation

public extension String {
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
