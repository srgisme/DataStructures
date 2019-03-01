//
//  BinarySearchTreeTests.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 2/28/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import XCTest
@testable import DataStructures

final class BinarySearchTreeNodeMock<T: Comparable>: NSObject, BinarySearchTree {
    
    var left: BinarySearchTreeNodeMock?
    var right: BinarySearchTreeNodeMock?
    var parent: BinarySearchTreeNodeMock?
    
    var value: T
    
    required init(_ value: T) {
        self.value = value
    }
    
}

class BinarySearchTreeTests: XCTestCase {
    
    var bst = BinarySearchTreeNodeMock(50)
    
    override func setUp() {
        bst.insertIntoBinarySearchTree(33)
        bst.insertIntoBinarySearchTree(45)
        bst.insertIntoBinarySearchTree(79)
        bst.insertIntoBinarySearchTree(61)
        bst.insertIntoBinarySearchTree(20)
        bst.insertIntoBinarySearchTree(87)
    }

    override func tearDown() {
        bst = BinarySearchTreeNodeMock(50)
    }

    func testInorder() {
        
        var resultString = ""
        
        bst.depthFirstTraversal(.inorder) { (node) in
            resultString.append("\(node.value)-")
        }
        
        XCTAssert(resultString == "20-33-45-50-61-79-87-")
        
    }
    
    func testPreorder() {
        
        var resultString = ""
        
        bst.depthFirstTraversal(.preorder) { (node) in
            resultString.append("\(node.value)-")
        }
        
        XCTAssert(resultString == "50-33-20-45-79-61-87-")
        
    }
    
    func testPostorder() {
        
        var resultString = ""
        
        bst.depthFirstTraversal(.postorder) { (node) in
            resultString.append("\(node.value)-")
        }
        
        XCTAssert(resultString == "20-45-33-61-87-79-50-")
        
    }

}
