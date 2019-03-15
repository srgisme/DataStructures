//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol BinarySearchTreeNode: BinaryTreeNode {
    
    associatedtype T: Comparable
    
    var value: T { get set }
    
    init(_ value: T)
    func insert(_ value: T)
    func search(_ value: T) -> Self?
    
}

extension BinarySearchTreeNode {
    
    public func insert(_ value: T) {
        
        if value < self.value {
            
            if left != nil {
                left?.insert(value)
            } else {
                let newNode = Self(value)
                newNode.parent = self
                left = newNode
            }
            
        } else if value > self.value {
            
            if right != nil {
                right?.insert(value)
            } else {
                let newNode = Self(value)
                newNode.parent = self
                right = newNode
            }
            
        }
        
    }
    
    public func search(_ value: T) -> Self? {
        
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        }
        
        return self
        
    }
    
}
