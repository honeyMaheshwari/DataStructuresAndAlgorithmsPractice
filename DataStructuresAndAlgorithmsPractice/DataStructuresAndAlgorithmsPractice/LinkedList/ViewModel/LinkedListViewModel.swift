//
//  LinkedListViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari on 02/01/23.
//

import Foundation

class LinkedListViewModel: NSObject {
    
    func checkLinkedList() {
        let linkList = LinkList()
        linkList.addFront(4)
        linkList.addFront(3)
        linkList.addFront(2)
        linkList.addFront(1)
        linkList.printLinkedList()
        
        linkList.addBack(5)
        linkList.printLinkedList()
        
        if let first = linkList.getFirst() {
            print("first = \(first)")
        }
        if let last = linkList.getLast() {
            print("last = \(last)")
        }
        
        linkList.insert(at: 2, data: 6)
        linkList.printLinkedList()
        
        linkList.deleteFirst()
        linkList.printLinkedList()
        
        linkList.deleteLast()
        linkList.printLinkedList()
        
        linkList.delete(at: 1)
        linkList.printLinkedList()
    }
    
    func calculateLengthOfLinkedList() {
        let node6 = Node(data: 6)
        let node5 = Node(data: 5, next: node6)
        let node4 = Node(data: 4, next: node5)
        let node3 = Node(data: 3, next: node4)
        let node2 = Node(data: 2, next: node3)
        let node1 = Node(data: 1, next: node2)
        
        let nilLength = length(head: nil)
        print(nilLength) // 0
        
        let lengthFromFirst = length(head: node1)
        print(lengthFromFirst) // 6
    }
    
    func length(head: Node?) -> Int {
        if head == nil {
            return 0
        }
        
        var length = 0
        var current = head
        while current != nil {
            length += 1
            current = current?.next
        }
        return length
    }
    
    func printLinkedList(_ head: Node?) {
        if head == nil { return }
        var result: [Int] = []
        var node: Node? = head
        result.append(head!.data)
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        print(result)
    }
}

extension LinkedListViewModel {
    
    /*
     Finding the merge point of two lists.

     Given pointers to the head nodes of 2 linked list that merge together at some point, find the node where the two lists merge. The merge point is where both lists points to the same node, i.e. they reference the same location. It is guaranteed that the 2 head nodes will be different, and neither will be NULL. If the list share a common node, return that node's data value.
     
     Note: After the merge point, both lists will share the same node pointers.
     */
    
    func questionFindMerge() -> (headA: Node, headB: Node) {
        let node6 = Node(data: 6)
        let node5 = Node(data: 5, next: node6)
        let node4 = Node(data: 4, next: node5)
        let node3 = Node(data: 3, next: node4)
        let node2 = Node(data: 2, next: node3)
        let node1 = Node(data: 1, next: node2)
        
        let node11 = Node(data: 11, next: node4)
        let node10 = Node(data: 10, next: node11)
        
        printLinkedList(node1)
        printLinkedList(node10)
        return (headA: node1, headB: node10)
    }
    
    func findMergeWithBruteForce(headA: Node, headB: Node) -> Int? { // O(m*n) -> O(n^2)
        let lengthOfA = length(head: headA) // O(m)
        let lengthOfB = length(head: headB) // O(n)
        
        var currentA: Node? = headA
        for _ in 0 ..< lengthOfA { // O(m)
            var currentB: Node? = headB
            let valueA = currentA?.data
            for _ in 0 ..< lengthOfB {  // O(n)
                let valueB = currentB?.data
                if valueA == valueB {
                    return valueA
                }
                currentB = currentB?.next
            }
            currentA = currentA?.next
        }
        return nil
    }
    
    func findMergeWithSpaceTime(headA: Node, headB: Node) -> Int? { // O(2m+2n) -> O(n)
        let lengthOfA = length(head: headA) // O(m)
        let lengthOfB = length(head: headB) // O(n)
        
        var dict: [Int?: Bool] = [:]
        var currentB: Node? = headB
        for _ in 0 ..< lengthOfB {  // O(n)
            let valueB = currentB?.data
            dict[valueB] = true
            currentB = currentB?.next
        }
        
        var currentA: Node? = headA
        for _ in 0 ..< lengthOfA { // O(m)
            let valueA = currentA?.data
            if dict[valueA] == true {
                return valueA
            }
            currentA = currentA?.next
        }
        return nil
    }
    
    func findMergeWithInsignt(headA: Node, headB: Node) -> Int? { // O(n)
        let lengthOfA = length(head: headA) // O(m)
        let lengthOfB = length(head: headB) // O(n)
        
        var currentA: Node? = headA
        var currentB: Node? = headB
        
        if lengthOfB > lengthOfA {
            swap(&currentA, &currentB)
        }
        
        let difference = abs(lengthOfA - lengthOfB)
        for _ in 1...difference { // O(n)
            currentA = currentA?.next
        }
        
        for _ in 0 ..< lengthOfB { // O(n)
            let valueA = currentA?.data
            let valueB = currentB?.data
            if valueA == valueB {
                return valueA
            }
            currentA = currentA?.next
            currentB = currentB?.next
        }
        return nil
    }
    
}

extension LinkedListViewModel {
    /*
     Detect A Cycle in Linked List
     
     A linked list is said to contain a cycle if aby node is visited more than once while traversing the list.
     For Example:- In the following graph there is a cycle formed when node 5 points back to node 3.
     
           4
         /   \
    1 2 3     5
         \___/
     
     Question Reference:- https://www.hackerrank.com/challenges/ctci-linked-list-cycle/problem
     Answer Reference:- https://en.wikipedia.org/wiki/Cycle_detection#Floyd's_Tortoise_and_Hare
     */
    
    func questionDetectACycle() -> Node {
        let node5 = Node(data: 5)
        let node4 = Node(data: 4)
        let node3 = Node(data: 3)
        let node2 = Node(data: 2)
        let head = Node(data: 1)

        head.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        node5.next = node3
        return head
    }
    
    func hasCycleWithTortoiseAndHare(first: Node) -> Bool {
        var slow: Node? = first
        var fast: Node? = first
        while fast != nil && fast!.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow?.data == fast?.data {
                return true
            }
        }
        return false
    }
    
}
