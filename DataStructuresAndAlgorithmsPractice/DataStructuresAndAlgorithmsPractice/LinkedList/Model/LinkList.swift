//
//  LinkList.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari on 02/01/23.
//

import Foundation

class LinkList {
    
    private var head: Node?
    
    init(head: Node? = nil) {
        self.head = head
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func addFront(_ data: Int) { // O(1)
        let newNode = Node(data: data)
        newNode.next = head
        head = newNode
    }
    
    func getFirst() -> Int? { // O(1)
        return head?.data
    }
    
    func addBack(_ data: Int) { // O(n)
        let newNode = Node(data: data)
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        node.next = newNode
    }
    
    func getLast() -> Int? { // O(n)
        if head == nil {
            return nil
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        return node.data
    }
    
    func insert(at position: Int, data: Int) { // O(n)
        if position == 0 {
            addFront(data)
            return
        }
        
        let newNode = Node(data: data)
        var currentNode = head
        
        for _ in 0 ..< (position - 1) {
            currentNode = currentNode?.next
        }
        newNode.next = currentNode?.next
        currentNode?.next = newNode
    }
    
    func deleteFirst() { // O(1)
        head = head?.next
    }
    
    func deleteLast() { // O(n)
        var nextNode: Node? = head
        var previousNode: Node?
        while nextNode?.next != nil {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nil
    }
    
    func delete(at position: Int) { // O(n)
        if position == 0 {
            deleteFirst()
            return
        }
        var nextNode: Node? = head
        var previousNode: Node?
        for _ in 0 ..< position {
            previousNode = nextNode
            nextNode = nextNode?.next
        }
        previousNode?.next = nextNode?.next
    }
    
    func clear() {
        var currentNode: Node?
        var nextNode: Node? = head
        while nextNode?.next != nil {
            currentNode = nextNode
            nextNode = nextNode?.next
            currentNode?.next = nil
        }
        head = nil
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
    
    // Challenge: Write a method that removes any duplicates from our Linked List.
    func removeDuplictates() {
        var currentNode = head
        var previousNode: Node?
        var uniques = Set<Int>()
        
        while currentNode != nil {
            if uniques.contains(currentNode!.data) {
                previousNode?.next = currentNode?.next
            } else {
                uniques.insert(currentNode!.data)
                previousNode = currentNode
            }
            currentNode = currentNode?.next
        }
        
        
        /*
        var node = head
        var dict: [Int: Int] = [:]
        var previousNode: Node?
        
        while node?.next != nil {
            if let data = node?.data {
                if dict[data] != nil {
                    previousNode?.next = node?.next
                } else {
                    dict[data] = 1
                    previousNode = node
                }
            }
            node = node?.next
        }
        
        if let data = node?.data, dict[data] != nil {
            previousNode?.next = nil
        }
         */
    }
    
}
