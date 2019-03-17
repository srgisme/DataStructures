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
        queue.enqueue(1)
        queue.enqueue(2)
        queue.dequeue()
        queue.enqueue(3)
        queue.dequeue()
        queue.enqueue(4)
        queue.enqueue(5)
    }

    override func tearDown() {
        queue = Queue()
    }

    func testCount() {
        
        XCTAssert(queue.count == 3, "The count should be 3, but it is \(queue.count).")
        
    }
    
    func testPop() {
        
        let first = queue.dequeue()!
        let second = queue.dequeue()!
        let third = queue.dequeue()!
        
        XCTAssert(first == 3, "The first popped value should have been 3, but it was instead \(first).")
        XCTAssert(second == 4, "The second popped value should have been 4, but it was instead \(second).")
        XCTAssert(third == 5, "The third popped value should have been 5, but it was instead \(third).")
        
    }

}
