//
//  Node.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/26/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class Node {
    var left:Node?
    var right:Node?
    let data:Int
    
    init(data:Int) {
        self.data = data
    }
}

func binarySearchTree() -> Node {
    @discardableResult func inserNode(data:Int, root:Node?) -> Node {
        guard let root = root else {
            return Node(data: data)
        }
        var currentNode:Node
        if root.data >= data {
            currentNode = inserNode(data: data, root: root.left)
            root.left = currentNode
        } else {
            currentNode = inserNode(data: data, root: root.right)
            root.right = currentNode
        }
        return root
    }
    
    let root = inserNode(data: 10, root: nil)
    inserNode(data: 5, root: root)
    inserNode(data: 11, root: root)
    inserNode(data: 4, root: root)
    inserNode(data: 2, root: root)
    inserNode(data: 22, root: root)
    inserNode(data: 23, root: root)
    inserNode(data: 6, root: root)
    inserNode(data: 7, root: root)
    inserNode(data: 8, root: root)
    return root
}
