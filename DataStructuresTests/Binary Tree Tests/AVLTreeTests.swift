//
//  AVLTreeTests.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 3/15/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import XCTest
@testable import DataStructures

class AVLTreeTests: XCTestCase {
    
    final class AVLTreeNodeMock<T: Comparable>: NSObject, AVLTreeNode {
        
        var left: AVLTreeNodeMock?
        var right: AVLTreeNodeMock?
        var parent: AVLTreeNodeMock? // should be weak, need to redesign AVL to have an AVLTree entity to hold a reference to the root, and update it after rotations.
        
        var balanceFactor = 0
        var value: T
        
        required init(_ value: T) {
            self.value = value
        }
        
    }
    
    class AVLTreeMock<T:Comparable>: NSObject {
        var root: AVLTreeNodeMock<T>?
    }
    
    var avlTree = AVLTreeMock<Int>()
    
    override func setUp() {
        
        avlTree.root = AVLTreeNodeMock(50)
        avlTree.root?.insert(70)
        avlTree.root?.insert(30)
        avlTree.root?.insert(40)
        avlTree.root?.insert(20)
        avlTree.root?.insert(10)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRightRotation() {
        
        XCTAssert(avlTree.root?.parent?.value == 30)
        XCTAssert(avlTree.root?.parent?.left?.value == 20)
        XCTAssert(avlTree.root?.parent?.left?.left?.value == 10)
        XCTAssert(avlTree.root?.value == 50)
        XCTAssert(avlTree.root?.right?.value == 70)
        XCTAssert(avlTree.root?.left?.value == 40)
        
    }

}
