//
//  Date+ExtensionsTest.swift
//  RickAndMortyTests
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import XCTest
@testable import RickAndMorty

class Date_ExtensionsTest: XCTestCase {

    func testMMMddYYYYFormat() {
        let date = Date(timeIntervalSinceReferenceDate: TimeInterval(0))
        
        XCTAssertEqual(date.MMMddYYYYFormat(), "Jan 01, 2001")
    }

}
