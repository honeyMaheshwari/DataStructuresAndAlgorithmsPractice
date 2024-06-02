//
//  BinarySearchTreeViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 01/06/24.
//

import Foundation

class BinarySearchTreeViewModel {
    
    func getBinarySeacrhTree() -> BinarySearchTree {
        let bst: BinarySearchTree = BinarySearchTree()
        bst.insert(key: 5)
        bst.insert(key: 3)
        bst.insert(key: 2)
        bst.insert(key: 4)
        bst.insert(key: 7)
        bst.insert(key: 6)
        bst.insert(key: 8)
        return bst
    }
    
    func performInsertOpertaionInBinarySearchTree() {
        let bst = getBinarySeacrhTree()
        bst.prettyPrint()
    }
    
    func findMinimumNumberInBinarySearchTree() -> Int {
        let bst = getBinarySeacrhTree()
        return bst.findMinimum()
    }
    
    func findMaximumNumberInBinarySearchTree() -> Int {
        let bst = getBinarySeacrhTree()
        return bst.findMaximum()
    }
    
    func performDeleteOpertaionInBinarySearchTree() {
        print("----- Performing Delete Operation: Orignal Binary Tree -----")
        let bst = getBinarySeacrhTree()
        bst.prettyPrint()
        print("----- xxx -----\n")
        
        print("----- Deleting the node which has no child node (2) -----")
        let bst1 = getBinarySeacrhTree()
        bst1.delete(key: 2)
        bst1.prettyPrint()
        print("----- xxx -----\n")
        
        print("----- Deleting the node which has 1 child node (7 we have already removed 8) -----")
        let bst2 = getBinarySeacrhTree()
        bst2.delete(key: 8)
        bst2.delete(key: 7)
        bst2.prettyPrint()
        print("----- xxx -----\n")
        
        print("----- Deleting the node which has 2 child node (7) -----")
        let bst3 = getBinarySeacrhTree()
        bst3.delete(key: 7)
        bst3.prettyPrint()
        print("----- xxx -----\n")
    }
    
    func performTravseral() {
        print("----- Travseral on Binary Tree -----")
        let bst = getBinarySeacrhTree()
        bst.prettyPrint()
        print("----- xxx -----\n")
        
        print("----- Performing In Order Travseral on Binary Tree [(L > Root > R) 213 Good if there is inherit order smallest > largest (Left > Right)] -----")
        bst.printInOrderTravseral()
        print("----- xxx -----\n")
        
        print("----- Performing Pre Order Travseral on Binary Tree [(Root > L > R) 123 Good for copying and expression tress (Top > Bottom)] -----")
        bst.printPreOrderTravseral()
        print("----- xxx -----\n")
        
        print("----- Performing In Post Order on Binary Tree [(L > R > Root) 231 Bottom up used in deletes (Bottom > Up)] -----")
        bst.printPostOrderTravseral()
        print("----- xxx -----\n")
    }
        
}

extension BinarySearchTreeViewModel {
    
    // Question 1: Given the root node of a binary tree, determine if it is a binary search tree.
    func checkIfTheGivenNodeIsBinarySearchTree() {
        print("----- Given the root node of a binary tree, determine if it is a binary search tree. -----")
        
        let input1 = BinarySearchTreeNode(key: 4)
        input1.left = BinarySearchTreeNode(key: 2)
        input1.right = BinarySearchTreeNode(key: 6)
        input1.left?.left = BinarySearchTreeNode(key: 1)
        input1.left?.right = BinarySearchTreeNode(key: 3)
        input1.right?.left = BinarySearchTreeNode(key: 5)
        input1.right?.right = BinarySearchTreeNode(key: 7)
        
        let isInput1Valid = isBinarySearchTree(node: input1, min: nil, max: nil)
        print("Input Tree 1: \n")
        let tree1 = treeString(input1) { ("\($0.key)", $0.left, $0.right) }
        print(tree1)
        print("Is Input Tree 1 is BinarySearchTree: \(isInput1Valid)")
        print("----- xxx -----\n")
        
        let input2 = BinarySearchTreeNode(key: 3)
        input2.left = BinarySearchTreeNode(key: 2)
        input2.right = BinarySearchTreeNode(key: 4)
        input2.left?.left = BinarySearchTreeNode(key: 1)
        input2.right?.left = BinarySearchTreeNode(key: 5)
        input2.right?.right = BinarySearchTreeNode(key: 6)
        
        let isInput2Valid = isBinarySearchTree(node: input2, min: nil, max: nil)
        print("Input Tree 2: \n")
        let tree2 = treeString(input2) { ("\($0.key)", $0.left, $0.right) }
        print(tree2)
        print("Is Input Tree 2 is BinarySearchTree: \(isInput2Valid)")
        print("----- xxx -----\n")
        
        
        let input3 = BinarySearchTreeNode(key: 3)
        input3.left = BinarySearchTreeNode(key: 2)
        input3.right = BinarySearchTreeNode(key: 5)
        input3.left?.left = BinarySearchTreeNode(key: 1)
        input3.right?.left = BinarySearchTreeNode(key: 6)
        input3.right?.right = BinarySearchTreeNode(key: 1)
        
        let isInput3Valid = isBinarySearchTree(node: input3, min: nil, max: nil)
        print("Input Tree 3: \n")
        let tree3 = treeString(input3) { ("\($0.key)", $0.left, $0.right) }
        print(tree3)
        print("Is Input Tree 3 is BinarySearchTree: \(isInput3Valid)")
        print("----- xxx -----\n")
    }
    
