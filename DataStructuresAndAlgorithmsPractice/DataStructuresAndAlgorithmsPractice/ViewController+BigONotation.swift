//
//  ViewController+BigONotation.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 18/05/24.
//

import Foundation

// MARK: - BigONotation

extension ViewController {

    func understandBigONotation(bigONotationViewModel: BigONotationViewModel) {
        // Constant time O(1)
        _ = bigONotationViewModel.constantTime(5)
        
        // Linear time O(n)
        _ = bigONotationViewModel.linearTime([1, 2, 3])

        // Logarithmic time O(log n)
        _ = bigONotationViewModel.logarithmicTime(128)

        // Quadratic time O(n^2)
        _ = bigONotationViewModel.quadratic(16)
        
        // Question: Given two arrays, create a function that let's a user know whether these two arrays contain any common items.
        doesTwoArrayCommonItems(bigONotationViewModel: bigONotationViewModel)
    }
    

    func doesTwoArrayCommonItems(bigONotationViewModel: BigONotationViewModel) {
        _ = bigONotationViewModel.doesTwoArraysHasCommonItemWith_O_n_Square([1, 2, 3], [4, 5, 6]) // O(n^2)
        _ = bigONotationViewModel.doesTwoArraysHasCommonItemWith_O_n([1, 2, 3], [4, 5, 6]) // O(2n) -> O(n)
    }
    
}
