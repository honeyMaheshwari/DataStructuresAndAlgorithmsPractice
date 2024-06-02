//
//  ViewController+Arrays.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 18/05/24.
//

import Foundation

extension ViewController {
    
    func arrayQuestionPractice(viewModel: ArraysViewModel) {
        // Not Recommended
        let a1 = viewModel.rotateArrayToRightNTimesWithBruteForce(array: [1, 2, 3, 4, 5], n: 1)  // 5 1 2 3 4
        let a2 = viewModel.rotateArrayToRightNTimesWithBruteForce(array: [1, 2, 3, 4, 5], n: 3)  // 3 4 5 1 2
        print("a1 -> \(a1)")
        print("a2 -> \(a2)")
        
        let a3 = viewModel.rotateArrayToRightNTimes(array: [1, 2, 3, 4, 5], n: 1)  // 5 1 2 3 4
        let a4 = viewModel.rotateArrayToRightNTimes(array: [1, 2, 3, 4, 5], n: 3)  // 3 4 5 1 2
        print("a3 -> \(a3)")
        print("a4 -> \(a4)")
        
        /*
        formatPhoneNumber(phoneNumber: "123456789")           // 123-456-789
        formatPhoneNumber(phoneNumber: "555372654")           // 555-372-654
        formatPhoneNumber(phoneNumber: "0 - 22 1985--324")    // 022-198-53-24
        //// Edge cases
        formatPhoneNumber(phoneNumber: "01")                          // 01
        formatPhoneNumber(phoneNumber: "012")                         // 012
        formatPhoneNumber(phoneNumber: "0123")                        // 01-23
        formatPhoneNumber(phoneNumber: "0123       444")              // 012-34-44
        formatPhoneNumber(phoneNumber: "------0123       444")        // 012-34-44
        */
        let phoneNumber = "0 - 22 1985--324"
        let formatPhoneNumber1 = viewModel.formatPhoneNumber1(phoneNumber)
        let formatPhoneNumber2 = viewModel.formatPhoneNumber2(phoneNumber)
        let formatPhoneNumber3 = viewModel.formatPhoneNumber3(phoneNumber)
        let formatPhoneNumber4 = viewModel.formatPhoneNumber4(phoneNumber)
        let formatPhoneNumber5 = viewModel.formatPhoneNumber5(phoneNumber)
        print("formatPhoneNumber1 ->", formatPhoneNumber1)
        print("formatPhoneNumber2 ->", formatPhoneNumber2)
        print("formatPhoneNumber3 ->", formatPhoneNumber3)
        print("formatPhoneNumber4 ->", formatPhoneNumber4)
        print("formatPhoneNumber5 ->", formatPhoneNumber5)
        
        
        let A = ["pim", "pom"]
        let B = ["999999999", "777888999"]
        let P = "88999"
        let contact1 = viewModel.matchContact(A, B, P) // pom
        let contact2 = viewModel.matchContactWithDictionary(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
        let contact3 = viewModel.matchContact(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112") // NO CONTACT
        let contact4 = viewModel.matchContactWithDictionary([String](), [String](), "") // NO CONTACT
        let contact5 = viewModel.matchContactWithDictionary(A, B, "") // NO CONTACT
        print("contact1 ->", contact1)
        print("contact2 ->", contact2)
        print("contact3 ->", contact3)
        print("contact4 ->", contact4)
        print("contact5 ->", contact5)
    }
    
}
