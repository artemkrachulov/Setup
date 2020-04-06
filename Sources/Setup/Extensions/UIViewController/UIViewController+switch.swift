//
//  UISwitchViewController.swift
//  Extensions
//
//  Created by Artem on 27.01.2020.
//  Copyright © 2020 Artem Krachulov. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    var shownViewController: UIViewController? {
        return children.first
    }
    
    func switchChild(_ child: UIViewController) {
        guard shownViewController !== child else { return }
        
        shownViewController?.remove()
        add(child)
    }
}
