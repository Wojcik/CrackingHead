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
}
