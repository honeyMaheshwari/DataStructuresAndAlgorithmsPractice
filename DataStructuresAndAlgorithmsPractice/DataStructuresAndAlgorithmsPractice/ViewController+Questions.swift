//
//  ViewController+Questions.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 10/06/24.
//

import Foundation

extension ViewController {
    
    func practiceQuestions(viewModel: QuestionsViewModel) {
        question1(viewModel: viewModel)
        
        question2(viewModel: viewModel)

        question3(viewModel: viewModel)
        
        question4(viewModel: viewModel)
        
        question5(viewModel: viewModel)
        
        question6()
        
        question7()
        
        question8()
    }
    
    func question1(viewModel: QuestionsViewModel) {
        print("----- Question 1: Given a string, see if you can detect whether it contains only unique chars. -----")
        var input: String = "ab"
        print("input -> \(input), isUnique -> \(viewModel.isUnique(input)), expected -> true")
        input = "aa"
        print("input -> \(input), isUnique -> \(viewModel.isUnique(input)), expected -> false")
        input = "abcdefghijklmnopqrstuvwxyz"
        print("input -> \(input), isUnique -> \(viewModel.isUnique(input)), expected -> true")
        print("----- xxx -----\n")
    }
    
    func question2(viewModel: QuestionsViewModel) {
        print("----- Question 2: Given two strings, check if one is a permutation of the other. -----")
        var input1: String = "abc"
        var input2: String = "cba"
        print("text to compare -> \(input1) & \(input2), is permutation -> \(viewModel.isPermutation(input1, input2)), expected -> true")
        input1 = "abc"
        input2 = "xyz"
        print("text to compare -> \(input1) & \(input2), is permutation -> \(viewModel.isPermutation(input1, input2)), expected -> false")
        print("----- xxx -----\n")
    }
    
    func question3(viewModel: QuestionsViewModel) {
        print("----- Question 3: See if you can replaces all the spaces in a a string with the ASCII symbol for space '%20'. Assume you are given the length of the final string. Hint: Use array of char[]. -----")
        var input: String = "My Home Page    "
        print("input -> '\(input)', is urlify -> \(viewModel.urlify(input, length: 16 /*input.count*/)), expected -> My%20Home%20Page")
        input = "Mr John Smith"
        print("input -> '\(input)', is urlify -> \(viewModel.urlify(input, length: 13 /*input.count*/)), expected -> Mr%20John%20Smith")
        print("----- xxx -----\n")
    }
 
    func question4(viewModel: QuestionsViewModel) {
        print("----- Question 4: Given two strings, write a function to check if they are one or zero edits away. -----")
        var input1: String = "pale"
        var input2: String = "paleXXXX"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> false")
        
        input1 = "pale"
        input2 = "ple"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> true")
        
        input1 = "pales"
        input2 = "pale"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> true")
        
        input1 = "pale"
        input2 = "bale"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> true")
        
        input1 = "pale"
        input2 = "bake"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> false")
        
        input1 = "pale"
        input2 = "bakeerer"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> false")

        input1 = "pale"
        input2 = "pale"
        print("text to compare -> \(input1) & \(input2), one or zero edits away -> \(viewModel.oneAway(input1, input2)), expected -> true")
        print("----- xxx -----\n")
    }
    
    
    func question5(viewModel: QuestionsViewModel) {
        print("----- Question 5: Give a string with repeating characters (i.e. aaabb) write an algorithm that will compress the string down to the character, followed by the number of times it appears in the string (i.e a3b2). If the compressed string is not smaller than original, return original. -----")
        
        var input: String = "aaabb"
        print("input -> '\(input)', compressed string -> \(viewModel.compress(input)), expected -> a3b2")
        
        input = "aabb"
        print("input -> '\(input)', compressed string -> \(viewModel.compress(input)), expected -> aabb")
        
        input = "ab"
        print("input -> '\(input)', compressed string -> \(viewModel.compress(input)), expected -> ab")
        
        input = "abc"
        print("input -> '\(input)', compressed string -> \(viewModel.compress(input)), expected -> abc")
        
        input = "zzz"
        print("input -> '\(input)', compressed string -> \(viewModel.compress(input)), expected -> z3")
        
        input = "aabbaabb"
        print("input -> '\(input)', compressed string -> \(viewModel.compress(input)), expected -> aabbaabb")
        
        print("----- xxx -----\n")
    }
    
