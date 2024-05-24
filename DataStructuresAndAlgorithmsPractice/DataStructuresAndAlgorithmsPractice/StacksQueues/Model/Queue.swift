//
//  Queue.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

/*
 First-in first-out (FIFO)
 enqueue O(1) dequeue O(n)
 */

class Queue<T> {
    
    private var array: [T] = []
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
    
    func enqueue(_ item: T) {
        array.append(item)
    }
    
    func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
    
}

struct QueueStruct<T> {
    
    private var array: [T] = []
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
    
    mutating func enqueue(_ item: T) {
        array.append(item)
    }
    
    mutating func dequeue() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
    
}
