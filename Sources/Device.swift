//
//  Device.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit

public class Device {
	
	/// Lazy variables
	
	public static var platform: String = {
		var systemInfo = utsname()
		uname(&systemInfo)
		let nsString = NSString(bytes: &systemInfo.machine,
                                length: Int(_SYS_NAMELEN),
                                encoding: String.Encoding.ascii.rawValue)!
		return String(validatingUTF8: nsString.utf8String!)!
	}()
	
	public static var type: DeviceType = {
		return DeviceType(device: UIDevice.current)
	}()
	
	public static var size: ScreenSize = {
		return ScreenSize(screen: UIScreen.main)
	}()
	
	public static var version: DeviceVersion = {
		return DeviceVersion(platformName: Device.platform)
	}()
	
	/// Helpers
	
    public static var scale: CGFloat {
		return UIScreen.main.scale
	}	
	
	public static var isRegularIpad: Bool {
		return !isIpadPro && !isIpadMini
	}
	
	public static var isIpadPro: Bool {
		switch (version) {
		case .iPadPro9_7Inch,
		     .iPadPro12_9Inch:
			return true
		default:
			return false
		}
	}
	
	public static var isIpadMini: Bool {
		switch (version) {
		case .iPadMini,
		     .iPadMini2,
		     .iPadMini3,
		     .iPadMini4:
			return true
		default:
			return false
		}
	}
	
	public static var isSimulator: Bool {
        #if arch(i386) || arch(x86_64)
            return true
        #else
            return false
        #endif
	}
}

// MARK: - Hardware capabilities
// --------------------------------------------------------

extension Device {
    public static var hasFaceID: Bool {
        switch version {
        case .iPhoneX:
            return true
        default:
            return false
        }
    }

    public static var hasTouchID: Bool {
        switch version {
        case .iPhone5S, .iPhone6, .iPhone6Plus, .iPhone6S, .iPhone6SPlus, .iPhoneSE, .iPhone7, .iPhone7Plus, .iPhone8, .iPhone8Plus:
            return true
        default:
            return false
        }
    }
    
    public static var hasNotch: Bool {
        return version == .iPhoneX
    }
    
    public static var hasHardwareHomeButton: Bool {
        return version != .iPhoneX
    }
}
