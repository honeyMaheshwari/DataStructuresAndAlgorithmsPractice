//
//  ViewController+LinkedList.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 18/05/24.
//

import Foundation

extension ViewController {
    
    func understandLinkedList(viewModel: LinkedListViewModel) {

        viewModel.checkLinkedList()
        viewModel.calculateLengthOfLinkedList()
        
        let question = viewModel.questionFindMerge()
        if let answerWithBrute = viewModel.findMergeWithBruteForce(headA: question.headA, headB: question.headB) {
            print("answerWithBrute -> \(answerWithBrute)")
        }
        
        if let answerWithSpaceTime = viewModel.findMergeWithSpaceTime(headA: question.headA, headB: question.headB) {
            print("answerWithSpaceTime -> \(answerWithSpaceTime)")
        }
        
        if let findMergeWithInsignt = viewModel.findMergeWithInsignt(headA: question.headA, headB: question.headB) {
            print("findMergeWithInsignt -> \(findMergeWithInsignt)")
        }
        
        if let findMergeWithReverseInsignt = viewModel.findMergeWithInsignt(headA: question.headB, headB: question.headA) {
            print("findMergeWithReverseInsignt -> \(findMergeWithReverseInsignt)")
        }
        
        let question2Node = viewModel.questionDetectACycle()
        let hasCycle = viewModel.hasCycleWithTortoiseAndHare(first: question2Node)
        print("Linked List Cycle Detected status -> \(hasCycle)")
    }
    
}
