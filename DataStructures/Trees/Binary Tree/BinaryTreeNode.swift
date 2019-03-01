//
//  BinaryTree.swift
//  DataStructures
//
//  Created by Scott Gorden on 3/1/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol BinaryTreeNode: BinaryTreeDepthFirstTraversing {
    
    associatedtype Value
    
    var left: Self? { get set }
    var right: Self? { get set }
    var parent: Self? { get set }
    var value: Value { get }
    
    init(_ value: Value)
    
    
}

extension BinaryTreeNode {
    
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    
    public var isRightChild: Bool {
        return parent?.right === self
    }
    
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    
    public var isRoot: Bool {
        return parent == nil
    }
    
}
