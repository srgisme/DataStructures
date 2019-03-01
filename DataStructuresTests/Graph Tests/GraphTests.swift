//
//  DataStructuresTests.swift
//  DataStructuresTests
//
//  Created by Scott Gorden on 1/8/19.
//  Copyright © 2019 Scott Gorden. All rights reserved.
//

import XCTest
@testable import DataStructures

class GraphTests: XCTestCase {
    
    var graph = Graph<String>(nodes: [])
    weak var from: Graph<String>.Node!
    weak var to: Graph<String>.Node!
    
    override func setUp() {
        
        let a = Graph.Node(data: "A")
        let b = Graph.Node(data: "B")
        let c = Graph.Node(data: "C")
        let d = Graph.Node(data: "D")
        let e = Graph.Node(data: "E")
        
        a.neighbors = [(b, 3), (d, 6), (e, 3)]
        b.neighbors = [(a, 3), (c, 10)]
        c.neighbors = [(b, 10), (d, 3), (e, 4.5)]
        d.neighbors = [(c, 3), (a, 6)]
        e.neighbors = [(c, 4.5), (a, 3)]
        
        self.graph = Graph(nodes: [a, b, c, d, e])
        self.from = a
        self.to = c
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDijkstra() {
        
        let shortestPath = graph.dijkstraShortestPath(from: to, to: from)
        print(shortestPath ?? "no shortest path found")
        XCTAssert(shortestPath != nil, "could not properly determine the shortest path.")
        
    }
    
    func testDFS() {
        
        var allNodes: [String] = []
        
        self.graph.dfs(node: self.from) { (node) in
            allNodes.append(node.data)
        }
        
        XCTAssert(allNodes == ["A", "B", "C", "D", "E"], "allNodes = \(allNodes)")
        
    }

    func testMinimumSpanningTree() {
        
        self.graph.minimumSpanningTree(source: self.from)
        
        var nodeOrder: [String] = []
        self.graph.dfs(node: self.from) { (node) in
            nodeOrder.append(node.data)
        }
        
        XCTAssert(nodeOrder == ["A", "B", "C", "D", "E"], "node order actually is \(nodeOrder).")
        
    }

}
