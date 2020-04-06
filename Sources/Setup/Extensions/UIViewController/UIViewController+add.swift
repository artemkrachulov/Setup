//
//  UIViewController+add.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func add(_ child: UIViewController, pinToView view: UIView? = nil, pinClosure: ((UIView, UIView) -> Void)? = nil) {
        
        addChild(child)
        
        let parentView: UIView = view ?? self.view
        let viewToPin: UIView = child.view
        viewToPin.frame = parentView.bounds
        
        if let pinClosure = pinClosure {
            
            viewToPin.frame.size = parentView.frame.size
            parentView.addSubview(viewToPin)
            //
            pinClosure(parentView, viewToPin)
        } else {
            parentView.pinSubview(viewToPin)
        }
    
        child.didMove(toParent: self)
    }
    
    @available(iOS 9.0, *)
    func insertArrangedSubview(_ child: UIViewController, to stackView: UIStackView, at stackIndex: Int) {
        
        addChild(child)
        
        stackView.insertArrangedSubview(child.view, at: stackIndex)
        child.didMove(toParent: self)
    }
    
    @available(iOS 9.0, *)
    func addArrangedSubview(_ child: UIViewController, to stackView: UIStackView) {
        
        addChild(child)
        
        stackView.addArrangedSubview(child.view)
        child.didMove(toParent: self)
    }
}
