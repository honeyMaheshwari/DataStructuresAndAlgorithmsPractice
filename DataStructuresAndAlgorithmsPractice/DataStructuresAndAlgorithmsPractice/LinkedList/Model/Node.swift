//
//  Node.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari on 02/01/23.
//

import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}
