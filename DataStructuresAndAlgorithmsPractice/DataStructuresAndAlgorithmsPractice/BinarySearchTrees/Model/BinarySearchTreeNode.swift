//
//  BinarySearchTreeNode.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 01/06/24.
//

import Foundation

class BinarySearchTreeNode {
    var key: Int = 0
    var left: BinarySearchTreeNode?
    var right: BinarySearchTreeNode?
    
    init(key: Int, left: BinarySearchTreeNode? = nil, right: BinarySearchTreeNode? = nil) {
        self.key = key
        self.left = left
        self.right = right
    }
    
    var minimum: BinarySearchTreeNode {
        if let left = self.left {
            return left.minimum
        } else {
            return self
        }
    }
    
    var maximum: BinarySearchTreeNode {
        if let right = self.right {
            return right.maximum
        } else {
            return self
        }
    }
    
    func height() -> Int {
        if isLeaf {
            return 0
        } else {
            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
        }
    }
    
    var isLeaf: Bool {
        return left == nil && right == nil
    }
}
