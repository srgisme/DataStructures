//
//  AVLTreeNode.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol AVL: BinarySearchTree {
    
    var height: Int { get set }
    var balanceFactor: Int { get }
    
}

extension AVL {
    
    public var balanceFactor: Int {
        
        let leftHeight = left?.height ?? 0
        let rightHeight = right?.height ?? 0
        return rightHeight - leftHeight
        
    }
    
}
