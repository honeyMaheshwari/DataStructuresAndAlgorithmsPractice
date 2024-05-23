//
//  ViewController+LinkedList.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 18/05/24.
//

import Foundation

extension ViewController {
    
    func understandLinkedList(linkedListViewModel: LinkedListViewModel) {

        linkedListViewModel.checkLinkedList()
        linkedListViewModel.calculateLengthOfLinkedList()
        
        let question = linkedListViewModel.questionFindMerge()
        if let answerWithBrute = linkedListViewModel.findMergeWithBruteForce(headA: question.headA, headB: question.headB) {
            print("answerWithBrute -> \(answerWithBrute)")
        }
        
        if let answerWithSpaceTime = linkedListViewModel.findMergeWithSpaceTime(headA: question.headA, headB: question.headB) {
            print("answerWithSpaceTime -> \(answerWithSpaceTime)")
        }
        
        if let findMergeWithInsignt = linkedListViewModel.findMergeWithInsignt(headA: question.headA, headB: question.headB) {
            print("findMergeWithInsignt -> \(findMergeWithInsignt)")
        }
        
        if let findMergeWithReverseInsignt = linkedListViewModel.findMergeWithInsignt(headA: question.headB, headB: question.headA) {
            print("findMergeWithReverseInsignt -> \(findMergeWithReverseInsignt)")
        }
        
        let question2Node = linkedListViewModel.questionDetectACycle()
        let hasCycle = linkedListViewModel.hasCycleWithTortoiseAndHare(first: question2Node)
        print("Linked List Cycle Detected status -> \(hasCycle)")
    }
    
}
