//
//  UIApplication+topVisibleViewController.swift
//  Extensions
//
//  Created by Artem on 23.12.2019.
//  Copyright © 2019 Artem Krachulov. All rights reserved.
//

import UIKit

extension UIApplication {
    
    public func topVisibleViewController(excludeAlert: Bool = true) -> UIViewController? {
        let keyWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        return getVisibleViewController(keyWindow?.rootViewController, excludeAlert: excludeAlert)
    }
    
    private func getVisibleViewController(_ viewController: UIViewController?, excludeAlert: Bool = true, skipPresented: Bool = false) -> UIViewController? {
        
        if !skipPresented, let presVC = viewController?.presentedViewController {
            return getVisibleViewController(presVC)
        }
        
        if let navVc = (viewController as? UINavigationController)?.viewControllers.last {
            return getVisibleViewController(navVc, skipPresented: skipPresented)
        }
        
        if let tabVc = (viewController as? UITabBarController)?.selectedViewController {
            return getVisibleViewController(tabVc, skipPresented: skipPresented)
        }

        if excludeAlert, let viewController = viewController, viewController.isKind(of: UIAlertController.self) {
            return getVisibleViewController(viewController.presentingViewController, excludeAlert: false, skipPresented: true)
        }

        return viewController
    }
}
