//
//  EnvironmentTests.swift
//  EnvironmentTests
//
//  Created by Bas van Kuijck on 18-08-16.
//  Copyright © 2016 E-sites. All rights reserved.
//

import XCTest
import Foundation
@testable import Erbium

class ErbiumTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
	
	func testDeviceType() {
		XCTAssert(Device.type == .iPad || Device.type == .iPhone)
	}
	
	func testScreenSize() {
		let size = Device.size
		if (Device.type == .iPad) {
			XCTAssert(size >= ScreenSize.screen7_9Inch)
			
		} else {
			XCTAssert(size < ScreenSize.screen7_9Inch)
		}
	}
	
	func testSimulator() {
		XCTAssert(Device.isSimulator)
	}
	
	func testPlatform() {
		XCTAssert(Device.platform == "i386" || Device.platform == "x86_64")
	}	
}
