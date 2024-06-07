//
//  QuickSort.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 06/06/24.
//

import Foundation

class QuickSort {
    
    func sort(numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else {
            return numbers
        }
        let pivot = numbers[numbers.count/2]
        var less: [Int] = []
        var equal: [Int] = []
        var greater: [Int] = []
        for number in numbers {
            if number < pivot {
                less.append(number)
            } else if number > pivot {
                greater.append(number)
            } else {
                equal.append(number)
            }
        }
        return sort(numbers: less) + equal + sort(numbers: greater)
    }
    
}
