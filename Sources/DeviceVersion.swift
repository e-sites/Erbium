//
//  DeviceVersion.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

public enum DeviceVersion {
    /*** iPhone ***/
    case iPhone4
    case iPhone4S
    case iPhone5
    case iPhone5C
    case iPhone5S
    case iPhone6
    case iPhone6Plus
    case iPhone6S
    case iPhone6SPlus
    case iPhoneSE
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR

    /*** iPad ***/
    case iPad1
    case iPad2
    case iPadMini
    case iPad3
    case iPad4
    case iPadAir
    case iPadMini2
    case iPadAir2
    case iPadMini3
    case iPadMini4
    case iPadPro9_7Inch
    case iPadPro12_9Inch

    /*** AppleTV ***/
    case appleTV

    /*** iPod ***/
    case iPodTouch1Gen
    case iPodTouch2Gen
    case iPodTouch3Gen
    case iPodTouch4Gen
    case iPodTouch5Gen
    case iPodTouch6Gen

    /*** Unknown ***/
    case unknown

    init(platformName: String) {
        if Device.isSimulator, let tmpPlatformName = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
            print("----> platform: \(tmpPlatformName)")
            self = DeviceVersion._version(fromPlatformName: tmpPlatformName)
            return
        }
        self = DeviceVersion._version(fromPlatformName: platformName)
    }

    private static func _version(fromPlatformName platformName: String) -> DeviceVersion {
        switch (platformName) {
            /*** iPhone ***/
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":      return .iPhone4
        case "iPhone4,1", "iPhone4,2", "iPhone4,3":      return .iPhone4S
        case "iPhone5,1", "iPhone5,2":                   return .iPhone5
        case "iPhone5,3", "iPhone5,4":                   return .iPhone5C
        case "iPhone6,1", "iPhone6,2":                   return .iPhone5S
        case "iPhone7,2":                                return .iPhone6
        case "iPhone7,1":                                return .iPhone6Plus
        case "iPhone8,1":                                return .iPhone6S
        case "iPhone8,2":                                return .iPhone6SPlus
        case "iPhone8,4":                                return .iPhoneSE
        case "iPhone9,1", "iPhone9,3":                   return .iPhone7
        case "iPhone9,2", "iPhone9,4":                   return .iPhone7Plus
        case "iPhone10,1", "iPhone10,4":                 return .iPhone8
        case "iPhone10,2", "iPhone10,5":                 return .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                 return .iPhoneX
        case "iPhone11,1", "iPhone11,4":                 return .iPhoneXS
        case "iPhone11,2", "iPhone11,5":                 return .iPhoneXSMax
        case "iPhone11,3", "iPhone11,6":                 return .iPhoneXR

            /*** iPad ***/
        case "iPad1,1":                                  return .iPad1
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":            return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            return .iPad4
        case "iPad4,1", "iPad4,2", "iPad4,3":            return .iPadAir
        case "iPad5,3", "iPad5,4":                       return .iPadAir2
        case "iPad2,5", "iPad2,6", "iPad2,7":            return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            return .iPadMini3
        case "iPad5,1", "iPad5,2":                       return .iPadMini4
        case "iPad6,7", "iPad6,8":                       return .iPadPro9_7Inch
        case "iPad6,3", "iPad6,4":                       return .iPadPro12_9Inch

            /*** iPod ***/
        case "iPod1,1":                                  return .iPodTouch1Gen
        case "iPod2,1":                                  return .iPodTouch2Gen
        case "iPod3,1":                                  return .iPodTouch3Gen
        case "iPod4,1":                                  return .iPodTouch4Gen
        case "iPod5,1":                                  return .iPodTouch5Gen
        case "iPod7,1":                                  return .iPodTouch6Gen

            /*** AppleTV ***/
        case "AppleTV5,1", "AppleTV5,2", "AppleTV5,3":   return .appleTV

        default:                                         return .unknown
        }
    }

    public var name: String {
        switch self {
            /*** iPhone ***/
        case .iPhone4: return "iPhone 4"
        case .iPhone4S: return "iPhone 4S"
        case .iPhone5: return "iPhone 5"
        case .iPhone5C: return "iPhone 5C"
        case .iPhone5S: return "iPhone 5S"
        case .iPhone6: return "iPhone 6"
        case .iPhone6Plus: return "iPhone 6 Plus"
        case .iPhone6S: return "iPhone 6S"
        case .iPhone6SPlus: return "iPhone 6S Plus"
        case .iPhoneSE: return "iPhone SE"
        case .iPhone7: return "iPhone 7"
        case .iPhone7Plus: return "iPhone 7 Plus"
        case .iPhone8: return "iPhone 8"
        case .iPhone8Plus: return "iPhone 8 Plus"
        case .iPhoneX: return "iPhone X"
        case .iPhoneXS: return "iPhone XS"
        case .iPhoneXSMax: return "iPhone XS Max"
        case .iPhoneXR: return "iPhone XR"

            /*** iPad ***/
        case .iPad1: return "iPad 1"
        case .iPad2: return "iPad 2"
        case .iPadMini: return "iPad Mini 1"
        case .iPad3: return "iPad 3"
        case .iPad4: return "iPad 4"
        case .iPadAir: return "iPad Air"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadAir2: return "iPad Air 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadPro9_7Inch: return "iPad Pro 9.7 Inch"
        case .iPadPro12_9Inch: return "iPad Pro 12.9 Inch"

            /*** AppleTV ***/
        case .appleTV: return "Apple TV"

            /*** iPod ***/
        case .iPodTouch1Gen: return "iPod Touch 1"
        case .iPodTouch2Gen: return "iPod Touch 2"
        case .iPodTouch3Gen: return "iPod Touch 3"
        case .iPodTouch4Gen: return "iPod Touch 4"
        case .iPodTouch5Gen: return "iPod Touch 5"
        case .iPodTouch6Gen: return "iPod Touch 6"

            /*** Unknown ***/
        case .unknown: return "Unknown"
        }
    }
}
