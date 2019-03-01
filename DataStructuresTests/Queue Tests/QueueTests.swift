//
//  QueueTests.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import XCTest
@testable import DataStructures

class QueueTests: XCTestCase {

    var queue = Queue<Int>()
    
    override func setUp() {
        queue.push(1)
        queue.push(2)
        queue.pop()
        queue.push(3)
        queue.pop()
        queue.push(4)
        queue.push(5)
    }

    override func tearDown() {
        queue = Queue()
    }

    func testCount() {
        
        XCTAssert(queue.count == 3, "The count should be 3, but it is \(queue.count).")
        
    }
    
    func testPop() {
        
        let first = queue.pop()!
        let second = queue.pop()!
        let third = queue.pop()!
        
        XCTAssert(first == 3, "The first popped value should have been 3, but it was instead \(first).")
        XCTAssert(second == 4, "The second popped value should have been 4, but it was instead \(second).")
        XCTAssert(third == 5, "The third popped value should have been 5, but it was instead \(third).")
        
    }

}
