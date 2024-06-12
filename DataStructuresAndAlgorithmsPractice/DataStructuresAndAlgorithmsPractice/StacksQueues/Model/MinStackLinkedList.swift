//
//  MinStack.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 12/06/24.
//

import Foundation

class MinStackLinkedList {
    
    class Node {
        var data, min: Int
        var next: Node?
        
        init(data: Int, min: Int, next: Node? = nil) {
            self.data = data
            self.min = min
            self.next = next
        }
    }
    
    private var head: Node?
    
    func push(_ data: Int) {
        var currentMin = data
        
        if head != nil {
            let min = min()!
            currentMin = Swift.min(currentMin, min)
        }
        
        let newNode = Node(data: data, min: currentMin)
        newNode.next = head
        head = newNode
    }
    
    func pop() -> Int? {
        let data = head?.data
        head = head?.next
        return data
    }
    
    func min() -> Int? {
        return head?.min
    }
    
    func printLinkedList() {
        guard let head = self.head else { return }
        var result: [Int] = []
        var node: Node? = head
        result.append(head.data)
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        print(result)
    }
    
}


class MinStackWithArray {
    
    private var stack: [Int] = []
    private var minStack: [Int] = []
    
    init(stack: [Int] = [], minStack: [Int] = []) {
        self.stack = stack
        self.minStack = minStack
    }
    
    func push(_ item: Int) {
        stack.append(item)
        if minStack.isEmpty || item <= minStack.last! {
            minStack.append(item)
        }
    }
    
    func pop() -> Int? {
        guard !stack.isEmpty else {
            return nil
        }
        let item = stack.removeLast()
        if item == minStack.last {
            minStack.removeLast()
        }
        return item
    }
    
    func peek() -> Int? {
        stack.last
    }
    
    func min() -> Int? {
        minStack.last
    }
    
    // Print all elements in the stack
    func printStack() {
        let string = stack.map({ "\($0)" }).joined(separator: ", ")
        print(string)
    }
}
