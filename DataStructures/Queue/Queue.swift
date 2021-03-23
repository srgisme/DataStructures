//
//  Queue.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public struct Queue<T> {
    
    private var head: LinkedListNode<T>?
    private weak var tail: LinkedListNode<T>?
    
    public var count = 0
    public var isEmpty: Bool {
        return count == 0
    }
    
    public init() {
        
    }
    
    public init(linkedList: LinkedListNode<T>) {
        
        var count = 1
        var current: LinkedListNode? = linkedList
        
        while let next = current?.next {
            count += 1
            current = next
        }
        
        self.head = linkedList
        self.tail = current
        self.count = count
        
    }
    
    public init(elements: [T]) {
        elements.forEach { enqueue($0) }
    }
    
    public mutating func enqueue(_ value: T) {
        
        let newNode = LinkedListNode(value)
        
        guard tail != nil else {
            
            head = newNode
            tail = newNode
            count += 1
            return
            
        }
        
        tail?.next = newNode
        tail = newNode
        count += 1
        
    }

    @discardableResult
    public mutating func dequeue() -> T? {
        
        guard let popped = head?.value else {
            return nil
        }
        
        head = head?.next
        count -= 1
        
        return popped
        
    }
    
    public mutating func peek() -> T? {
        return head?.value
    }
    
}
