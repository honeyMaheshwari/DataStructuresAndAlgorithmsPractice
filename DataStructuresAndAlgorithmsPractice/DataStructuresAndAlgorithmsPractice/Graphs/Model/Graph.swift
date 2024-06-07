//
//  Graph.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 07/06/24.
//

import Foundation

class Graph {
    
    var vertices: Int = 0
    var adjacency: [[Int]] = []
    
    private init(vertices: Int, adjacency: [[Int]]) {
        self.vertices = vertices
        self.adjacency = adjacency
    }
    
    init(vertices: Int) {
        self.vertices = vertices
        for _ in 0 ..< vertices {
            let array = [Int]()
            adjacency.append(array)
        }
    }
    
    func addEdge(vertices: Int, weights: Int) {
        adjacency[vertices].append(weights)
    }
    
    func breadthFirstSearch(start: Int) -> [Int] {
        var result: [Int] = []
    
        // Mark all vertices as not visited
        var visited: [Bool] = adjacency.map({ _ in false })
        
        // Create BreadthFirstSearch Queue
        let queue: Queue<Int> = Queue<Int>()
        
        // Mark first vertex as visited and enqueue
        visited[start] = true
        print("Starting at \(start)")
        queue.enqueue(start)
        result.append(start)
        
        while queue.count > 0 {
            let current = queue.dequeue()!
            print("De-queueing \(current)")
            
            // Get all the adjacent vertices of the current vertex
            // If adjacent has not being visited, mark visited and enqueue
            
            for weight in adjacency[current] {
                print("weight -> \(weight) at current -> \(current)")
                let visitedStatus = visited[weight]
                print("visitedStatus -> \(visitedStatus)")
                if !visitedStatus {
                    visited[weight] = true
                    print("Queuing \(weight)")
                    queue.enqueue(weight)
                    result.append(weight)
                }
            }
        }
        
        return result
    }
    
    func depthFirstSearch(start: Int) -> [Int] {
        var result: [Int] = []
        
        // Mark all vertices as not visited
//        var visited: [Bool] = adjacency.map({ _ in false })
        var visited: [Bool] = Array(repeating: false, count: adjacency.count)
        
        let stack: Stack<Int> = Stack<Int>()
        
        visited[start] = true
        print("Starting at \(start)")
        stack.push(start)
        
        while stack.count > 0 {
            let current = stack.pop()!
            print("Poping \(current)")
            result.append(current)
            
            for weight in adjacency[current] {
                print("weight -> \(weight) at current -> \(current)")
                let visitedStatus = visited[weight]
                print("visitedStatus -> \(visitedStatus)")
                if !visitedStatus {
                    visited[weight] = true
                    stack.push(weight)
                    print("Pushing \(weight)")
                }
            }
        }
        
        return result
    }
    
}
