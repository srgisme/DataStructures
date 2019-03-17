//
//  Graph.swift
//  DataStructures
//
//  Created by Scott Gorden on 1/8/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import Foundation

public class Graph<T: CustomStringConvertible>: NSObject {
    
    public class Node: NSObject {
        
        public var data: T
        public var neighbors: [(node: Node, weight: Double)]
        
        fileprivate var pathLengthFromStart = Double.infinity
        fileprivate var pathNodesFromStart: [Node] = []
        
        override public var description: String {
            return "\(self.data)"
        }
        
        public init(data: T, neighbors: [(Node, Double)] = []) {
            
            self.data = data
            self.neighbors = neighbors
            super.init()
            
        }
        
        fileprivate func clearCache() {
            self.pathNodesFromStart = []
            self.pathLengthFromStart = Double.infinity
        }
        
    }
    
    public var nodes: [Node] = []
    
    override public var description: String {
        return "\(self.nodes)"
    }
    
    public init(nodes: [Node]) {
        
        self.nodes = nodes
        super.init()
        
    }
    
    public func dijkstraShortestPath(from: Node, to: Node) -> [Node]? {
        
        guard from != to else {
            return []
        }
        
        self.nodes.forEach { (node) in
            
            guard node != from else {
                from.pathLengthFromStart = 0
                from.pathNodesFromStart = [from]
                return
            }
            
            node.clearCache()
            
        }
        
        var nodeHeap = Heap(self.nodes) { $0.pathLengthFromStart < $1.pathLengthFromStart }
        
        while let minNode = nodeHeap.pop() {
            
            guard minNode != to else {
                return minNode.pathNodesFromStart.isEmpty ? nil : minNode.pathNodesFromStart
            }
            
            for (neighbor, weight) in minNode.neighbors {
                
                if nodeHeap.contains(neighbor) {
                    
                    if minNode.pathLengthFromStart + weight < neighbor.pathLengthFromStart {
                        neighbor.pathLengthFromStart = minNode.pathLengthFromStart + weight
                        neighbor.pathNodesFromStart = [neighbor] + minNode.pathNodesFromStart
                        nodeHeap.decreaseKey(for: neighbor)
                    }
                    
                }
                
            }
            
        }
        
        return nil
        
    }
    
    public func hasRouteBetween(start: Node, end: Node) -> Bool {
        
        guard start != end else {
            return true
        }
        
        var visitedNodes: Set<Node> = []
        var queue: [(node: Node, weight: Double)] = [(start, 0)]
        
        while !queue.isEmpty {
            
            let dequeued = queue.removeFirst()
            
            if !visitedNodes.contains(dequeued.node) {
                
                visitedNodes.insert(dequeued.node)
                
                if dequeued.node == end {
                    return true
                }
                
                dequeued.node.neighbors.forEach({ queue.append($0) })
                
            }
            
        }
        
        return false
        
    }
    
    public func dfs(node: Node, _ process: @escaping (Node) -> Void) {
        
        var visitedNodes: Set<Node> = []
        self.depthFirstSearch(node: node, process: process, visitedNodes: &visitedNodes)
        
    }
    
    private func depthFirstSearch(node: Node, process: @escaping (Node) -> Void, visitedNodes: inout Set<Node>) {
        
        process(node)
        
        visitedNodes.insert(node)
        
        node.neighbors.forEach { (neighbor, weight) in
            
            if !visitedNodes.contains(neighbor) {
                self.depthFirstSearch(node: neighbor, process: process, visitedNodes: &visitedNodes)
            }
            
        }
        
    }
    
    public func minimumSpanningTree(source: Node) {
        
        var visitedNodes: Set<Node> = []
        var queue = [source]
        
        while !queue.isEmpty {
            
            let dequeued = queue.removeFirst()
            
            if !visitedNodes.contains(dequeued) {
                
                visitedNodes.insert(dequeued)
                var newNeighbors: [(Node, Double)] = []
                
                for i in 0 ..< dequeued.neighbors.count {
                    
                    if !visitedNodes.contains(dequeued.neighbors[i].node) {
                        newNeighbors.append(dequeued.neighbors[i])
                        queue.append(dequeued.neighbors[i].node)
                    }
                    
                }
                
                dequeued.neighbors = newNeighbors
                
            }
            
        }
        
    }
    
    public func connectedComponents() -> Int {
        
        guard !nodes.isEmpty else {
            return 0
        }
        
        var count = 0
        var unvisitedNodes = Set(nodes)
        
        while let unvisited = unvisitedNodes.popFirst() {
            
            count += 1
            
            dfs(node: unvisited) { (node) in
                unvisitedNodes.remove(node)
            }
            
        }
        
        return count
        
    }
    
}
