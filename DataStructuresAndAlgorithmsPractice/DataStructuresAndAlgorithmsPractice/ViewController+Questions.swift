//
//  ViewController+Questions.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 10/06/24.
//

import Foundation

extension ViewController {
    
    func practiceQuestions(viewModel: QuestionsViewModel) {
        question1(viewModel: viewModel)
        
        question2(viewModel: viewModel)

        question3(viewModel: viewModel)
    }
    
    func question1(viewModel: QuestionsViewModel) {
        print("----- Question 1: Given a string, see if you can detect whether it contains only unique chars. -----")
        var input: String = "ab"
        print("input -> \(input), isUnique -> \(viewModel.isUnique(input)), expected -> true")
        input = "aa"
        print("input -> \(input), isUnique -> \(viewModel.isUnique(input)), expected -> false")
        input = "abcdefghijklmnopqrstuvwxyz"
        print("input -> \(input), isUnique -> \(viewModel.isUnique(input)), expected -> true")
        print("----- xxx -----\n")
    }
    
    func question2(viewModel: QuestionsViewModel) {
        print("----- Question 2: Given two strings, check if one is a permutation of the other. -----")
        var input1: String = "abc"
        var input2: String = "cba"
        print("text to compare -> \(input1) & \(input2), is permutation -> \(viewModel.isPermutation(input1, input2)), expected -> true")
        input1 = "abc"
        input2 = "xyz"
        print("text to compare -> \(input1) & \(input2), is permutation -> \(viewModel.isPermutation(input1, input2)), expected -> false")
        print("----- xxx -----\n")
    }
    
    func question3(viewModel: QuestionsViewModel) {
        print("----- Question 3: See if you can replaces all the spaces in a a string with the ASCII symbol for space '%20'. Assume you are given the length of the final string. Hint: Use array of char[]. -----")
        var input: String = "My Home Page    "
        print("input -> '\(input)', is urlify -> \(viewModel.urlify(input, length: 16 /*input.count*/)), expected -> My%20Home%20Page")
        input = "Mr John Smith"
        print("input -> '\(input)', is urlify -> \(viewModel.urlify(input, length: 13 /*input.count*/)), expected -> Mr%20John%20Smith")
        print("----- xxx -----\n")
    }
    
}
