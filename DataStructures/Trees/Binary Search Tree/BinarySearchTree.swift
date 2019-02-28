//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public class BSTNode<T: Comparable>: NSObject {
    
    public var parent: BSTNode<T>?
    public var left: BSTNode<T>?
    public var right: BSTNode<T>?
    public var value: T
    
    public init(_ value: T) {
        self.value = value
    }
    
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
    
    public func insert(_ value: T) {
        
        if value < self.value {
            
            if left != nil {
                left?.insert(value)
            } else {
                left = BSTNode(value)
            }
            
        } else if value > self.value {
            
            if right != nil {
                right?.insert(value)
            } else {
                right = BSTNode(value)
            }
            
        }
        
    }
    
    public func search(_ value: T) -> BSTNode<T>? {
        
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        }
        
        return self
        
    }
    
}
