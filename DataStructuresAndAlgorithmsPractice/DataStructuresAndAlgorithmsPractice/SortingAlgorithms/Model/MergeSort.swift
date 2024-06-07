//
//  MergeSort.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 06/06/24.
//

import Foundation

class MergeSort {
    
    func sort(numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else { return numbers }
        
        let middleIndex = numbers.count / 2
        let leftArray = sort(numbers: Array(numbers[0..<middleIndex]))
        let rightArray = sort(numbers: Array(numbers[middleIndex..<numbers.count]))
        
        return merge(leftPile: leftArray, rightPile: rightArray)
    }
    
    private func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        
        var orderedPile: [Int] = []
        
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            let leftValue = leftPile[leftIndex]
            let rightValue = rightPile[rightIndex]
            if leftValue < rightValue {
                orderedPile.append(leftValue)
                leftIndex += 1
            } else if rightValue < leftValue {
                orderedPile.append(rightValue)
                rightIndex += 1
            } else {
                orderedPile.append(leftValue)
                leftIndex += 1
                orderedPile.append(rightValue)
                rightIndex += 1
            }
        }
        
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        
        return orderedPile
    }
    
}
