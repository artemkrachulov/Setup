//
//  BoxChange.swift
//  Setup
//
//  Created by Artem on 16.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation

public class BoxChange<T: Equatable> {
    
    public typealias Listener = (T) -> Void
    private var listener: Listener?
    
    public var value: T {
        didSet {
            guard oldValue != value else { return }
            listener?(value)
        }
    }
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
