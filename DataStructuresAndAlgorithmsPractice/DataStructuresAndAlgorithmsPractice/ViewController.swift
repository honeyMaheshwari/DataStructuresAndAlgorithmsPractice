//
//  ViewController.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari on 02/01/23.
//

import UIKit

enum Contents: CaseIterable {
    case bigONotation(BigONotationViewModel)
    case arrays(ArraysViewModel)
    case linkedList(LinkedListViewModel)
    
    var name: String {
        switch self {
        case .bigONotation: return "Big O Notation"
        case .arrays: return "Array"
        case .linkedList: return "Linked List"
        }
    }
    
    static var allCases: [Contents] {
        return [.bigONotation(BigONotationViewModel()), .arrays(ArraysViewModel()), .linkedList(LinkedListViewModel())]
    }
}


class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let contents: [Contents] = Contents.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.sectionHeaderTopPadding = 0
    }
        
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = contents[indexPath.row].name
        contentConfiguration.textProperties.color = UIColor.white
        contentConfiguration.textProperties.font = UIFont.systemFont(ofSize: 16)
        cell.contentConfiguration = contentConfiguration
        
        var backgroundConfiguration = cell.defaultBackgroundConfiguration()
        backgroundConfiguration.backgroundColor = UIColor.black
        cell.backgroundConfiguration = backgroundConfiguration
        
        if let image = UIImage(systemName: "chevron.right") {
            let accessory  = UIImageView(frame:CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
            accessory.image = image
            accessory.tintColor = UIColor.white
            cell.accessoryView = accessory
        } else {
            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let content = contents[indexPath.row]
        switch content {
        case .bigONotation(let bigONotationViewModel):
            understandBigONotation(bigONotationViewModel: bigONotationViewModel)
        case .arrays(let arraysViewModel):
            arrayQuestionPractice(arraysViewModel: arraysViewModel)
        case .linkedList(let linkedListViewModel):
            understandLinkedList(linkedListViewModel: linkedListViewModel)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Header") ?? UITableViewHeaderFooterView(reuseIdentifier: "Header")
        var backgroundConfiguration = header.defaultBackgroundConfiguration()
        backgroundConfiguration.backgroundColor = UIColor.black
        header.backgroundConfiguration = backgroundConfiguration
        return header
    }
    
    /*
     extension UITableViewHeaderFooterView {

         @available(iOS 14.0, tvOS 14.0, *)
         @MainActor public var contentConfiguration: (any UIContentConfiguration)?

         @available(iOS 14.0, tvOS 14.0, *)
         @MainActor public func defaultContentConfiguration() -> UIListContentConfiguration
     }
     */
    
}

// MARK: - BigONotation

extension ViewController {

    func understandBigONotation(bigONotationViewModel: BigONotationViewModel) {
        // Constant time O(1)
        _ = bigONotationViewModel.constantTime(5)
        
        // Linear time O(n)
        _ = bigONotationViewModel.linearTime([1, 2, 3])

        // Logarithmic time O(log n)
        _ = bigONotationViewModel.logarithmicTime(128)

        // Quadratic time O(n^2)
        _ = bigONotationViewModel.quadratic(16)
        
        // Question: Given two arrays, create a function that let's a user know whether these two arrays contain any common items.
        doesTwoArrayCommonItems(bigONotationViewModel: bigONotationViewModel)
    }
    

    func doesTwoArrayCommonItems(bigONotationViewModel: BigONotationViewModel) {
        _ = bigONotationViewModel.doesTwoArraysHasCommonItemWith_O_n_Square([1, 2, 3], [4, 5, 6]) // O(n^2)
        _ = bigONotationViewModel.doesTwoArraysHasCommonItemWith_O_n([1, 2, 3], [4, 5, 6]) // O(2n) -> O(n)
    }
    
}

extension ViewController {
    
    func arrayQuestionPractice(arraysViewModel: ArraysViewModel) {
        // Not Recommended
        let a1 = arraysViewModel.rotateArrayToRightNTimesWithBruteForce(array: [1, 2, 3, 4, 5], n: 1)  // 5 1 2 3 4
        let a2 = arraysViewModel.rotateArrayToRightNTimesWithBruteForce(array: [1, 2, 3, 4, 5], n: 3)  // 3 4 5 1 2
        print("a1 -> \(a1)")
        print("a2 -> \(a2)")
        
        let a3 = arraysViewModel.rotateArrayToRightNTimes(array: [1, 2, 3, 4, 5], n: 1)  // 5 1 2 3 4
        let a4 = arraysViewModel.rotateArrayToRightNTimes(array: [1, 2, 3, 4, 5], n: 3)  // 3 4 5 1 2
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
        let formatPhoneNumber1 = arraysViewModel.formatPhoneNumber1(phoneNumber)
        let formatPhoneNumber2 = arraysViewModel.formatPhoneNumber2(phoneNumber)
        let formatPhoneNumber3 = arraysViewModel.formatPhoneNumber3(phoneNumber)
        let formatPhoneNumber4 = arraysViewModel.formatPhoneNumber4(phoneNumber)
        let formatPhoneNumber5 = arraysViewModel.formatPhoneNumber5(phoneNumber)
        print("formatPhoneNumber1 ->", formatPhoneNumber1)
        print("formatPhoneNumber2 ->", formatPhoneNumber2)
        print("formatPhoneNumber3 ->", formatPhoneNumber3)
        print("formatPhoneNumber4 ->", formatPhoneNumber4)
        print("formatPhoneNumber5 ->", formatPhoneNumber5)
        
        
        let A = ["pim", "pom"]
        let B = ["999999999", "777888999"]
        let P = "88999"
        let contact1 = arraysViewModel.matchContact(A, B, P) // pom
        let contact2 = arraysViewModel.matchContactWithDictionary(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")  // ann
        let contact3 = arraysViewModel.matchContact(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112") // NO CONTACT
        let contact4 = arraysViewModel.matchContactWithDictionary([String](), [String](), "") // NO CONTACT
        let contact5 = arraysViewModel.matchContactWithDictionary(A, B, "") // NO CONTACT
        print("contact1 ->", contact1)
        print("contact2 ->", contact2)
        print("contact3 ->", contact3)
        print("contact4 ->", contact4)
        print("contact5 ->", contact5)
    }
    
}

// MARK: - LinkedList

extension ViewController {
    
    func understandLinkedList(linkedListViewModel: LinkedListViewModel) {
        /*
        linkedListViewModel.checkLinkedList()
        linkedListViewModel.calculateLengthOfLinkedList()
        */
        
        /*
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
         */
        
        let question2Node = linkedListViewModel.questionDetectACycle()
        let hasCycle = linkedListViewModel.hasCycleWithTortoiseAndHare(first: question2Node)
        print("Linked List Cycle Detected status -> \(hasCycle)")
    }
    
}
