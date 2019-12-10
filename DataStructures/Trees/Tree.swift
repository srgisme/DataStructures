//
//  Tree.swift
//  DataStructures
//
//  Created by Scott Gorden on 1/19/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    
    public var value: T
    
    public weak var parent: TreeNode?
    public var children: [TreeNode] = []
    
    public init(value: T) {
        self.value = value
    }
    
    public func addChild(_ node: TreeNode) {
        children.append(node)
        node.parent = self
    }
    
}

extension TreeNode: CustomStringConvertible {
    
    public var description: String {
        
        var result = "\(value)"
        
        if !children.isEmpty {
            result += " {" + children.map { $0.description }.joined(separator: ", ") + "}"
        }
        
        return result
        
    }
    
}

extension TreeNode where T: Equatable {
    
    public func removeFromParent() -> TreeNode<T>? {
        
        guard let index = self.parent?.children.firstIndex(where: { $0.value == self.value }) else {
            return nil
        }
        
        return parent?.children.remove(at: index)
        
    }
    
}
