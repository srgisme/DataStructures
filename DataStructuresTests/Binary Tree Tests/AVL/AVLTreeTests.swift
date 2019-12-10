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
    
    var avlTree = AVLTreeMock<Int>()
    
    override func setUp() {
        
    }

    override func tearDown() {
        avlTree.root = nil
    }

    func testRightRotation() {
        
        avlTree.root = AVLTreeNodeMock(50)
        avlTree.root?.insert(70)
        avlTree.root?.insert(30)
        avlTree.root?.insert(40)
        avlTree.root?.insert(20)
        avlTree.root?.insert(10)
        
        avlTree.root = avlTree.root?.parent
        
        XCTAssertEqual(avlTree.root?.value, 30)
        XCTAssertEqual(avlTree.root?.left?.value, 20)
        XCTAssertEqual(avlTree.root?.left?.left?.value, 10)
        XCTAssertEqual(avlTree.root?.right?.value, 50)
        XCTAssertEqual(avlTree.root?.right?.right?.value, 70)
        XCTAssertEqual(avlTree.root?.right?.left?.value, 40)
        
    }
    
    func testLeftRotation() {
        
        avlTree.root = AVLTreeNodeMock(50)
        avlTree.root?.insert(70)
        avlTree.root?.insert(30)
        avlTree.root?.insert(80)
        avlTree.root?.insert(60)
        avlTree.root?.insert(90)
        
        avlTree.root = avlTree.root?.parent
        
        XCTAssertEqual(avlTree.root?.value, 70)
        XCTAssertEqual(avlTree.root?.left?.value, 50)
        XCTAssertEqual(avlTree.root?.left?.left?.value, 30)
        XCTAssertEqual(avlTree.root?.left?.right?.value, 60)
        XCTAssertEqual(avlTree.root?.right?.value, 80)
        XCTAssertEqual(avlTree.root?.right?.right?.value, 90)
        
    }

}
