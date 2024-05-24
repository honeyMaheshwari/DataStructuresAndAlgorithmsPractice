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
    case stacksQueues(StacksQueuesViewModel)
    
    var name: String {
        switch self {
        case .bigONotation: return "Big O Notation"
        case .arrays: return "Array"
        case .linkedList: return "Linked List"
        case .stacksQueues: return "Stacks & Queues"
        }
    }
    
    static var allCases: [Contents] {
        return [.bigONotation(BigONotationViewModel()), .arrays(ArraysViewModel()), .linkedList(LinkedListViewModel()), .stacksQueues(StacksQueuesViewModel())]
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
        case .stacksQueues(let stacksQueuesViewModel):
            understandStacksAndQueues(stacksQueuesViewModel: stacksQueuesViewModel)
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
    
}
