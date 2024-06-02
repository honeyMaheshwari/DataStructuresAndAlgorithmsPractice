//
//  ViewController+BinarySearchTrees.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 01/06/24.
//

import Foundation

extension ViewController {
    
    func upderstandingBinarySearchTrees(viewModel: BinarySearchTreeViewModel) {
        viewModel.performInsertOpertaionInBinarySearchTree()
        
        let minimumNumber = viewModel.findMinimumNumberInBinarySearchTree()
        print("Minimum number in Binary Search Tree is: \(minimumNumber)")
        
        let maximumNumber = viewModel.findMaximumNumberInBinarySearchTree()
        print("Maximum number in Binary Search Tree is: \(maximumNumber)")
 
        viewModel.performDeleteOpertaionInBinarySearchTree()
        
        viewModel.performTravseral()

        viewModel.printLeafs()
        
        questionsOnBinaryTree(viewModel: viewModel)
    }
    
    func questionsOnBinaryTree(viewModel: BinarySearchTreeViewModel) {
        viewModel.checkIfTheGivenNodeIsBinarySearchTree()
         
        viewModel.findTheHeightOfBinarySearchTree()
        
        viewModel.findTheLowestCommonAncestorInBinarySearchTree()
    }
    
}
