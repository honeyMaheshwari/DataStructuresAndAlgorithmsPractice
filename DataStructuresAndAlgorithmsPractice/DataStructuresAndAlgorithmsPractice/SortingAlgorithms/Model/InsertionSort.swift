//
//  InsertionSort.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 06/06/24.
//

import Foundation


class InsertionSort {
    
    func sort(numbers: [Int]) -> [Int] {
        var array = numbers
        for x in 1 ..< array.count {
            var y = x
            let temp = array[y]
            while y > 0 && temp < array[y - 1] {
                array[y] = array[y - 1]
                y -= 1
            }
            array[y] = temp
        }
        return array
    }
    
}
