//
//  DepthFirstTraversing+TraversalType.swift
//  DataStructures
//
//  Created by Scott Gorden on 3/1/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public enum DepthFirstTraversalType {
    case preorder, inorder, postorder
}

public protocol BinaryTreeDepthFirstTraversing: NSObjectProtocol {
    
    var left: Self? { get }
    var right: Self? { get }
    func depthFirstTraversal(_ traversalType: DepthFirstTraversalType, _ process: (Self) -> Void)
    
}

extension BinaryTreeDepthFirstTraversing {
    
    public func depthFirstTraversal(_ traversalType: DepthFirstTraversalType, _ process: (Self) -> Void) {
        
        switch traversalType {
            
        case .preorder: preorder(process)
        case .inorder: inorder(process)
        case .postorder: postorder(process)
            
        }
        
    }
    
    private func inorder(_ process: (Self) -> Void) {
        
        left?.inorder(process)
        process(self)
        right?.inorder(process)
        
    }
    
    private func preorder(_ process: (Self) -> Void) {
        
        process(self)
        left?.preorder(process)
        right?.preorder(process)
        
    }
    
    private func postorder(_ process: (Self) -> Void) {
        
        left?.postorder(process)
        right?.postorder(process)
        process(self)
        
    }
    
}
