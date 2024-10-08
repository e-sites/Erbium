//
//  Device.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

public class Device {

    /// Lazy variables

    nonisolated(unsafe) public static var platform: String = {
        var systemInfo = utsname()
        uname(&systemInfo)
        let nsString = NSString(bytes: &systemInfo.machine,
                                length: Int(_SYS_NAMELEN),
                                encoding: String.Encoding.ascii.rawValue)!
        return String(validatingUTF8: nsString.utf8String!)!
    }()

    nonisolated(unsafe) public static var type: DeviceType = {
        return DeviceType(device: UIDevice.current)
    }()

    nonisolated(unsafe) public static var size: ScreenSize = {
        return ScreenSize(screen: UIScreen.main)
    }()

    nonisolated(unsafe) public static var version: DeviceVersion = {
        return DeviceVersion(platformName: Device.platform)
    }()

    /// Helpers
    public static var scale: CGFloat {
        return UIScreen.main.scale
    }

    nonisolated(unsafe) public static var isRegularIpad: Bool {
        return !isIpadPro && !isIpadMini
    }

    nonisolated(unsafe) public static var isIpadPro: Bool {
        switch (version) {
        case .iPadPro9_7Inch,
             .iPadPro12_9Inch,
             .iPadPro11Inch,
             .iPadPro10_5Inch,
             .iPadPro12_9Inch2,
             .iPadPro12_9Inch3:
            return true
        default:
            return false
        }
    }

    nonisolated(unsafe) public static var isIpadMini: Bool {
        switch (version) {
        case .iPadMini,
             .iPadMini2,
             .iPadMini3,
             .iPadMini4,
             .iPadMini5:
            return true
        default:
            return false
        }
    }

    nonisolated(unsafe) public static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
}

// MARK: - Hardware capabilities
// --------------------------------------------------------

extension Device {
    nonisolated(unsafe) public static var hasFaceID: Bool {
        if #available(iOS 11.0, *) {
            let localAuthenticationContext = LAContext()
            if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                return localAuthenticationContext.biometryType == .faceID
            }
        }
        return false
    }

    nonisolated(unsafe) public static var hasTouchID: Bool {
        if #available(iOS 11.0, *) {
            let localAuthenticationContext = LAContext()
            if localAuthenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
                return localAuthenticationContext.biometryType == .touchID
            }
        }
        return false
    }
    
    public static var topInset: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.top ?? UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        }
        return 0
    }
    
    public static var bottomInset: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
        return 0
    }
    
    nonisolated(unsafe) public static var hasNotch: Bool {
        return topInset >= 44
    }
    
    nonisolated(unsafe) public static var hasDynamicIsland: Bool {
        return topInset >= 51
    }
    
    nonisolated(unsafe) public static var hasHardwareHomeButton: Bool {
        return bottomInset == 0
    }
}
