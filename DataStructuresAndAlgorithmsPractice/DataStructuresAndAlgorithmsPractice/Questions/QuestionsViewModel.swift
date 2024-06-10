//
//  QuestionsViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 10/06/24.
//

import Foundation

class QuestionsViewModel {
    
    // Challenge 1: Given a string, see if you can detect whether it contains only unique chars.
    func isUnique(_ text: String) -> Bool {
        let characters = Array(text)
        let charactersSet = Set(characters)
        return characters.count == charactersSet.count
        /*
        var dict: [Character: Bool] = [:]
        for character in text {
            if dict[character] != nil {
                return false
            } else {
                dict[character] = true
            }
        }
        return true
        */
    }
    
    // Challenge 2: Given two strings, check if one is a permutation of the other.
    
    func isPermutation(_ text: String, _ perm: String) -> Bool {
        guard text.count == perm.count else {
            return false
        }
        
        /*
        let array = Array(perm)
        for character in text {
            if !array.contains(character) {
                return false
            }
        }
        return true
        */
        
        return text.sorted() == perm.sorted()
    }
    
    func urlify(_ url: String, length: Int) -> String {
        guard !url.isEmpty else { return url }
        
        var result = Array<Character>()
        let trimmedURL = url.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        for character in trimmedURL {
            if character == " " {
                /*
                result.append("%")
                result.append("2")
                result.append("0")
                */
                result += Array<Character>("%20")
            } else {
                result.append(character)
            }
        }
        return String(result)
    }
    
}
