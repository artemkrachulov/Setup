//
//  BaseCoordinator.swift
//  Coordinator
//
//  Created by Artem on 20.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import Foundation

open class BaseCoordinator: Coordinator {
    
    open var childCoordinators : [Coordinator] = []
    public var parentCoordinator: Coordinator? = nil
    open var isCompleted: (() -> ())?
    
    public init() {}
    
    open func start() {
        fatalError("Children should implement `start`.")
    }
}
