//
//  ViewController+Graphs.swift
//  DataStructuresAndAlgorithmsPractice
//
//  Created by Honey Maheshwari TaskHuman on 07/06/24.
//

import Foundation

extension ViewController {
    
    func upderstandingGraphs(viewModel: GraphsViewModel) {
        viewModel.performBreadthFirstSearchInGraph()
        
        viewModel.performDepthFirstSearchInGraph()
        
        questionsOnGraph(viewModel: viewModel)
    }
    
    func questionsOnGraph(viewModel: GraphsViewModel) {
        print("----- Graph contains a path from vertex 1 to vertex N going through all the vertices, one-by-one, in increasing order of the numbers. -----")
        
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 2, 4, 4, 3], secondArray: [2, 3, 1, 3, 1])) // true
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 2, 1, 3], secondArray: [2, 4, 3, 4])) // false
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [2, 4, 5, 3], secondArray: [3, 5, 6, 4])) // false
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 3], secondArray: [2, 2])) // true
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [2, 3], secondArray: [3, 4])) // false

        // Edge Cases
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [], secondArray: [])) // false
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1], secondArray: [2])) // true
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 3], secondArray: [2, 2])) // true
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 3], secondArray: [2, 99])) // false
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [2, 3], secondArray: [3, 4])) // false
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 2, 4, 4, 3], secondArray: [2, 3, 1, 3, 1])) // true
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [1, 2, 1, 3], secondArray: [2, 4, 3, 4])) // false
        print(viewModel.graphContainsPathFromVertex1toVertexN(firstArray: [2, 4, 5, 3], secondArray: [3, 5, 6, 4])) // false
        print("----- xxx -----\n")
    }
    
}
