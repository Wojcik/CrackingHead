//
//  BuildMinimalHeightBinaryTree.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class BuildMinimalHeightBinaryTree: BaseProblem {
    func exec() {
        let array = Array(1...10)
        print(buildTree(array))
    }
    
    func buildTree(_ array:[Int]) -> Node? {
        if array.isEmpty {
            return nil
        }
        let middle = array.count/2
        let root = Node.init(data: array[middle])
        root.left = buildTree(Array(array[0..<middle]))
        root.right = buildTree(Array(array[middle+1..<array.count]))
        return root
    }
}
