//
//  UIWindow+setRootViewController.swift
//  
//
//  Created by Artem K on 16.06.2020.
//

import UIKit

extension UIWindow {

	/**
	 Sets root view controller and makes window key and visible.

	 - parameter viewController: Target view controller provides the content view of the window..
	 - parameter duration: The returned token for de-registering.
	 -  parameter options: A mask of options indicating how you want to perform the animations. For a list of valid constants, see UIView.AnimationOptions.
	 - parameter completion:A block object to be executed when the animation sequence ends. This block has no return value and takes a single Boolean argument that indicates whether or not the animations actually finished before the completion handler was called. If the duration of the animation is 0, this block is performed at the beginning of the next run loop cycle. This parameter may be NULL.
	 */
	func setRootViewController(_ viewController: UIViewController, duration: TimeInterval = 0.3, options: UIView.AnimationOptions = .transitionCrossDissolve, completion: ((Bool) -> Void)? = nil) {
		
		guard duration == 0.0 else {
			rootViewController = viewController
			makeKeyAndVisible()
			return
		}

		rootViewController = viewController
		makeKeyAndVisible()
		UIView.transition(with: self, duration: duration, options: options, animations: nil, completion: completion)
	}
}
