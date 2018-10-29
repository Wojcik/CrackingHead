//
//  HeightOfTree.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/26/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class HeightOfTree: BaseProblem {
    func exec() {
        print(heighOfTree(root: binarySearchTree()))
    }
    
    func heighOfTree(root:Node?) -> Int {
        if (root?.left == nil && root?.right == nil) {
            return 0
        }
        let leftBranchHeight = 1 + heighOfTree(root: root?.left)
        let rightBranchHeight = 1 + heighOfTree(root: root?.right)
        return max(leftBranchHeight, rightBranchHeight)
    }
}
