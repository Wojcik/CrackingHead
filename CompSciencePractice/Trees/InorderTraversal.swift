//
//  InorderTraversal.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/1/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class InorderTraversal: BaseProblem {
    
    func exec() {
        inorderTraversal(binarySearchTree())
    }
    
    func inorderTraversal(_ root:Node?) {
        guard let node = root else {
            return
        }
        inorderTraversal(node.left)
        print(node.data)
        inorderTraversal(node.right)
    }
}
