//
//  DeviceType.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import UIKit

public enum DeviceType {
	case iPhone
	case iPad
	case iPod
	case appleTV
	case unknown
	
	init(device: UIDevice) {
		#if os(tvOS)
			self = .appleTV
		#else
			switch (device.model.lowercased()) {
			case "ipad", "ipad simulator":
				self = .iPad
				
			case "ipod touch":
				self = .iPod
				
			case "iphone", "iphone simulator":
				self = .iPhone
				
			default:
				self = .unknown
			}
		#endif
	}
}
