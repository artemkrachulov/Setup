//
//  UIImage+tinted.swift
//  
//
//  Created by Artem K on 21.08.2020.
//

import UIKit

extension UIImage {
	
	@available(iOS 10, *)
	public func tinted(with color: UIColor, isOpaque: Bool = false) -> UIImage? {
		
		let format = imageRendererFormat
		format.opaque = isOpaque
		return UIGraphicsImageRenderer(size: size, format: format).image { _ in
			color.set()
			withRenderingMode(.alwaysTemplate).draw(at: .zero)
		}
	}
	
	@available(iOS 9, *)
	public func tinted(with color: UIColor) -> UIImage? {
		
		UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
		let context = UIGraphicsGetCurrentContext()
		
		let rect = CGRect(origin: CGPoint.zero, size: size)
		
		color.setFill()
		self.draw(in: rect)
		
		context?.setBlendMode(.sourceIn)
		context?.fill(rect)
		
		let resultImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return resultImage
	}
}
