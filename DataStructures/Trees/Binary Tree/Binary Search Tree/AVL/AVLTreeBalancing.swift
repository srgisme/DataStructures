//
//  AVLTreeBalancing.swift
//  DataStructures
//
//  Created by Scott Gorden on 3/15/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol AVLTreeBalancing: AVLTreeRotating {
    func balance(rotationType: inout AVLTreeRotationType?)
}

extension AVLTreeBalancing {
    
    func balance(rotationType: inout AVLTreeRotationType?) {
        
        rotationType = rotationTypeFor(node: self) ?? rotationType
        
        if isLeaf {
            
            updateParentBalanceFactor()
            parent?.balance(rotationType: &rotationType)
            
        } else {
            
            if balanceFactor == 0 {
                return
            }
            
            if balanceFactor == 1 || balanceFactor == -1 {
                
                updateParentBalanceFactor()
                parent?.balance(rotationType: &rotationType)
                
            } else if balanceFactor == 2 || balanceFactor == -2 {
                
                if rotationType != nil {
                    rotate(rotationType!)
                }
                
            }
            
        }
        
    }
    
    private func updateParentBalanceFactor() {
        
        if isRightChild {
            parent!.balanceFactor += 1
        } else if isLeftChild {
            parent!.balanceFactor -= 1
        }
        
    }
    
    private func rotationTypeFor(node: Self) -> AVLTreeRotationType? {
        
        if let parent = parent, parent.parent?.isRoot == true {
            
            if isLeftChild && parent.isLeftChild {
                return .left
            } else if isLeftChild && parent.isRightChild {
                return .rightLeft
            } else if isRightChild && parent.isLeftChild {
                return .leftRight
            } else if isRightChild && parent.isRightChild {
                return .right
            }
            
        }
        
        return nil
        
    }
    
}
