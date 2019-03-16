//
//  AVLTreeNode.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol AVLTreeNode: BinarySearchTreeNode, AVLTreeBalancing {
    
    var balanceFactor: Int { get set }
    
}

extension AVLTreeNode {
    
    public func insert(_ value: T) {
        
        if value < self.value {
            
            if left != nil {
                return left!.insert(value)
            } else {
                
                let newNode = Self(value)
                newNode.balanceFactor = 0
                newNode.parent = self
                left = newNode
                
                var rotationType: AVLTreeRotationType? = nil
                newNode.balance(rotationType: &rotationType)
                
            }
            
        } else if value > self.value {
            
            if right != nil {
                return right!.insert(value)
            } else {
                
                let newNode = Self(value)
                newNode.balanceFactor = 0
                newNode.parent = self
                right = newNode
                
                var rotationType: AVLTreeRotationType? = nil
                newNode.balance(rotationType: &rotationType)
                
            }
            
        }
        
    }
    
}
