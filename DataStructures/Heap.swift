//
//  Heap.swift
//  DataStructures
//
//  Created by Scott Gorden on 1/8/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public struct Heap<T: Hashable>: CustomStringConvertible {
    
    public var description: String {
        return "\(self.values)"
    }
    
    private var isOrderedBefore: (T, T) -> Bool
    
    private var values: [T] = []
    private var valueIndex: [T : Int] = [:]
    
    public var count: Int {
        return self.values.count
    }
    
    public var isEmpty: Bool {
        return self.values.isEmpty
    }
    
    public init(_ values: [T] = [], _ isOrderedBefore: @escaping (T, T) -> Bool) {
        
        self.isOrderedBefore = isOrderedBefore
        self.values = values
        
        values.enumerated().forEach { (i, node) in
            self.valueIndex[node] = i
        }
        
        self.heapify()
        
    }
    
    private mutating func heapify() {
        
        for i in (0 ..< self.values.count / 2).reversed() {
            self.siftDown(from: i, to: self.values.count)
        }
        
    }
    
    public func peek() -> T? {
        return values.first
    }
    
    public func contains(_ value: T) -> Bool {
        return self.valueIndex[value] != nil
    }
    
    public mutating func push(_ value: T) {
        
        self.values.append(value)
        self.valueIndex[value] = self.values.count - 1
        self.siftUp(from: self.values.count - 1)
        
    }
    
    public mutating func pop() -> T? {
        
        guard self.values.count > 1 else { return self.values.popLast() }
        
        self.swap(0, self.values.count - 1)
        let popped = self.values.removeLast()
        self.siftDown(from: 0, to: self.values.count)
        return popped
        
    }
    
    public mutating func decreaseKey(for value: T) {

        guard let index = self.valueIndex[value] else {
            return
        }
        
        self.siftUp(from: index)

    }
    
    public mutating func increaseKey(for value: T) {
        
        guard let index = self.valueIndex[value] else {
            return
        }
        
        self.siftDown(from: index, to: self.values.count - 1)
        
    }
    
    private mutating func swap(_ i: Int, _ j: Int) {
        
        self.values.swapAt(i, j)
        self.valueIndex[self.values[i]] = i
        self.valueIndex[self.values[j]] = j
        
    }
    
    private mutating func siftUp(from startIndex: Int) {
        
        guard let parentIndex = parentIndex(of: startIndex), self.isOrderedBefore(self.values[startIndex], self.values[parentIndex]) else { return }
        
        self.self.swap(startIndex, parentIndex)
        self.siftUp(from: parentIndex)
        
    }
    
    private mutating func siftDown(from startIndex: Int, to endIndex: Int) {
        
        guard startIndex >= 0, startIndex < self.values.count else {
            return
        }
        
        var firstIndex = startIndex
        
        if let leftChildIndex = self.leftChildIndex(of: startIndex), leftChildIndex < endIndex, self.isOrderedBefore(self.values[leftChildIndex], self.values[firstIndex]) {
            firstIndex = leftChildIndex
        }
        
        if let rightChildIndex = self.rightChildIndex(of: startIndex), rightChildIndex < endIndex, self.isOrderedBefore(self.values[rightChildIndex], self.values[firstIndex]) {
            firstIndex = rightChildIndex
        }
        
        guard firstIndex != startIndex else {
            return
        }
        
        self.self.swap(firstIndex, startIndex)
        self.siftDown(from: firstIndex, to: endIndex)
        
    }
    
    public func parentIndex(of index: Int) -> Int? {
        
        let parentIndex = (index - 1) / 2
        return parentIndex >= 0 && parentIndex < self.values.count ? parentIndex : nil
        
    }
    
    public func leftChildIndex(of index: Int) -> Int? {
        
        let leftChildIndex = 2 * index + 1
        return leftChildIndex >= 0 && leftChildIndex < self.values.count ? leftChildIndex : nil
        
    }
    
    public func rightChildIndex(of index: Int) -> Int? {
        
        let rightChildIndex = 2 * index + 2
        return rightChildIndex >= 0 && rightChildIndex < self.values.count ? rightChildIndex : nil
        
    }
    
    public static func heapSort(_ arr: [T], _ isOrderedBefore: @escaping (T, T) -> Bool) -> [T] {
        
        let reverse = { i1, i2 in isOrderedBefore(i2, i1) }
        var heap = Heap(arr, reverse)
        
        for i in (0 ..< heap.values.count).reversed() {
            
            heap.swap(i, 0)
            heap.siftDown(from: 0, to: i)
            
        }
        
        return heap.values
        
    }
    
}
