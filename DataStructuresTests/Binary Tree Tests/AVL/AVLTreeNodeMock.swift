//
//  AVLTreeNodeMock.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 12/9/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

@testable import DataStructures

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
