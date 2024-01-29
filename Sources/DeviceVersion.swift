//
//  DeviceVersion.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation

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
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhone12
    case iPhone12Mini
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Pro
    case iPhone13ProMax
    case iPhone13Mini
    case iPhone13
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax
    case iPhone15
    case iPhone15Pro
    case iPhone15Plus
    case iPhone15ProMax
    

    /*** iPad ***/
    case iPad1
    case iPad2
    case iPadMini
    case iPad3
    case iPad5
    case iPad4
    case iPad6
    case iPadAir
    case iPadMini2
    case iPadAir2
    case iPadAir3
    case iPadMini3
    case iPadMini4
    case iPadMini5
    case iPadPro9_7Inch
    case iPadPro10_5Inch
    case iPadPro11Inch
    case iPadPro12_9Inch
    case iPadPro12_9Inch2
    case iPadPro12_9Inch3

    /*** AppleTV ***/
    case appleTV

    /*** iPod ***/
    case iPodTouch1Gen
    case iPodTouch2Gen
    case iPodTouch3Gen
    case iPodTouch4Gen
    case iPodTouch5Gen
    case iPodTouch6Gen
    case iPodTouch7Gen

    /*** Unknown ***/
    case unknown

    init(platformName: String) {
        if Device.isSimulator, let tmpPlatformName = ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"] {
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
        case "iPhone11,2":                               return .iPhoneXS
        case "iPhone11,6":                               return .iPhoneXSMax
        case "iPhone11,8":                               return .iPhoneXR
        case "iPhone12,1":                               return .iPhone11
        case "iPhone12,3":                               return .iPhone11Pro
        case "iPhone12,5":                               return .iPhone11ProMax
        case "iPhone13,1":                               return .iPhone12Mini
        case "iPhone13,2":                               return .iPhone12
        case "iPhone13,3":                               return .iPhone12Pro
        case "iPhone13,4":                               return .iPhone12ProMax
        case "iPhone14,2":                               return .iPhone13Pro
        case "iPhone14,3":                               return .iPhone13ProMax
        case "iPhone14,4":                               return .iPhone13Mini
        case "iPhone14,5":                               return .iPhone13
        case "iPhone14,7":                               return .iPhone14
        case "iPhone14,8":                               return .iPhone14Plus
        case "iPhone15,2":                               return .iPhone14Pro
        case "iPhone15,3":                               return .iPhone14ProMax
        case "iPhone15,4":                               return .iPhone15
        case "iPhone15,5":                               return .iPhone15Plus
        case "iPhone16,1":                               return .iPhone15Pro
        case "iPhone16,2":                               return .iPhone15ProMax
            
            /*** iPad ***/
        case "iPad1,1":                                  return .iPad1
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": return .iPad2
        case "iPad3,1", "iPad3,2", "iPad3,3":            return .iPad3
        case "iPad3,4", "iPad3,5", "iPad3,6":            return .iPad4
        case "iPad6,11", "iPad6,12":                     return .iPad5
        case "iPad7,5", "iPad7,6":                       return .iPad6
        case "iPad4,1", "iPad4,2", "iPad4,3":            return .iPadAir
        case "iPad5,3", "iPad5,4":                       return .iPadAir2
        case "iPad11,3", "iPad11,4":                     return .iPadAir3
        case "iPad2,5", "iPad2,6", "iPad2,7":            return .iPadMini
        case "iPad4,4", "iPad4,5", "iPad4,6":            return .iPadMini2
        case "iPad4,7", "iPad4,8", "iPad4,9":            return .iPadMini3
        case "iPad5,1", "iPad5,2":                       return .iPadMini4
        case "iPad11,1", "iPad11,2":                     return .iPadMini5
        case "iPad6,3", "iPad6,4":                       return .iPadPro9_7Inch
        case "iPad7,3", "iPad7,4":                       return .iPadPro10_5Inch
        case "iPad8,3", "iPad8,4":                       return .iPadPro11Inch
        case "iPad6,7", "iPad6,8":                       return .iPadPro12_9Inch
        case "iPad7,1", "iPad7,2":                       return .iPadPro12_9Inch2
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": return .iPadPro12_9Inch3

            /*** iPod ***/
        case "iPod1,1":                                  return .iPodTouch1Gen
        case "iPod2,1":                                  return .iPodTouch2Gen
        case "iPod3,1":                                  return .iPodTouch3Gen
        case "iPod4,1":                                  return .iPodTouch4Gen
        case "iPod5,1":                                  return .iPodTouch5Gen
        case "iPod7,1":                                  return .iPodTouch6Gen
        case "iPod9,1":                                  return .iPodTouch7Gen

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
        case .iPhone11: return "iPhone 11"
        case .iPhone11Pro: return "iPhone 11 Pro"
        case .iPhone11ProMax: return "iPhone 11 Pro Max"
        case .iPhone12Mini: return "iPhone 12 Mini"
        case .iPhone12: return "iPhone 12"
        case .iPhone12Pro: return "iPhone 12 Pro"
        case .iPhone12ProMax: return "iPhone 12 Pro Max"
        case .iPhone13Mini: return "iPhone 13 Mini"
        case .iPhone13: return "iPhone 13"
        case .iPhone13Pro: return "iPhone 13 Pro"
        case .iPhone13ProMax: return "iPhone 13 Pro Max"
        case .iPhone14: return "iPhone 14"
        case .iPhone14Plus: return "iPhone 14 Plus"
        case .iPhone14Pro: return "iPhone 14 Pro"
        case .iPhone14ProMax: return "iPhone 14 Pro Max"

            /*** iPad ***/
        case .iPad1: return "iPad 1"
        case .iPad2: return "iPad 2"
        case .iPad3: return "iPad (3rd generation)"
        case .iPad4: return "iPad (4th generation)"
        case .iPad5: return "iPad (5th generation)"
        case .iPad6: return "iPad (6th generation)"
        case .iPadAir: return "iPad Air"
        case .iPadAir2: return "iPad Air 2"
        case .iPadAir3: return "iPad Air (3rd generation)"
        case .iPadMini: return "iPad Mini 1"
        case .iPadMini2: return "iPad Mini 2"
        case .iPadMini3: return "iPad Mini 3"
        case .iPadMini4: return "iPad Mini 4"
        case .iPadMini5: return "iPad mini (5th generation)"
        case .iPadPro9_7Inch: return "iPad Pro (9.7-inch)"
        case .iPadPro10_5Inch: return "iPad Pro (10.5-inch)"
        case .iPadPro11Inch: return "iPad Pro (11-inch)"
        case .iPadPro12_9Inch: return "iPad Pro (12.9-inch)"
        case .iPadPro12_9Inch2: return "iPad Pro (12.9-inch) (2nd generation)"
        case .iPadPro12_9Inch3: return "iPad Pro (12.9-inch) (3rd generation)"

            /*** AppleTV ***/
        case .appleTV: return "Apple TV"

            /*** iPod ***/
        case .iPodTouch1Gen: return "iPod Touch"
        case .iPodTouch2Gen: return "iPod touch (2nd generation)"
        case .iPodTouch3Gen: return "iPod touch (3rd generation)"
        case .iPodTouch4Gen: return "iPod touch (4th generation)"
        case .iPodTouch5Gen: return "iPod touch (5th generation)"
        case .iPodTouch6Gen: return "iPod touch (6th generation)"
        case .iPodTouch7Gen: return "iPod touch (7th generation)"

            /*** Unknown ***/
        case .unknown: return "Unknown"
        }
    }
}
