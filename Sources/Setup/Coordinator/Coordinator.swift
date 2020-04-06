//
//  Coordinator.swift
//  Coordinator
//
//  Created by Artem on 20.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] { get set }
    var parentCoordinator: Coordinator? { get set }
    func start()
}

extension Coordinator {

    public func store(in coordinator: Coordinator) {
        coordinator.childCoordinators.append(self)
        parentCoordinator = coordinator
    }
    
    public func release() {
        
        guard let parent = parentCoordinator else { return }
        for (index, coordinator) in parent.childCoordinators.enumerated() where coordinator === self {
            parent.childCoordinators.remove(at: index)
        }
        self.parentCoordinator = nil
    }
}