    private func isBinarySearchTree(node: BinarySearchTreeNode?, min: Int?, max: Int?) -> Bool {
        guard let node = node else { return true }
        
        if let min = min, node.key <= min {
            return false
        }
        
        if let max = max, node.key >= max {
            return false
        }
        
        return isBinarySearchTree(node: node.left, min: min, max: node.key) && isBinarySearchTree(node: node.right, min: node.key, max: max)
    }
    
    /* Question 2: Find the height of the Binary Search Tree?
     https://app.codility.com/programmers/trainings/4/tree_height/
     https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Search%20Tree
     Hint:
     Height is the number of steps to the lowest leaf.
     Length of the longest path.
     Tree with one node has height of zero.
     */
    func findTheHeightOfBinarySearchTree() {
        print("----- Find the height of the Binary Search Tree? \n Hint: \n Height is the number of steps to the lowest leaf. \n Length of the longest path. \n Tree with one node has height of zero. -----")
        let input1 = BinarySearchTreeNode(key: 20)
        input1.left = BinarySearchTreeNode(key: 8)
        input1.right = BinarySearchTreeNode(key: 22)
        input1.left?.left = BinarySearchTreeNode(key: 4)
        input1.left?.right = BinarySearchTreeNode(key: 12)
        input1.left?.right?.left = BinarySearchTreeNode(key: 10)
        input1.left?.right?.right = BinarySearchTreeNode(key: 14)
        
        print("Input Tree 1: Height should be 3 \n")
        let tree1 = treeString(input1) { ("\($0.key)", $0.left, $0.right) }
        print(tree1)
        let height1 = input1.height()
        print("Height of BinarySearchTree1: \(height1)")
        print("----- xxx -----\n")
        
        let input2 = BinarySearchTreeNode(key: 5)
        print("Input Tree 2: Height should be 0 \n")
        let tree2 = treeString(input2) { ("\($0.key)", $0.left, $0.right) }
        print(tree2)
        let height2 = input2.height()
        print("Height of BinarySearchTree2: \(height2)")
        print("----- xxx -----\n")
        
        
        let input3 = BinarySearchTreeNode(key: 5)
        input3.left = BinarySearchTreeNode(key: 3)
        input3.right = BinarySearchTreeNode(key: 10)
        input3.left?.left = BinarySearchTreeNode(key: 20)
        input3.left?.right = BinarySearchTreeNode(key: 21)
        input3.right?.left = BinarySearchTreeNode(key: 1)
        print("Input Tree 3: Height should be 2 \n")
        let tree3 = treeString(input3) { ("\($0.key)", $0.left, $0.right) }
        print(tree3)
        let height3 = input3.height()
        print("Height of BinarySearchTree3: \(height3)")
        print("----- xxx -----\n")
        
        
        let input4 = BinarySearchTreeNode(key: 20)
        input4.left = BinarySearchTreeNode(key: 8)
        input4.right = BinarySearchTreeNode(key: 22)
        input4.left?.left = BinarySearchTreeNode(key: 4)
        input4.left?.right = BinarySearchTreeNode(key: 12)
        input4.left?.right?.left = BinarySearchTreeNode(key: 10)
        input4.left?.right?.right = BinarySearchTreeNode(key: 14)
        print("Input Tree 4: Height should be 3 \n")
        let tree4 = treeString(input4) { ("\($0.key)", $0.left, $0.right) }
        print(tree4)
        let height4 = input4.height()
        print("Height of BinarySearchTree4: \(height4)")
        print("----- xxx -----\n")
    }
    
