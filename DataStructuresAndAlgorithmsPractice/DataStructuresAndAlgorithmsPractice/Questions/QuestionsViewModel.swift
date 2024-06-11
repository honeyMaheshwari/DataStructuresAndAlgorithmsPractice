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
    
    // Challenge 3: See if you can replaces all the spaces in a a string with the ASCII symbol for space '%20'. Assume you are given the length of the final string. Hint: Use array of char[].
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
    
    /*
      Challenge 4: There are three types of edits that can be performed on strings:
      - insert a character
      - remove a character, or
      - replace a character.
     
      Given two strings, write a function to check if they are one or zero edits away.
     */
    func oneAway(_ first: String, _ second: String) -> Bool {
        if abs(first.count - second.count) > 1 {
            return false
        } else if first.count == second.count {
            var foundDifference = false
            let arr1 = Array(first)
            let arr2 = Array(second)
            for i in 0 ..< arr1.count {
                if arr1[i] != arr2[i] {
                    if foundDifference {
                        return false
                    }
                    foundDifference = true
                }
            }
            return true
        } else {
            var shorter, longer: [Character]
            if first.count < second.count {
                shorter = Array(first)
                longer = Array(second)
            } else {
                shorter = Array(second)
                longer = Array(first)
            }

            let lenShort = shorter.count
            let lenLong = longer.count
            
            var index1 = 0
            var index2 = 0
            
            while index1 < lenShort && index2 < lenLong {
                if shorter[index1] != longer[index2] {
                    if index1 != index2 {
                        return false
                    }
                    index2 += 1
                } else {
                    index1 += 1
                    index2 += 1
                }
            }
            return true
        }
    }
    
    // Challenge 5: Give a string with repeating characters (i.e. "aaabb") write an algorithm that will compress the string down to the character, followed by the number of times it appears in the string (i.e "a3b2"). If the compressed string is not smaller than original, return original.
    func compress(_ str: String) -> String {
        guard str.count > 2 else {
            return str
        }
        /*
        // Unsorted answer
         
        var countDictionary: [Character: Int] = [:]
        for character in str {
            if let count = countDictionary[character] {
                countDictionary[character] = count + 1
            } else {
                countDictionary[character] = 1
            }
        }
        print("countDictionary -> \(countDictionary)")
        let compressString = countDictionary.map{ "\($0.key)\($0.value)" }.joined(separator: "")
        print("compressString -> \(compressString)")
        return compressString.count < str.count ? compressString : str
        */
        
        var compressedString = ""
        var currentCharacter = str.first!
        var currentCount = 0
        for character in str {
            if character == currentCharacter {
                currentCount += 1
            } else {
                compressedString += "\(currentCharacter)\(currentCount)"
                currentCharacter = character
                currentCount = 1
            }
        }
        
        compressedString += "\(currentCharacter)\(currentCount)"
        print("compressedString -> \(compressedString)")
        return compressedString.count < str.count ? compressedString : str
    }
        
}
