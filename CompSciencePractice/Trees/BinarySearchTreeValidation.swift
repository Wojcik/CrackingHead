//
//  BinarySearchTreeValidation.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/29/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class BinarySearchTreeValidation: BaseProblem {
    func exec() {
        let root = binarySearchTree()
        print(isBinarySearchTree(root, min:Int.min, max:Int.max))
        print(inorderValidation(root))
    }
    
    func isBinarySearchTree(_ root:Node?, min:Int, max:Int) -> Bool {
        guard let node = root else {
            return true
        }
        if node.data < min || node.data > max {
            return false
        }
        
        return isBinarySearchTree(node.left, min: min, max:node.data) &&
               isBinarySearchTree(node.right, min: node.data, max:max)
    }
    
    func inorderValidation(_ root:Node?) -> Bool {
        guard let node = root else {
            return true
        }
        let left = node.left?.data ?? Int.min
        
        let right = node.right?.data ?? Int.max
        if left < node.data && right > node.data {
            return inorderValidation(node.left) && inorderValidation(node.right)
        } else {
            return false
        }
    }
}
