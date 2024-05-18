//
//  BigONotationViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 13/05/24.
//

import Foundation

class BigONotationViewModel: NSObject {
    
    // Constant time O(1)
    func constantTime(_ n: Int) -> Int {
        let result = n * n
        return result
    }

    // Linear time O(n)
    func linearTime(_ A: [Int]) -> Int {
        for i in 0..<A.count {
            if A[i] == 0 {
                return 0
            }
    //        print(i)
        }
        return 1
    }

    // Logarithmic time O(log n)
    func logarithmicTime(_ N: Int) -> Int {
        var n = N
        var result = 0
        while n > 1 {
            n /= 2
    //        print(n)
            result += 1
        }
        return result
    }

    // Quadratic time O(n^2)
    func quadratic(_ n: Int) -> Int {
        var result = 0
        for i in 0..<n {
            for j in i..<n {
                result += 1
                print("\(i) \(j)")
            }
        }
        return result
    }
    
    // Naive brute force O(n^2)
    func doesTwoArraysHasCommonItemWith_O_n_Square(_ a: [Int], _ b: [Int]) -> Bool {
        for i in 0 ..< a.count {
            for j in 0 ..< b.count {
                if a[i] == b[j] {
                    return true
                }
            }
        }
        return false
    }
    
    // Convert to hash and lookup via other index O(n)
    func doesTwoArraysHasCommonItemWith_O_n(_ a: [Int], _ b: [Int]) -> Bool {
        var dictA: [Int: Bool] = [:]
        for vlaueA in a { // O(n)
            dictA[vlaueA] = true
        }
        
        for vlaueB in b {
            if dictA[vlaueB] == true {
                return true
            }
        }
        return false
    }
    
    
}
