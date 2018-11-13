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
        print(inorderSucessor(tree.left?.right)?.data)
    }
    
    func inorderSucessor(_ root:Node?) -> Node? {
        guard let node = root else {
            return nil
        }
        if var right = root?.right {
            while right.left != nil {
                right = right.left!
            }
            return right
        } else {
            var left:Node? = node
            var parent:Node? = node.parent
            while parent != nil && parent!.left?.data != left?.data {
                left = parent
                parent = parent?.parent
            }
            return parent
        }
    }
}
