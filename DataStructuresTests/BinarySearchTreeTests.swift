//
//  BinarySearchTreeTests.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 2/28/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import XCTest
@testable import DataStructures

class BinarySearchTreeTests: XCTestCase {
    
    var bst = BSTNode(50)
    
    override func setUp() {
        bst.insert(33)
        bst.insert(45)
        bst.insert(79)
        bst.insert(61)
        bst.insert(20)
        bst.insert(87)
    }

    override func tearDown() {
        bst = BSTNode(50)
    }

    func testInorder() {
        
        var resultString = ""
        
        bst.inorder { (node) in
            resultString.append("\(node.value)-")
        }
        
        XCTAssert(resultString == "20-33-45-50-61-79-87-")
        
    }
    
    func testPreorder() {
        
        var resultString = ""
        
        bst.preorder { (node) in
            resultString.append("\(node.value)-")
        }
        
        XCTAssert(resultString == "50-33-20-45-79-61-87-")
        
    }
    
    func testPostorder() {
        
        var resultString = ""
        
        bst.postorder { (node) in
            resultString.append("\(node.value)-")
        }
        
        XCTAssert(resultString == "20-45-33-61-87-79-50-")
        
    }

}