    func question6() {
        print("----- Question 6: Write a method that removes any duplicates from our Linked List. -----")
        
        func input2() -> Node {
            let node4 = Node(data: 4, next: nil)
            let duplicateNode = Node(data: 1, next: node4)
            let node3 = Node(data: 3, next: duplicateNode)
            let node2 = Node(data: 2, next: node3)
            let node1 = Node(data: 1, next: node2)
            return node1
        }
         
        func input1() -> Node {
            let node3 = Node(data: 3)
            let node2 = Node(data: 2, next: node3)
            let node1 = Node(data: 1, next: node2)
            node3.next = Node(data: 1)
            return node1
        }
        
        var inputLinkList = LinkList(head: input1())
        print("input: ")
        inputLinkList.printLinkedList()
        inputLinkList.removeDuplictates()
        print("output: ")
        inputLinkList.printLinkedList()
        
        inputLinkList = LinkList(head: input2())
        print("input: ")
        inputLinkList.printLinkedList()
        inputLinkList.removeDuplictates()
        print("output: ")
        inputLinkList.printLinkedList()
        
        print("----- xxx -----\n")
    }
    
    func question7() {
        print("----- Question 6: Write a method that removes any duplicates from our Linked List. -----")
        
        let root = BinarySearchTreeNode(key: 5)
        root.left = BinarySearchTreeNode(key: 3)
        root.right = BinarySearchTreeNode(key: 7)
        root.left?.left = BinarySearchTreeNode(key: 2)
        root.left?.right = BinarySearchTreeNode(key: 4)
        root.right?.left = BinarySearchTreeNode(key: 6)
        root.right?.right = BinarySearchTreeNode(key: 8)
        
        let binarySearchTree = BinarySearchTree(root: root)
        
        let subTree = BinarySearchTreeNode(key: 7)
        subTree.left = BinarySearchTreeNode(key: 6)
        subTree.right = BinarySearchTreeNode(key: 8)
        
        binarySearchTree.printTree(prefix: "input tree: ", n: root, isLeft: false)
        print("")
        binarySearchTree.printTree(prefix: "input sub-tree: ", n: subTree, isLeft: false)
        let status = binarySearchTree.isSubTree(root, subTree)
        print("\n", "output -> \(status), expected -> true")
        print("----- xxx -----\n")
    }
    
    // Challenge: Design a stack which, in addition to push and pop, has a function 'min' which returns the minimum element? Push, pop and min should all operate in O(1) time.
    /*
     Stacks can be implemented as either arrays or via a linked list. If we do it with a linked list, we can store the current minimum value with each new node as we pop it onto the list.
     That way we have a running record of what the current min was, and the time the node was added.
     */
    func question8() {
        print("----- Design a stack which, in addition to push and pop, has a function 'min' which returns the minimum element? Push, pop and min should all operate in O(1) time. -----")
        let stack = MinStackLinkedList()
        stack.push(5)
        stack.push(6)
        stack.push(3)
        stack.push(7)
        print("input: ")
        stack.printLinkedList()
        var min = stack.min()       // 3
        print("current min -> \(min ?? 0)")
        var pop = stack.pop()
        print("pop value from stack -> \(pop ?? 0)")
        min = stack.min()       // 3
        print("current min -> \(min ?? 0)")
        pop = stack.pop()
        print("pop value from stack -> \(pop ?? 0)")
        min = stack.min()       // 5
        print("current min -> \(min ?? 0)")
        
        print("\n\n", "new inputs", "\n")
        
        let minStackWithArray = MinStackWithArray()
        minStackWithArray.push(3)
        minStackWithArray.push(5)
        print("input: ")
        minStackWithArray.printStack()
        min = minStackWithArray.min()
        print("currnet min: \(min ?? 0)") // 3
        minStackWithArray.push(2)
        minStackWithArray.push(1)
        min = minStackWithArray.min()
        print("currnet min: \(min ?? 0)") // 1
        pop = minStackWithArray.pop()
        print("pop value from stack -> \(pop ?? 0)")
        min = minStackWithArray.min()
        print("currnet min: \(min ?? 0)") // 2
        pop = minStackWithArray.pop()
        print("pop value from stack -> \(pop ?? 0)")
        min = minStackWithArray.min()
        print("currnet min: \(min ?? 0)") // 3
        
        print("----- xxx -----\n")
    }
    
}
