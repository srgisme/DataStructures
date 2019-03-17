//
//  LinkedList.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public class LinkedListNode<T>: NSObject {
    
    public var next: LinkedListNode?
    public var value: T
    
    public init(_ value: T) {
        self.value = value
    }
    
}
