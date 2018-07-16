//
//  Bundle.swift
//  Erbium
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import Foundation

extension Bundle {
    public var version: String {
        return (self.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String) ?? ""
    }
    
    public var build: String {
        return (self.object(forInfoDictionaryKey: "CFBundleVersion") as? String) ?? ""
    }
}
