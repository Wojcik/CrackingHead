//
//  InorderSuccessor.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/9/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class InorderSuccessor: BaseProblem {
    func exec() {
        let tree = BuildMinimalHeightBinaryTree().buildTree(Array(0...10))!
        print(inorderSucessor(tree.left?.right?.left)?.data)
    }
    
    func inorderSucessor(_ root:Node?) -> Node? {
        guard let node = root else {
            return nil
        }
        var curr:Node? = node
        if node.right != nil {
            var curr = node.right
            while curr?.left != nil {
                curr = curr?.left
            }
        } else {
            while curr?.parent?.left != curr {
                curr = curr?.parent
            }
            curr = curr?.parent
        }
        
        return curr
    }
}
