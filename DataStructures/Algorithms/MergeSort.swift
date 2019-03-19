//
//  MergeSort.swift
//  DataStructures
//
//  Created by Scott Gorden on 3/18/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public extension Array where Element: Comparable {
    
    public func mergeSort(_ comparison: (Element, Element) -> Bool) -> [Element] {
        
        guard count > 1 else {
            return self
        }
        
        let middleIndex = count / 2
        let left = Array(self[0 ..< middleIndex]).mergeSort(comparison)
        let right = Array(self[middleIndex ..< count]).mergeSort(comparison)
        
        return merge(left: left, right: right, comparison: comparison)
        
    }
    
    private func merge(left: [Element], right: [Element], comparison: (Element, Element) -> Bool) -> [Element] {
        
        var merged: [Element] = []
        
        var i = 0
        var j = 0
        
        while i < left.count, j < right.count {
            
            if comparison(left[i], right[j]) {
                merged.append(left[i])
                i += 1
            } else {
                merged.append(right[j])
                j += 1
            }
            
        }
        
        while i < left.count {
            merged.append(left[i])
            i += 1
        }
        
        while j < right.count {
            merged.append(right[j])
            j += 1
        }
        
        return merged
        
    }
    
}
