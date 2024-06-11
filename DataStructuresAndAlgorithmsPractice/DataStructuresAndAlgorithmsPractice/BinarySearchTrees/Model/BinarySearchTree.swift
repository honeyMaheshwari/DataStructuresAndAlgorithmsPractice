//
//  BinarySearchTree.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 01/06/24.
//

import Foundation

class BinarySearchTree {
    
    var root: BinarySearchTreeNode?
    
    init(root: BinarySearchTreeNode? = nil) {
        self.root = root
    }
    
    func insert(key: Int) {
        root = insertItem(node: root, key: key)
    }
        
    func find(key: Int) -> Int? {
        guard let root = self.root else { return nil }
        guard let node = find(node: root, key: key) else { return nil }
        return node.key
    }
    
    func delete(key: Int) {
        guard let _ = self.root else { return }
        root = delete(node: &root, key: key)
    }
    
    func findMinimum() -> Int {
        guard let node = root else { return 0 }
        return findMinimum(node: node).key
    }
    
    func findMaximum() -> Int {
        guard let node = root else { return 0 }
        return findMaximum(node: node).key
    }

    func prettyPrint() {
        guard let root = self.root else { return }
        printTree(prefix: "", n: root, isLeft: false)
    }
    
}

extension BinarySearchTree {
    
    func printInOrderTravseral() {
        inOrderTraversal(node: root)
    }
    
    private func inOrderTraversal(node: BinarySearchTreeNode?) {
        guard let node = node else { return }
        inOrderTraversal(node: node.left)
        print(node.key)
        inOrderTraversal(node: node.right)
    }
    
    func printPreOrderTravseral() {
        preOrderTraversal(node: root)
    }
    
    func preOrderTraversal(node: BinarySearchTreeNode?) {
        guard let node = node else { return }
        print(node.key)
        preOrderTraversal(node: node.left)
        preOrderTraversal(node: node.right)
    }
    
    func printPostOrderTravseral() {
        postOrderTraversal(node: root)
    }
    
    func postOrderTraversal(node: BinarySearchTreeNode?) {
        guard let node = node else { return }
        postOrderTraversal(node: node.left)
        postOrderTraversal(node: node.right)
        print(node.key)
    }
}


extension BinarySearchTree {
    
    private func insertItem(node: BinarySearchTreeNode?, key: Int) -> BinarySearchTreeNode {
        guard let node = node else {
            let newNode = BinarySearchTreeNode(key: key)
            return newNode
        }
        
        if key < node.key {
            node.left = insertItem(node: node.left, key: key)
        } else if key > node.key {
            node.right = insertItem(node: node.right, key: key)
        }
        
        // If we get here we have have hit the bottom of our tree with a duplicate.
        // Since duplicates are not allowed in BSTs, simply ignore the duplicate,
        // and return our fully constructed tree. We are done!
        return node
    }
    
    private func find(node: BinarySearchTreeNode?, key: Int) -> BinarySearchTreeNode? {
        guard let node = node else {
            return nil
        }
        
        if node.key == key {
            return node
        } else if node.key < key {
            return find(node: node.left, key: key)
        } else if node.key > key {
            return find(node: node.right, key: key)
        }
        return nil
    }
    
    private func findMinimum(node: BinarySearchTreeNode) -> BinarySearchTreeNode {
        return node.minimum
    }
    
    private func findMaximum(node: BinarySearchTreeNode) -> BinarySearchTreeNode {
        return node.maximum
    }
    
    private func delete(node: inout BinarySearchTreeNode?, key: Int) -> BinarySearchTreeNode? {
        guard let node = node else { return nil }
        
        if key < node.key {
            node.left = delete(node: &node.left, key: key)
        } else if key > node.key {
            node.right = delete(node: &node.right, key: key)
        } else {
            // Fount the node, this is the one which we want to delete
            if node.left == nil, node.right == nil { // Case 1: No Child
                return nil
            } else if node.left == nil { // Case 2: One child
                return node.right
            } else if node.right == nil { // Case 2: One child
                return node.left
            } else { // Case 3: Two children (right and left both are not nil)
                
                // Find the minimum node on the right (or could also find max on the left)
                let minRight = findMinimum(node: node.right!)
                // Duplicate it by copying its value here
                node.key = minRight.key
                // Now go ahead and delete the node we just duplicated (same key)
                node.right = delete(node: &node.right, key: node.key)
            }
        }
        return node
    }
    
    func printTree(prefix: String, n: BinarySearchTreeNode, isLeft: Bool) {
        print(prefix, (isLeft ? "|-- " : "\\-- "), n.key)
        if n.left != nil {
            printTree(prefix: "\(prefix) \(isLeft ? "|   " : "   ") ", n: n.left!, isLeft: true)
        }
        if n.right != nil {
            printTree(prefix: "\(prefix) \(isLeft ? "|   " : "   ") ", n: n.right!, isLeft: false)
        }
    }
    
}

extension BinarySearchTree {
    
    func findLowestCommonAncestor(for node: BinarySearchTreeNode?, value1: Int, value2: Int) -> BinarySearchTreeNode? {
        if node == nil { return nil }
        // If both value1 and value2 are smaller than root, then LCA lies in left
        if node!.key > value1 && node!.key > value2 {
            return findLowestCommonAncestor(for: node?.left, value1: value1, value2: value2)
        }
        
        // If both value1 and value2 are larger than root, then LCA lies in right
        if node!.key < value1 && node!.key < value2 {
            return findLowestCommonAncestor(for: node?.right, value1: value1, value2: value2)
        }
        
        // Else we are at the node which is the LCA
        return node
    }
    
}


extension BinarySearchTree {
    
    /*
     // Challenge: T1 is a large binary tree and T2 is a smaller one. Write an algorithm to determine if T2 is a subtree of T1.
     
     Root
                    5
                  3   7
                 2 4 6 8
     
     Subtree
                    7
                   6 8
     
     */
    func isSubTree(_ tree: BinarySearchTreeNode, _ subTree: BinarySearchTreeNode) -> Bool {
        /*
        if tree.key == subTree.key {
            return tree.left?.key == subTree.left?.key && tree.right?.key == subTree.right?.key
        } else if tree.key > subTree.key, tree.left != nil {
            return isSubTree(tree.left!, subTree)
        } else if tree.key < subTree.key, tree.right != nil{
            return isSubTree(tree.right!, subTree)
        }
         */
        
        let rootStringRepresentation = treeStringRepresentation(node: tree)
        let subTreeStringRepresentation = treeStringRepresentation(node: subTree)
        return rootStringRepresentation.contains(subTreeStringRepresentation)
    }
    
    private func treeStringRepresentation(node: BinarySearchTreeNode) -> String {
        var string = ""
        preOrderTraversalString(node: node, result: &string)
        return string
    }
    
    private func preOrderTraversalString(node: BinarySearchTreeNode?, result: inout String) {
        guard let node = node else { return }
        result.append("\(node.key)")
        preOrderTraversalString(node: node.left, result: &result)
        preOrderTraversalString(node: node.right, result: &result)
    }
    
}
