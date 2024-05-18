//
//  ArraysViewModel.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 18/05/24.
//

import UIKit

class ArraysViewModel: NSObject {

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
     */
    
    // Solution 1
    func rotateArrayToRightNTimesWithBruteForce(array: [Int], n: Int) -> [Int] {
        if array.isEmpty {
            return array
        } else if n < 1 {
            return array
        }

        func rotateArrayToRightSingleTimes(array: [Int]) -> [Int] {
            var tempArray = array
            let lastElement = tempArray.removeLast()
            tempArray = [lastElement] + tempArray
            return tempArray
        }
        
        var tempArray = array
        for _ in 1...n {
            tempArray = rotateArrayToRightSingleTimes(array: tempArray)
        }
        return tempArray
    }

    // Solution 2
    func rotateArrayToRightNTimes(array: [Int], n: Int) -> [Int] {
        if array.isEmpty {
            return array
        } else if n < 1 {
            return array
        }
        let rotateRight = array.count - (n % array.count)
    //    let rotateLeft = n % array.count
        let elementsToPutAtBeginning = array[rotateRight..<array.count]
        let elementToPutAtEnd = array[0..<rotateRight]
        let tempArray = Array(elementsToPutAtBeginning + elementToPutAtEnd)
        return tempArray
    }
        
}

extension ArraysViewModel {
    
    /*
     We are given a string S representing a phone number, which we would like to reformat. String S consists of N characters: digits, spaces, and/or dashes. It contains at least two digits.
     
     Spaces and dashes in string S can be ignored. We want to reformat the given phone number is such a way that the digits are grouped in blocks of length three, separated by single dashes. If necessary, the final block or the last two blocks can be of length two.
     
     For example:
     
     S = "00-44   48 5555 8361" should become
     "004-448-555-583-61"
     
     Assume:
     - S consists only of digits (0-9), spaces, and/or dashses (-)
     - S containts at least two digits
     
     Translate:
     
     Would like to reformat a phone number string so that:
     - every third char is a "-"
     - spaces and dashes don't matter
     - if the block ends in anything other than -xxx or -xx reformat to a block of two like xx-xx (not obvious)
     
     */
    
    func formatPhoneNumber1(_ number: String) -> String {
        var noSpaceNoDash = number.replacingOccurrences(of: "-", with: "")
        noSpaceNoDash = noSpaceNoDash.replacingOccurrences(of: " ", with: "")
        var formattedString = ""
        for (index, character) in noSpaceNoDash.enumerated() {
            let suffix = (index + 1) % 3 == 0 ? "-" : ""
            formattedString += "\(character)" + suffix
        }
        
        if let last = formattedString.last, last == "-" {
            formattedString = String(formattedString.dropLast())
        }
        
        var characters = Array(formattedString)
        if characters.count > 3 {
            let lastSecondIndex = characters.count - 2
            if characters[lastSecondIndex] == "-" {
                characters[lastSecondIndex] = characters[lastSecondIndex - 1]
                characters[lastSecondIndex - 1] = "-"
            }
        }
        formattedString = String(characters)
        return formattedString
    }
    
    func formatPhoneNumber2(_ number: String) -> String {
        var formattedString = number.replacingOccurrences(of: "-", with: "")
        formattedString = formattedString.replacingOccurrences(of: " ", with: "")
        let modifiedNumbers: Array<String> = formattedString.map({ "\($0)" })
        let length = modifiedNumbers.count
        if length <= 3 {
            return formattedString
        } else if length == 4 {
            let elementsToPutAtBeginning = Array(modifiedNumbers[0..<2])
            let elementsToPutAtEnd = Array(modifiedNumbers[2..<4])
            formattedString = elementsToPutAtBeginning.joined() + "-" + elementsToPutAtEnd.joined()
        } else {
            let elementsToPutAtBeginning = Array(modifiedNumbers[0..<3])
            let elementsToPutAtEnd = Array(modifiedNumbers[3..<length])
            let recursiveString = formatPhoneNumber2(elementsToPutAtEnd.joined())
            formattedString = elementsToPutAtBeginning.joined() + "-" + recursiveString
        }
        return formattedString
    }
    
