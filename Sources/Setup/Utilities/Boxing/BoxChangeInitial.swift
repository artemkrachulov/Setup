//
//  BoxChangeInitial.swift
//  Setup
//
//  Created by Artem on 16.03.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import Foundation

public class BoxChangeInitial<T: Equatable> {
    
    public typealias Listener = (T, Bool) -> Void
    private var listener: Listener?
    
    private var isChangedInitial: Bool
    private let initialValue: T
    public var value: T {
        didSet {
            
            isChangedInitial = initialValue != value
            
            guard oldValue != value else { return }
            listener?(value, isChangedInitial)
        }
    }
    
    public init(_ value: T) {
        self.value = value
        self.initialValue = value
        self.isChangedInitial = false
    }
    
    public func bind(listener: Listener?) {
        self.listener = listener
        listener?(value, isChangedInitial)
    }
}
