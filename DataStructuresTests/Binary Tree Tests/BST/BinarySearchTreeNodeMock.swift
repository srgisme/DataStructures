//
//  BinarySearchTreeNodeMock.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 12/9/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

@testable import DataStructures

final class BinarySearchTreeNodeMock<T: Comparable>: NSObject, BinarySearchTreeNode {

    var left: BinarySearchTreeNodeMock?
    var right: BinarySearchTreeNodeMock?
    weak var parent: BinarySearchTreeNodeMock?

    var value: T

    required init(_ value: T) {
        self.value = value
    }

}
