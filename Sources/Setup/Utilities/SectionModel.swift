//
//  SectionModel.swift
//  Utilities
//
//  Created by Artem on 24.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import Foundation

public class SectionModel<Section, Item> {
    
    public var model: Section?
    public var items: [Item]
    
    public init(model: Section?, items: [Item]) {
        self.model = model
        self.items = items
    }
}
