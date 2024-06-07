//
//  BubbleSort.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 06/06/24.
//

import Foundation

class BubbleSort {
    
    func sort(numbers: [Int]) -> [Int] {
        var array = numbers
        let count = array.count
        for i in 0 ..< count - 1 {
            for j in 0 ..< count - i - 1 {
                if array[j] > array[j + 1] {
                    let tempVariable = array[j]
                    array[j] = array[j + 1]
                    array[j + 1] = tempVariable
                }
            }
        }
        return array
    }
    
}
