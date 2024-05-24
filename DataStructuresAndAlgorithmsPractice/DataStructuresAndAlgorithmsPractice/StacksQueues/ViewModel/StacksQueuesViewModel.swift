//
//  StacksQueuesViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

class StacksQueuesViewModel {
    
    /*
     Rotate array to right N times.
     https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
     
     For example, given

         A = [3, 8, 9, 7, 6]
         K = 3
     the function should return [9, 7, 6, 3, 8]. Three rotations were made:

         [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
         [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
         [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]
     
     Shoot for correctness. Not performance.
     */
    func solutionQueueRotateArrayToRight(array: [Int], k: Int) -> [Int] {
        if array.isEmpty || k == 0 {
            return array
        }
        var resultArray = array
        // treat like a queue enqueuing and dequeuing off the end
        for _ in 1...k {
            let last = resultArray.last!
            resultArray.insert(last, at: 0)
            resultArray.remove(at: array.count)
        }
        return resultArray
    }
    
    /*
     Rotate array to right N times.
     https://app.codility.com/programmers/lessons/2-arrays/cyclic_rotation/
     
     For example, given

         A = [3, 8, 9, 7, 6]
         K = 3
     the function should return [9, 7, 6, 3, 8]. Three rotations were made:

         [3, 8, 9, 7, 6] -> [6, 3, 8, 9, 7]
         [6, 3, 8, 9, 7] -> [7, 6, 3, 8, 9]
         [7, 6, 3, 8, 9] -> [9, 7, 6, 3, 8]

     Shoot for correctness. Not performance.
     */

    func solutionQueueRotateArrayToLeft(array: [Int], k: Int) -> [Int] {
        if array.isEmpty || k == 0 {
            return array
        }
        var resultArray = array
        for _ in 1...k {
            let first = resultArray.first!
            resultArray.append(first)
            resultArray.remove(at: 0)
        }
        return resultArray
    }
    
    
    /*
     Giving a String, write a function that reverses the String
     using a stack.
     */
    func reverseStringUsingStacks(_ string: String) -> String {
        var characters = Array(string)
                
        let stack: Stack<String> = Stack()
        // Push Characters
        for character in characters {
            stack.push(String(character))
        }
        
        // Pop Character
        for i in 0 ..< stack.count {
            characters[i] = Character(stack.pop() ?? "")
        }
        print(characters)
        return String(characters)
    }
    
    
    /*
     Balanced brackets
     https://www.hackerrank.com/challenges/balanced-brackets/problem
     
     A bracket is considered to be any one of the following characters: (, ), {, }, [, or ].

     Two brackets are considered to be a matched pair if the an opening bracket (i.e., (, [, or {) occurs to the left of a closing bracket (i.e., ), ], or }) of the exact same type. There are three types of matched pairs of brackets: [], {}, and ().

     A matching pair of brackets is not balanced if the set of brackets it encloses are not matched. For example, {[(])} is not balanced because the contents in between { and } are not balanced. The pair of square brackets encloses a single, unbalanced opening bracket, (, and the pair of parentheses encloses a single, unbalanced closing square bracket, ].

     By this logic, we say a sequence of brackets is balanced if the following conditions are met:

     It contains no unmatched brackets.
     The subset of brackets enclosed within the confines of a matched pair of brackets is also a matched pair of brackets.
     Given  strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, return YES. Otherwise, return NO.
     */
    
    func isBalancedBrackets(string: String) -> Bool {
        let stack: Stack<Character> = Stack()
        for character in string {
            switch character {
            case "(", "[", "{":
                stack.push(character)
            case ")", "]", "}":
                if stack.isEmpty {
                    return false
                }
                _ = stack.pop()
            default:
                break
            }
        }
        return stack.isEmpty
    }
    
    
}
