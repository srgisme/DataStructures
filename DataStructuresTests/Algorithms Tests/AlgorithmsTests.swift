//
//  AlgorithmsTests.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 3/18/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import XCTest
@testable import DataStructures

class AlgorithmsTests: XCTestCase {
    
    var testArray = [-55, 23, 12, 88, 15, 23, -100, 0]

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMergeSort() {
        
        let defaultSorted = [-100, -55, 0, 12, 15, 23, 23, 88]
        XCTAssert(testArray.mergeSort(<) == defaultSorted)
        XCTAssert(testArray.mergeSort(>) == defaultSorted.reversed())
        
    }

}
