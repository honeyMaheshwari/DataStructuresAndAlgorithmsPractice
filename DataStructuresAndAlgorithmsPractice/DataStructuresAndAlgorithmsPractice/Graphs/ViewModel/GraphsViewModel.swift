//
//  GraphsViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 07/06/24.
//

import Foundation

class GraphsViewModel {
    
    /*
     Graph
                   ┌────┐           ┌────┐      ┌────┐
     ┌────────────▶│ 5  │◀──────────▶ 2  │◀─────▶ 7  │
     │             └────┘           └────┘      └────┘
     │                ▲
     │                └─────────┐
     │                          │
     ▼                          ▼
     ┌────┐          ┌────┐     ┌────┐
     │ 1  │◀────────▶│ 0  │◀────▶ 3  │
     └────┘          └────┘     └────┘
     ▲               │
     ▼               ▼
     ┌────┐          ┌────┐
     │ 4  │◀─────────▶ 6  │
     └────┘          └────┘
     
     */
    func performBreadthFirstSearchInGraph() {
        print("----- Understanding BreadthFirstSearch In Graph -----")
        
        let graph = Graph(vertices: 8)
        graph.addEdge(vertices: 0, weights: 1)
        graph.addEdge(vertices: 1, weights: 4)
        graph.addEdge(vertices: 4, weights: 6)
        graph.addEdge(vertices: 6, weights: 0)
        graph.addEdge(vertices: 1, weights: 5)
        graph.addEdge(vertices: 5, weights: 3)
        graph.addEdge(vertices: 3, weights: 0)
        graph.addEdge(vertices: 5, weights: 2)
        graph.addEdge(vertices: 2, weights: 7)
        
        let result = graph.breadthFirstSearch(start: 0)
        print("output -> \(result)")
        print("----- xxx -----\n")
    }
    
    func performDepthFirstSearchInGraph() {
        print("----- Understanding DepthFirstSearch In Graph -----")
        
        let graph = Graph(vertices: 8)
        graph.addEdge(vertices: 0, weights: 1)
        graph.addEdge(vertices: 1, weights: 0)
        graph.addEdge(vertices: 1, weights: 4)
        graph.addEdge(vertices: 4, weights: 1)
        graph.addEdge(vertices: 4, weights: 6)
        graph.addEdge(vertices: 6, weights: 4)
        graph.addEdge(vertices: 6, weights: 0)
        graph.addEdge(vertices: 0, weights: 6)
        graph.addEdge(vertices: 1, weights: 5)
        graph.addEdge(vertices: 5, weights: 1)
        graph.addEdge(vertices: 5, weights: 3)
        graph.addEdge(vertices: 3, weights: 5)
        graph.addEdge(vertices: 3, weights: 0)
        graph.addEdge(vertices: 0, weights: 3)
        graph.addEdge(vertices: 5, weights: 2)
        graph.addEdge(vertices: 2, weights: 5)
        graph.addEdge(vertices: 2, weights: 7)
        graph.addEdge(vertices: 7, weights: 2)
        
        print("input graph -> \(graph.adjacency)")
        
        let result = graph.depthFirstSearch(start: 0)
        print("output -> \(result)")
        print("----- xxx -----\n")
    }
    
}


extension GraphsViewModel {
    
    /*
     You are given in undirected graph consisting of N vertices, numbered from 1 to N, and M edges.
     
     The graph is described by two arrays, A and B, both of length M. A pair A[K] and B[K] for K from 0 to M-1, describe the edge between vertex A[K] and vertex B[K].
     
     Your task is to check whether the given graph contains a path from vertex 1 to vertex N going through all the vertices, one-by-one, in increasing order of the numbers. All connections on the path should be direct.
     
     Write a function, that given an integer N and two arrays A and B of M integers each, returns true if there exists a path from vertex 1 to N going through all vertices, one-by-one, in increasing order, or false other wise.
     
     Example 1:

              ┌─────┐
       ┌──────│  3  │──────┐
       │      └─────┘      │
       │         │         │
    ┌─────┐      │      ┌─────┐
    │  2  │      │      │  4  │
    └─────       │      └─────┘
       │      ┌─────┐      │
       └──────│  1  │──────┘
              └─────┘
     
     Given N = 4
           A = [1, 2, 4, 4, 3]
           B = [2, 3, 1, 3, 1]
           Function should return true.
     
     There is a path (1 > 2 > 3 > 4) using edges (1, 2), (2, 3), (4, 3).
     
     Example 2:

              ┌─────┐
       ┌──────│  4  │──────┐
       │      └─────┘      │
       │         │         │
    ┌─────┐      │      ┌─────┐
    │  2  │      │      │  3  │
    └─────       │      └─────┘
       │      ┌─────┐      │
       └──────│  1  │──────┘
              └─────┘
     
     Given N = 4
           A = [1, 2, 1, 3]
           B = [2, 4, 3, 4]
           Function should return false.
     
     There is no path (1 > 2 > 3 > 4) as there is no direct connection from vertex 2 to vertex 3.
     
     Example 3:

     ┌─────┐
     │  1  │
     └─────┘
                                 
    ┌─────┐    ┌─────┐    ┌─────┐   ┌─────┐    ┌─────┐
    │  2  │────┤  3  │────│  4  │───│  5  │────│  6  │
    └─────┘    └─────┘    └─────┘   └─────┘    └─────┘
     
     Given N = 6
           A = [2, 4, 5, 3]
           B = [3, 5, 6, 4]
           Function should return false.
      
     Example 4:

     ┌─────┐    ┌─────┐    ┌─────┐
     │  1  │────┤  2  │────│  3  │
     └─────┘    └─────┘    └─────┘

     Given N = 3
           A = [1, 3]
           B = [2, 2]
           Function should return true.

     
     Example 5:

     ┌─────┐    ┌─────┐    ┌─────┐
     │  2  │────┤  3  │────│  4  │
     └─────┘    └─────┘    └─────┘
     
     Given N = 3
           A = [2, 3]
           B = [3, 4]
           Function should return false.

     */
    
    //Your task is to check whether the given graph contains a path from vertex 1 to vertex N going through all the vertices,
    
    func graphContainsPathFromVertex1toVertexN(firstArray: [Int], secondArray: [Int]) -> Bool {
        if firstArray.count != secondArray.count || firstArray.count == 0 { return false }
        
        struct Edge: Equatable {
            let from, to: Int
        }
        
        var edges: [Edge] = []
        for index in 0 ..< firstArray.count {
            let edge = Edge(from: firstArray[index], to: secondArray[index])
            edges.append(edge)
        }
        
        if firstArray.count == 1 {
            let edge = Edge(from: 1, to: 2)
            let invertedEdge = Edge(from: 2, to: 1)
            return edges.contains(edge) || edges.contains(invertedEdge)
        } else if firstArray.count == 2 {
            let edge = Edge(from: 1, to: 2)
            let invertedEdge = Edge(from: 2, to: 1)
            let edgeNext = Edge(from: 2, to: 3)
            let invertedNextEdge = Edge(from: 3, to: 2)
            return (edges.contains(edge) || edges.contains(invertedEdge)) && (edges.contains(edgeNext) || edges.contains(invertedNextEdge))
        } else {
            for i in 1 ..< firstArray.count - 1 {
                let edge = Edge(from: i, to: i+1)
                let invertedEdge = Edge(from: i+1, to: i)
                if edges.contains(edge) || edges.contains(invertedEdge) {
                    continue
                } else {
                    return false
                }
            }
        }
        return true
    }
    
}
