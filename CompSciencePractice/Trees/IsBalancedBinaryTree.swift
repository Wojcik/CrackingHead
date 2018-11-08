//
//  IsBalancedBinaryTree.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class IsBalancedBinaryTree: BaseProblem {
    func exec() {
        let tree = BuildMinimalHeightBinaryTree().buildTree(Array(0...10))
        print(heightOfTree(tree))
        print(isBalanced(tree))
        print(isBalanced(binarySearchTree()))
    }
    
    func isBalanced(_ root:Node?) -> Bool {
        return heightOfTree(root) != Int.min
    }
    
    func heightOfTree(_ root:Node?) -> Int {
        guard let node = root else {
            return -1
        }
        let leftHeight = heightOfTree(node.left)
        if leftHeight == Int.min {
            return leftHeight
        }
        let rightHeight = heightOfTree(node.right)
        if rightHeight == Int.min {
            return rightHeight
        }
        if abs(leftHeight - rightHeight) > 1 {
            return Int.min
        } else {
            return max(leftHeight, rightHeight) + 1
        }
        
    }
}