    func formatPhoneNumber3(_ number: String) -> String {
        // 1. get conjoined number with dashes and spaces removed
        var rawNumber = number.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
        
        // 2. get chunks of size 3, until we only have 4> numbers left. (use logic to handle remaining chunk/s)
        var chunks: [String] = []
        while !rawNumber.isEmpty {
            if rawNumber.count > 4 || rawNumber.count == 3 { // 3 digits
                let chunk = String(rawNumber.prefix(3))
                rawNumber.removeFirst(3)
                chunks.append(chunk)
            } else if rawNumber.count == 4 { // 4 digits
                let chunk1 = String(rawNumber.prefix(2))
                rawNumber.removeFirst(2)
                let chunk2 = String(rawNumber.prefix(2))
                rawNumber.removeFirst(2)
                chunks.append(contentsOf: [chunk1,chunk2])
            } else { // 2 digits
                let chunk = String(rawNumber.prefix(2))
                rawNumber.removeFirst(2)
                chunks.append(chunk)
            }
        }
        
        // 3. concatenate chunks back together, separated by dashes to get final number.
        let reformattedNumber = chunks.joined(separator: "-")
        return reformattedNumber
    }
    
    func formatPhoneNumber4(_ number: String) -> String {
        let strArr = number.split(separator: "").filter{$0 != " " && $0 != "-"}
        var newarr : [String] = []
        for i in 0..<strArr.count {
            if strArr.count - i < 4 && strArr.count % 3 != 0 {
                if (strArr.count - i) % 2 == 0 && i != 0 {
                    newarr.append("-")
                }
            } else {
                if i % 3 == 0 && i != 0 {
                    newarr.append("-")
                }
            }
            newarr.append(String(strArr[i]))
        }
        return newarr.joined()
    }
    
    func formatPhoneNumber5(_ number: String) -> String {
        let numbers = number.filter { $0.isNumber }
        switch numbers.count {
        case 2, 3:
            return numbers
        case 4:
            return numbers.prefix(2) + "-" + numbers.suffix(2)
        default:
            return numbers.prefix(3) + "-" + formatPhoneNumber5(String(numbers.dropFirst(3)))
        }
    }
    
}

extension ArraysViewModel {
    
    /*
     When someone searches their contacts based on a phone number, it's nice when a list
     of contact pops up.
     
     Write an algorithm that searches you contacts for phone number strings, and returns:
      - NO CONTACT if contact can't be found
      - A contact if a contact is found
      - The first alphabetized contact if there are multiple
     
     A = ["pim", "pom"]             // Contacts (return one of these)
     B = ["999999999", "777888999"] // Phone numbers for each contact A[i] = B[i]
     P = "88999"                    // Search phrase

     Answer should be correct. Don't worry about performance.
     */

    public func matchContact(_ names: [String], _ numbers: [String], _ searchNumber: String) -> String {
        if searchNumber.isEmpty || names.isEmpty || numbers.isEmpty || names.count != numbers.count {
            return "NO CONTACT"
        }
        
        var results: [String] = []
        for i in 0 ..< numbers.count {
            let number = numbers[i]
            if number.contains(searchNumber) {
                results.append(names[i])
            }
        }
        
        if results.count == 1 {
            return results.first ?? ""
        } else if results.count > 1 {
            return results.sorted().first ?? ""
        }
        
        return "NO CONTACT"
    }

    public func matchContactWithDictionary(_ names: [String], _ numbers: [String], _ searchNumber: String) -> String {
        if searchNumber.isEmpty || names.isEmpty || numbers.isEmpty || names.count != numbers.count {
            return "NO CONTACT"
        }
        
        var numbersDictionary: [String: String] = [:]
        for i in 0 ..< names.count {
            numbersDictionary[names[i]] = numbers[i]
        }
        
        let matches = numbersDictionary.filter({ $0.value.contains(searchNumber) })
        
        if matches.count == 1 {
            return matches.first?.key ?? ""
        } else if matches.count > 1 {
            return matches.keys.sorted().first ?? ""
        }
        return "NO CONTACT"
    }

}
