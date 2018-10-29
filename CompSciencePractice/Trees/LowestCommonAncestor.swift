//
//  LowestCommonAncestor.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class LowestCommonAncestor: BaseProblem {
    func exec() {
        let tree = binarySearchTree()
        print(lowestCommonAncestor(tree, first:4, second:8))
    }
    
    func lowestCommonAncestor(_ root:Node?, first:Int, second:Int) -> Int {
        guard let node = root else {
            return -1
        }
        if node.data > first && node.data > second {
            return lowestCommonAncestor(node.left, first:first, second:second)
        } else if node.data < first && node.data < second {
            return lowestCommonAncestor(node.right, first:first, second:second)
        }
        return node.data
    }
}
