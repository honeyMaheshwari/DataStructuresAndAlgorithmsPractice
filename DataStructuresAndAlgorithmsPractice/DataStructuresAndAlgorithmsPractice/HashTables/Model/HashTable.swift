//
//  HashTable.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 26/05/24.
//

import Foundation

class HashEntery {
    var key: String
    var value: String
    var next: HashEntery?
    
    init(key: String, value: String, next: HashEntery? = nil) {
        self.key = key
        self.value = value
        self.next = next
    }
}

class HashTable {
    private static let initialSize = 256
    private var entries: Array<HashEntery?> = Array<HashEntery?>(repeating: nil, count: initialSize)
    
    func put(key: String, value: String) {
        // Get the index
        let index = generateIndex(key: key)
        // Create entry
        let entry = HashEntery(key: key, value: value)
        
        if entries[index] == nil { // If entry is not already there - store it
            entries[index] = entry
        } else { // else handle collision by appending to our linked list
            var collision = entries[index]
            // Walk to the end of Linked List
            while collision?.next != nil {
                collision = collision?.next
            }
            // Add collision there
            collision?.next = entry
        }
    }
    
    func get(key: String) -> String? {
        // Get the index
        let index = generateIndex(key: key)
        // Get current list of entries for this index
        var currentEntry = entries[index]
        // Walk our linked list looking for a possible match on the key (that will be unique)
        while currentEntry?.next != nil {
            if currentEntry?.key == key {
                return currentEntry?.value
            }
            currentEntry = currentEntry?.next
        }
        return currentEntry?.value
    }
    
    func prettyPrint() {
        for entry in entries where entry != nil {
            if entry?.next != nil {
                print("💥 key: \(String(describing: entry?.key)) value: \(String(describing: entry?.value))")
                var collison = entry?.next
                while collison != nil {
                    print("💥 key: \(String(describing: collison?.key)) value: \(String(describing: collison?.value))")
                    collison = collison?.next
                }
            } else {
                // nothing else there
                print("key: \(String(describing: entry?.key)) value: \(String(describing: entry?.value))")
            }
        }
    }
    
    
    private func generateIndex(key: String) -> Int {
        let hashCode = abs(key.hashValue)
        let index = hashCode % HashTable.initialSize
        // Forced collision for demonstration purposes
        if key == "John Smith" || key == "Sandra Dee" {
            return 152
        }
        return index
    }
    
    subscript(key: String) -> String? {
        get {
            get(key: key)
        } set(newValue) {
            guard let value = newValue else { return }
            put(key: key, value: value)
        }
    }
    
}
