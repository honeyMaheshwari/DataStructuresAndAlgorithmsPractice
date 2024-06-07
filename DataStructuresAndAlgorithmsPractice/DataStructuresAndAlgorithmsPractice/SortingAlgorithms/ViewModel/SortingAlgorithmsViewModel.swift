//
//  SortingAlgorithmsViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 06/06/24.
//

import Foundation

class SortingAlgorithmsViewModel {
    
    func performBubbleSort(numbers: [Int]) -> [Int] {
        print("----- Understanding Bubble Sort -----")
        let bubbleSort = BubbleSort()
        print("input -> \(numbers)")
        let result = bubbleSort.sort(numbers: numbers)
        print("output -> \(result)")
        print("----- xxx -----\n")
        return result
    }
    
    func performMergeSort(numbers: [Int]) -> [Int] {
        print("----- Understanding Merge Sort -----")
        let mergeSort = MergeSort()
        print("input -> \(numbers)")
        let result = mergeSort.sort(numbers: numbers)
        print("output -> \(result)")
        print("----- xxx -----\n")
        return result
    }
    
    func performQuickSort(numbers: [Int]) -> [Int] {
        print("----- Understanding Quick Sort -----")
        let quickSort = QuickSort()
        print("input -> \(numbers)")
        let result = quickSort.sort(numbers: numbers)
        print("output -> \(result)")
        print("----- xxx -----\n")
        return result
    }
    
    func performInsertionSort(numbers: [Int]) -> [Int] {
        print("----- Understanding Insertion Sort -----")
        let insertionSort = InsertionSort()
        print("input -> \(numbers)")
        let result = insertionSort.sort(numbers: numbers)
        print("output -> \(result)")
        print("----- xxx -----\n")
        return result
    }
    
}
