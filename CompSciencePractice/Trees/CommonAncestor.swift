//
//  CommonAncestor.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/13/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class CommonAncestor: BaseProblem {
    func exec() {
        let tree = Node(data: 10)
        let leftNode = Node(data: 8)
        let rightNode = Node(data: 7)
        print(commonAncestor(root: tree, left: leftNode, right: rightNode))
    }
    
    func commonAncestor(root:Node?, left:Node, right:Node) -> Node? {
        if root == nil || root! == left || root! == right {
            return root
        }
        return nil
    }
}
