//
//  AVLTreeRotating.swift
//  DataStructures
//
//  Created by Scott Gorden on 3/2/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public enum AVLTreeRotationType {
    case left, right, leftRight, rightLeft
}

public protocol AVLTreeRotating: NSObjectProtocol {
    
    var parent: Self? { get set}
    var left: Self? { get set }
    var right: Self? { get set }
    
    var isLeftChild: Bool { get }
    var isRightChild: Bool { get }
    var isLeaf: Bool { get }
    var isRoot: Bool { get }
    
    var balanceFactor: Int { get set }
    
    func rotate(_ rotationType: AVLTreeRotationType)
    
}

extension AVLTreeRotating {
    
    public func rotate(_ rotationType: AVLTreeRotationType) {
        
        let originalParent = parent
        let wasLeftChild = isLeftChild
        let wasRightChild = isRightChild
        
        switch rotationType {
            
        case .left:
            
            let pivot = left
            let rotationSubtree = pivot?.right
            
            left = rotationSubtree
            rotationSubtree?.parent = self
            
            pivot?.right = self
            parent = pivot
            
            pivot?.parent = originalParent
            
            if wasLeftChild == true {
                originalParent?.left = pivot
            } else if wasRightChild == true {
                originalParent?.right = pivot
            }
            
        case .right:
            break
        case .leftRight:
            break
        case .rightLeft:
            break
        }
        
    }
    
}
