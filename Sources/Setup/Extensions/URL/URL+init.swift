//
//  URL+init.swift
//  Setup
//
//  Created by Artem on 16.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation

extension URL: ExpressibleByStringLiteral {
    // By using 'StaticString' we disable string interpolation, for safety
    public init(stringLiteral value: StaticString) {
        self = URL(string: "\(value)")!
    }
}


extension URL {
    
    public init?(string: String?) {
        guard let string = string
            else { return nil }
        self.init(string: string)
    }
}
