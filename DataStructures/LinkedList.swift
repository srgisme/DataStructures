//
//  LinkedList.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

class LinkedListNode<T>: NSObject {
    
    var next: LinkedListNode?
    var value: T
    
    init(_ value: T) {
        self.value = value
    }
    
}
