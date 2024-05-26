//
//  HashTableViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 26/05/24.
//

import Foundation

class HashTableViewModel {
    
    func phoneBookExample() {
        let hashTable = HashTable()
        hashTable.put(key: "John Smith", value: "521-1234")
        hashTable.put(key: "Lisa Smith", value: "521-8976")
        hashTable.put(key: "Sam Doe", value: "521-5030")
        hashTable.put(key: "Sandra Dee", value: "521-9655")
        hashTable.put(key: "Ted Baker", value: "418-4165")
        
        hashTable.prettyPrint()
        
        print(String(describing: hashTable.get(key: "John Smith")))
        print(String(describing: hashTable.get(key: "Lisa Smith")))
        print(String(describing: hashTable.get(key: "Sam Doe")))
        print(String(describing: hashTable.get(key: "Sandra Dee")))
        print(String(describing: hashTable.get(key: "Ted Baker")))
        print(String(describing: hashTable.get(key: "Tim Lee")))
        
        hashTable["Kevin Flynn"] = "The grid"
        print(hashTable["Kevin Flynn"] ?? "")
        
        
        let hash1 = createHash(key: "Honey Maheshwari")
        print("hash1 -> \(hash1)")
        let hash2 = createHash(key: "Albert Einstein")
        let hash3 = createHash(key: "Andrew Collins")
        print("hash2 -> \(hash2)")
        print("hash3 -> \(hash3)")
    }
    
    func createHash(key: String) -> Int {
        let bucketsCount: Int = 256
        var remainder: Int = 0
        var divisor: Int = 0
        //obtain the ascii value of each character
        for key in key.unicodeScalars {
            divisor += Int(key.value)
        }
        remainder = divisor % bucketsCount // buckets.count
        return remainder
    }
    
}
