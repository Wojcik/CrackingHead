//
//  BreadthFirstSearch.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/25/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class BreadthFirstSearch: BaseProblem {
    func exec() {
        let tree = BuildMinimalHeightBinaryTree().buildTree(Array(0...10))
        breadthFirstSearch(tree!)
    }
    
    func breadthFirstSearch(_ tree:Node) {
        var queue = [Node]()
        var visited = [Int:Bool]()
        print(tree.data)
        queue.append(tree)
        while queue.isEmpty == false {
            let node = queue.removeFirst()
            if visited[node.data] == true {
                continue
            }
            if let left = node.left {
                queue.append(left)
                print(left.data)
            }
            if let right = node.right {
                queue.append(right)
                print(right.data)
            }
            visited[node.data] = true
        }
    }
}
