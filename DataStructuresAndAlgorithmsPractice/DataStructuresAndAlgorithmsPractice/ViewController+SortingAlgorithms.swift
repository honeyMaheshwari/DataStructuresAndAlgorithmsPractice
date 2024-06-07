//
//  ViewController+SortingAlgorithms.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 06/06/24.
//

import Foundation

extension ViewController {
    
    func upderstandingSortingAlgorithms(viewModel: SortingAlgorithmsViewModel) {
        _ = viewModel.performBubbleSort(numbers: [5, 4, 3, 2, 1])
        
        _ = viewModel.performMergeSort(numbers: [2, 1, 5, 4, 9])
        
        _ = viewModel.performQuickSort(numbers: [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26])
        
        _ = viewModel.performInsertionSort(numbers: [8, 2, 10, 9, 11, 1, 7, 3, 4])
    }
    
    
    
}
