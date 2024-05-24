//
//  Stack.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

/*
 Last-in first-out (LIFO)
 Push and pop are O(1) operations.
 */

class Stack<T> {
    
    private var array: [T] = []
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
    
    func push(_ item: T) {
        array.append(item)
    }
    
    func pop() -> T? {
        return array.removeLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
}

struct StackStruct<T> {
    
    private var array: [T] = []
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
    
    mutating func push(_ item: T) {
        array.append(item)
    }
    
    mutating func pop() -> T? {
        return array.removeLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
}
