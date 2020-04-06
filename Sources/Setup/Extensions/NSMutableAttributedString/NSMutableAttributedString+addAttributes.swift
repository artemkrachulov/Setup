//
//  NSMutableAttributedString+addAttributes.swift
//  Setup
//
//  Created by Artem on 16.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    
    @discardableResult
    open func addAttributes(_ attrs: [NSAttributedString.Key: Any] = [:], text: String) -> Self {
        if let range = string.range(of: text).map({ NSRange($0, in: string) }) {
            addAttributes(attrs, range: range)
        }
        return self
    }
    
    @discardableResult
    open func addAttribute(_ name: NSAttributedString.Key, value: Any, text: String) -> Self {
        if let range = string.range(of: text).map({ NSRange($0, in: string) }) {
            addAttribute(name, value: value, range: range)
        }
        return self
    }
}
