//
//  Trie.swift
//  DataStructures
//
//  Created by Scott Gorden on 1/10/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

class TrieNode<T: Hashable> {
    
    weak var parentNode: TrieNode?
    var children: [T: TrieNode] = [:]
    var value: T?
    
    var isTerminating = false
    var isLeaf: Bool {
        return children.isEmpty
    }
    
    /// Initializes a node.
    ///
    /// - Parameters:
    ///   - value: The value that goes into the node
    ///   - parentNode: A reference to this node's parent
    init(value: T? = nil, parentNode: TrieNode? = nil) {
        self.value = value
        self.parentNode = parentNode
    }
    
    /// Adds a child node to self.  If the child is already present,
    /// do nothing.
    ///
    /// - Parameter value: The item to be added to this node.
    func add(value: T) {
        guard children[value] == nil else {
            return
        }
        children[value] = TrieNode(value: value, parentNode: self)
    }
}
