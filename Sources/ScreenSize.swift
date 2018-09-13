//
//  ScreenSize.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import UIKit

public enum ScreenSize: Float, Comparable {
	case unknown = 0
	case screen3_5Inch = 3.5
	case screen4Inch = 4.0
	case screen4_7Inch = 4.7
	case screen5_5Inch = 5.5
    case screen5_8Inch = 5.8
    case screen6_1Inch = 6.1
    case screen6_5Inch = 6.5
	case screen7_9Inch = 7.9
	case screen9_7Inch = 9.7
	case screen12_9Inch = 12.9
	case screen1080pTV = 44
	
    init (screen: UIScreen) {
		#if os(tvOS)
			self = .screen1080pTV
		#else
			let w = screen.bounds.size.width
			let h = screen.bounds.size.height
			switch (max(w, h)) {
			case 480:
				self = .screen3_5Inch
			case 568:
				self = .screen4Inch
			case 667:
				self = (Device.scale == 3.0 ? .screen5_5Inch : .screen4_7Inch)
			case 736:
				self = .screen5_5Inch
            case 812:
                self = .screen5_8Inch
            case 896:
                self = (Device.scale == 3.0 ? .screen6_5Inch : .screen6_1Inch)
			case 1024:
				if (Device.isIpadMini) {
					self = .screen7_9Inch
				}
				self = .screen9_7Inch
			case 1366:
				self = .screen12_9Inch
			default:
				self = .unknown
			}
		#endif
	}

    public var height: CGFloat {
        switch self {
        case .unknown:
            return 0

        case .screen3_5Inch:
            return 480

        case .screen4Inch:
            return 568

        case .screen4_7Inch:
            return 667

        case .screen5_5Inch:
            return 736

        case .screen6_1Inch, .screen6_5Inch:
            return 896

        case .screen5_8Inch:
            return 812

        case .screen1080pTV:
            return 1080

        default:
            return 1024
        }
    }

    public var width: CGFloat {
        switch self {
        case .unknown:
            return 0

        case .screen3_5Inch, .screen4Inch:
            return 320

        case .screen4_7Inch, .screen5_8Inch:
            return 375

        case .screen5_5Inch, .screen6_1Inch, .screen6_5Inch:
            return 414

        case .screen1080pTV:
            return 1920

        default:
            return 768
        }
    }
}

public func == (lhs: ScreenSize, rhs: ScreenSize) -> Bool {
	return lhs.rawValue == rhs.rawValue
}

public func < (lhs: ScreenSize, rhs: ScreenSize) -> Bool {
	return lhs.rawValue < rhs.rawValue
}

public func > (lhs: ScreenSize, rhs: ScreenSize) -> Bool {
	return lhs.rawValue > rhs.rawValue
}

public func <= (lhs: ScreenSize, rhs: ScreenSize) -> Bool {
	return lhs.rawValue <= rhs.rawValue
}

public func >= (lhs: ScreenSize, rhs: ScreenSize) -> Bool {
	return lhs.rawValue >= rhs.rawValue
}
