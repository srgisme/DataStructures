//
//  BinarySearchTree.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol BinarySearchTree: BinaryTree {
    
    associatedtype T: Comparable
    
    var value: T { get }
    
    init(_ value: T)
    func insertIntoBinarySearchTree(_ value: T)
    func searchBinarySearchTree(_ value: T) -> Self?
    
}

extension BinarySearchTree {
    
    public func insertIntoBinarySearchTree(_ value: T) {
        
        if value < self.value {
            
            if left != nil {
                left?.insertIntoBinarySearchTree(value)
            } else {
                left = Self(value)
            }
            
        } else if value > self.value {
            
            if right != nil {
                right?.insertIntoBinarySearchTree(value)
            } else {
                right = Self(value)
            }
            
        }
        
    }
    
    public func searchBinarySearchTree(_ value: T) -> Self? {
        
        if value < self.value {
            return left?.searchBinarySearchTree(value)
        } else if value > self.value {
            return right?.searchBinarySearchTree(value)
        }
        
        return self
        
    }
    
}