    /*
     Question 3: Find the Lowest common ancestor (LCA) in Binary Search Tree?
     https://www.geeksforgeeks.org/lowest-common-ancestor-in-a-binary-search-tree/
     O(h) - height of the tree
     1. If the value of the current node is less than both n1 and n2, then LCA lies in the right.
     2. If the value of the current node is greater than both n1 and n2, then LCA lies in the left.
     3. If both the above cases are false then return the current node as LCA.
     */
    
    func findTheLowestCommonAncestorInBinarySearchTree() {
        print("----- Find the Lowest common ancestor (LCA) in Binary Search Tree? \n Hint: \n 1. If the value of the current node is less than both n1 and n2, then LCA lies in the right. \n 2. If the value of the current node is greater than both n1 and n2, then LCA lies in the left. \n If both the above cases are false then return the current node as LCA. -----")
        
        let root = BinarySearchTreeNode(key: 20)
        root.left = BinarySearchTreeNode(key: 8)
        root.right = BinarySearchTreeNode(key: 22)
        root.left?.left = BinarySearchTreeNode(key: 4)
        root.left?.right = BinarySearchTreeNode(key: 12)
        root.left?.right?.left = BinarySearchTreeNode(key: 10)
        root.left?.right?.right = BinarySearchTreeNode(key: 14)
        
        print("Tree: \n")
        let tree = treeString(root) { ("\($0.key)", $0.left, $0.right) }
        print(tree)
        var value1 = 10
        var value2 = 14
        if let node = findLowestCommonAncestor(for: root, value1: value1, value2: value2) {
            print("Lowest common ancestor of \(value1) and \(value2) is: \(node.key)")
        }
        
        value1 = 14
        value2 = 8
        if let node = findLowestCommonAncestor(for: root, value1: value1, value2: value2) {
            print("Lowest common ancestor of \(value1) and \(value2) is: \(node.key)")
        }
        
        value1 = 10
        value2 = 22
        if let node = findLowestCommonAncestor(for: root, value1: value1, value2: value2) {
            print("Lowest common ancestor of \(value1) and \(value2) is: \(node.key)")
        }
    }
    
    private func findLowestCommonAncestor(for node: BinarySearchTreeNode?, value1: Int, value2: Int) -> BinarySearchTreeNode? {
        guard let node = node else { return nil }
        
        if node.key > value1 && node.key > value2 {
            return findLowestCommonAncestor(for: node.left, value1: value1, value2: value2)
        }
        
        if node.key < value1 && node.key < value2 {
            return findLowestCommonAncestor(for: node.right, value1: value1, value2: value2)
        }
        
        return node
    }
    
    
    // Question 4: Print all leaf nodes?
    func printLeafs() {
        print("----- Print all leaf nodes? -----")
        
        let input1 = BinarySearchTreeNode(key: 4)
        input1.left = BinarySearchTreeNode(key: 2)
        input1.right = BinarySearchTreeNode(key: 6)
        input1.left?.left = BinarySearchTreeNode(key: 1)
        input1.left?.right = BinarySearchTreeNode(key: 3)
        input1.right?.left = BinarySearchTreeNode(key: 5)
        input1.right?.right = BinarySearchTreeNode(key: 7)
        
        print("Input Tree 1: \n")
        let tree1 = treeString(input1) { ("\($0.key)", $0.left, $0.right) }
        print(tree1)
        printLeafNodes(node: input1)
        print("----- xxx -----\n")
    }
    
    private func printLeafNodes(node: BinarySearchTreeNode?) {
        guard let node = node else { return }
        
        if node.left == nil && node.right == nil {
            print(node.key)
            return
        }
        
        if node.left != nil {
            printLeafNodes(node: node.left)
        }
        
        if node.right != nil {
            printLeafNodes(node: node.right)
        }
        
    }
    
}


extension BinarySearchTreeViewModel {
    
    public func treeString<T>(_ node: T, reversed: Bool = false, isTop: Bool = true, using nodeInfo: (T) -> (String, T?, T?)) -> String {
       // node value string and sub nodes
       let (stringValue, leftNode, rightNode) = nodeInfo(node)

       let stringValueWidth  = stringValue.count

       // recurse to sub nodes to obtain line blocks on left and right
       let leftTextBlock     = leftNode  == nil ? []
                             : treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
                               .components(separatedBy:"\n")

       let rightTextBlock    = rightNode == nil ? []
                             : treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
                               .components(separatedBy:"\n")

       // count common and maximum number of sub node lines
       let commonLines       = min(leftTextBlock.count,rightTextBlock.count)
       let subLevelLines     = max(rightTextBlock.count,leftTextBlock.count)

       // extend lines on shallower side to get same number of lines on both sides
       let leftSubLines      = leftTextBlock
                             + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
       let rightSubLines     = rightTextBlock
                             + Array(repeating:"", count: subLevelLines-rightTextBlock.count)

       // compute location of value or link bar for all left and right sub nodes
       //   * left node's value ends at line's width
       //   * right node's value starts after initial spaces
       let leftLineWidths    = leftSubLines.map{$0.count}
       let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }

