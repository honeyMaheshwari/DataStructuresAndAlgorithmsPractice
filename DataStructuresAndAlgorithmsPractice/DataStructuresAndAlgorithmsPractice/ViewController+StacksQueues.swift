//
//  ViewController+StacksQueues.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 24/05/24.
//

import Foundation

extension ViewController {
    
    func understandStacksAndQueues(viewModel: StacksQueuesViewModel) {
        print("----- Rotate array to right k times -----")
        print(viewModel.solutionQueueRotateArrayToRight(array: [1, 2, 3, 4, 5], k: 1)) // [5, 1, 2, 3, 4]
        print(viewModel.solutionQueueRotateArrayToRight(array: [1, 2, 3, 4, 5], k: 2)) // [4, 5, 1, 2, 3]
        print(viewModel.solutionQueueRotateArrayToRight(array: [1, 2, 3, 4, 5], k: 3)) // [3, 4, 5, 1, 2]
        print(viewModel.solutionQueueRotateArrayToRight(array: [3, 8, 9, 7, 6], k: 3)) // [9, 7, 6, 3, 8]
        print("----- xxx -----\n")
        
        print("----- Rotate array to left k times -----")
        print(viewModel.solutionQueueRotateArrayToLeft(array: [1, 2, 3, 4, 5], k: 1)) // [2, 3, 4, 5, 1]
        print(viewModel.solutionQueueRotateArrayToLeft(array: [1, 2, 3, 4, 5], k: 2)) // [3, 4, 5, 1, 2]
        print(viewModel.solutionQueueRotateArrayToLeft(array: [1, 2, 3, 4, 5], k: 3)) // [4, 5, 1, 2, 3]
        print(viewModel.solutionQueueRotateArrayToLeft(array: [3, 8, 9, 7, 6], k: 3)) // [7, 6, 3, 8, 9]
        print("----- xxx -----\n")
        
        print("----- Reverse a string using stacks -----")
        print(viewModel.reverseStringUsingStacks("abc")) // cba
        print(viewModel.reverseStringUsingStacks("Would you like to play a game?")) // ?emag a yalp ot ekil uoy dluoW
        print("----- xxx -----\n")
        
        
        
        print("----- String has balanced brackets -----")
        print(viewModel.isBalancedBrackets(string: "{[()]}")) // true
        print(viewModel.isBalancedBrackets(string: "[()]}")) // false
        print(viewModel.isBalancedBrackets(string: "[(hdfjlksadf)sdfafnjkash ]}")) // false
        print(viewModel.isBalancedBrackets(string: "{}()(){}((){})({[[({({(){}{}}){}})]{({()}((())))}()]})(({}(()){[][]}){()}(({}{}))())()[](){{((){})}}()([[]])[][]()({}((([()]{})())[][[()]]())){{}}[]{()}()[][]{}([])[]{({})}{}{{}{[[]]}[]{}}{[()]}[]{(([{{[{[]}]}[{}]}]))}(){}{{}}[]((([])([{(){}[(()[]((()(){})({([]({{{[]{}}[({})()({}{([()])()()[]{}})][{[]}]{{}([]({{{(()(({}[[[{{}}]]{{[()]([[{{}([[]][([{{}}(([])[][({()}())()({}[])]{}[])]())[]]){}}[]]])([]({{[[][]{[]}[]]}}{}(){[]}))}()[]((){{}()[{[[()]]}()]}[()]{})}][]{}))())}(())}{{[]}{}}({[([{[{[[[]]]{()}[]}]{}}()((({{{{({{(){}}}[[()]()[]]())({{{[]}{{[[{{[{}]}}[][]]]([][](()(()[]){{}}))([])}}}}[{}{}])[(){{()()}{(())}()}]{(){{}[]{}[][{[]([[]()]{(){[{}[()]][{}{}]{(){}}}{[]}}{[]}[]){[]}[]}][((){}{}[[[[{{}()[([({{[[][{{()}(([[]][[[[[[[{}]][{}]]]()](())[()[][]({({[][][[]{}][]}{})}{({})([[][]({}{[]})])[([([])][[]{([])(({}))}](()[]){[[]]}({}))]}[])()]]]))([{}()()([([[{}][()]][])])][[[{}][][]({[]})][(({{()}}))]])}]]}})])]}]]]])]}}}}}})))])]})}))}}}))})))]}])))")) // true
        print("----- xxx -----\n")
    }
    
}
