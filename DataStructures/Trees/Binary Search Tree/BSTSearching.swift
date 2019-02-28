//
//  BSTSearching.swift
//  DataStructures
//
//  Created by Scott Gorden on 2/27/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public protocol BSTSearching {
    
    associatedtype Value: Comparable
    
    var left: Self? { get }
    var right: Self? { get }
    var value: Value { get }
    
    func search(_ value: Value) -> Self?
    
}

extension BSTSearching {
    
    public func search(_ value: Value) -> Self? {
        
        if value < self.value {
            return left?.search(value)
        } else if value > self.value {
            return right?.search(value)
        }
        
        return self
        
    }
    
}