       // top line value locations, will be used to determine position of current node & link bars
       let firstLeftWidth    = leftLineWidths.first   ?? 0
       let firstRightIndent  = rightLineIndents.first ?? 0


       // width of sub node link under node value (i.e. with slashes if any)
       // aims to center link bars under the value if value is wide enough
       //
       // ValueLine:    v     vv    vvvvvv   vvvvv
       // LinkLine:    / \   /  \    /  \     / \
       //
       let linkSpacing       = min(stringValueWidth, 2 - stringValueWidth % 2)
       let leftLinkBar       = leftNode  == nil ? 0 : 1
       let rightLinkBar      = rightNode == nil ? 0 : 1
       let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
       let valueOffset       = (stringValueWidth - linkSpacing) / 2

       // find optimal position for right side top node
       //   * must allow room for link bars above and between left and right top nodes
       //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
       //   * can be offset to the left if lower subNodes of right node
       //     have no overlap with subNodes of left node
       let minSpacing        = 2
       let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
                               .reduce(firstLeftWidth + minLinkWidth)
                               { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }


       // extend basic link bars (slashes) with underlines to reach left and right
       // top nodes.
       //
       //        vvvvv
       //       __/ \__
       //      L       R
       //
       let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
       let rightLinkExtra    = linkExtraWidth / 2
       let leftLinkExtra     = linkExtraWidth - rightLinkExtra

       // build value line taking into account left indent and link bar extension (on left side)
       let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
       let valueLine         = String(repeating:" ", count:max(0,valueIndent))
                             + stringValue
       let slash             = reversed ? "\\" : "/"
       let backSlash         = reversed ? "/"  : "\\"
       let uLine             = reversed ? "¯"  : "_"
       // build left side of link line
       let leftLink          = leftNode == nil ? ""
                             : String(repeating: " ", count:firstLeftWidth)
                             + String(repeating: uLine, count:leftLinkExtra)
                             + slash

       // build right side of link line (includes blank spaces under top node value)
       let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
       let rightLink         = rightNode == nil ? ""
                             : String(repeating:  " ", count:rightLinkOffset)
                             + backSlash
                             + String(repeating:  uLine, count:rightLinkExtra)

       // full link line (will be empty if there are no sub nodes)
       let linkLine          = leftLink + rightLink

       // will need to offset left side lines if right side sub nodes extend beyond left margin
       // can happen if left subtree is shorter (in height) than right side subtree
       let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
       let leftIndent        = String(repeating:" ", count:leftIndentWidth)
       let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }

       // compute distance between left and right sublines based on their value position
       // can be negative if leading spaces need to be removed from right side
       let mergeOffsets      = indentedLeftLines
                               .map{$0.count}
                               .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
                               .enumerated()
                               .map{ rightSubLines[$0].isEmpty ? 0  : $1 }


       // combine left and right lines using computed offsets
       //   * indented left sub lines
       //   * spaces between left and right lines
       //   * right sub line with extra leading blanks removed.
       let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
                               .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
                               .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }

       // Assemble final result combining
       //  * node value string
       //  * link line (if any)
       //  * merged lines from left and right sub trees (if any)
       let treeLines = [leftIndent + valueLine]
                     + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
                     + mergedSubLines

       return (reversed && isTop ? treeLines.reversed(): treeLines)
              .joined(separator:"\n")
    }
    
}

class BinaryTree {
    
    class Node {
        var data: Int = 0
        var left: Node?
        var right: Node?
        
        init(_ key: Int) {
            self.data = key
        }
    }
    
    var root: Node?
    
    func lca(_ node: Node?, _ n1: Int, _ n2: Int) -> Node? {
        if node == nil { return nil }
        
        // If both n1 and n2 are smaller than root, then LCA lies in left
        if node!.data > n1 && node!.data > n2 {
            return lca(node?.left, n1, n2)
        }
        
        // If both n1 and n2 are larger than root, then LCA lies in right
        if node!.data < n1 && node!.data < n2 {
            return lca(node?.right, n1, n2)
        }
        
        // Else we are at the node which is the LCA
        return node
    }
}
