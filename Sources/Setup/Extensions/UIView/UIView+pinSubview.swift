//
//  UIView+pinSubview.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

public struct PinSettings {
    
    public typealias Constraint = (attribute: NSLayoutConstraint.Attribute, value: CGFloat)
    
    fileprivate var constraints: [Constraint]
    fileprivate var safeArea: [NSLayoutConstraint.Attribute]

    public init(constraints: [Constraint], safeArea: [NSLayoutConstraint.Attribute] = []) {
        self.constraints = constraints
        self.safeArea = safeArea
    }
    
    public static var zero: PinSettings {
        return PinSettings.allSides(0)
    }
    
    public static func allSides(_ value: CGFloat, safeArea: [NSLayoutConstraint.Attribute] = []) -> PinSettings {
        return PinSettings(constraints: [(.top, value), (.right, value), (.bottom, value), (.left, value)], safeArea: safeArea)
    }
    
    public static func bottom(_ value: CGFloat, height: CGFloat? = nil) -> PinSettings {
        
        var constraints: [Constraint] = [(.right, value), (.bottom, value), (.left, value)]
        if let height = height {
            constraints.append(Constraint(.height, height))
        }
        
        return PinSettings(constraints: constraints)
    }
}

extension UIView {
    
    public func pinSubview(_ view: UIView, settings: PinSettings = .zero) {
        
        view.frame.size = self.frame.size
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        
        for constraint in settings.constraints {
            var value = constraint.value
            
            if settings.safeArea.contains(constraint.attribute), constraint.attribute == .top {
                if #available(iOS 11.0, *) {
                    view.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: value).isActive = true
                    continue
                } else if #available(iOS 9.0, *) {
                    view.topAnchor.constraint(equalTo: topAnchor, constant: value).isActive = true
                    continue
                }
            }
            
            if settings.safeArea.contains(constraint.attribute), constraint.attribute == .right {
                if #available(iOS 11.0, *) {
                    view.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -value).isActive = true
                    continue
                } else if #available(iOS 9.0, *) {
                    view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -value).isActive = true
                    continue
                }
            }
            
            if settings.safeArea.contains(constraint.attribute), constraint.attribute == .bottom {
                if #available(iOS 11.0, *) {
                    view.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -value).isActive = true
                    continue
                } else if #available(iOS 9.0, *) {
                    view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -value).isActive = true
                    continue
                }
            }
            
            if settings.safeArea.contains(constraint.attribute), constraint.attribute == .left {
                if #available(iOS 11.0, *) {
                    view.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: value).isActive = true
                    continue
                } else if #available(iOS 9.0, *) {
                    view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: value).isActive = true
                    continue
                }
            }
            
            value *= [NSLayoutConstraint.Attribute.bottom, .right].contains(constraint.attribute) ? -1 : 1
            
            if [NSLayoutConstraint.Attribute.height, .width].contains(constraint.attribute) {
                if #available(iOS 9.0, *) {
                    print(constraint.attribute)
                    view.heightAnchor.constraint(equalToConstant: constraint.value).isActive = true
                } else {
                    view.addConstraint(NSLayoutConstraint(item: view, attribute: constraint.attribute, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: value))
                }
                
            } else {
                self.addConstraint(NSLayoutConstraint(item: view, attribute: constraint.attribute, relatedBy: .equal, toItem: self, attribute: constraint.attribute, multiplier: 1.0, constant: value))
            }
            
        }
    }
}
