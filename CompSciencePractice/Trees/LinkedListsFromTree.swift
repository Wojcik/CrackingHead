//
//  LinkedListsFromTree.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 11/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class LinkedListsFromTree: BaseProblem {
    func exec() {
        let tree = BuildMinimalHeightBinaryTree().buildTree(Array(0...10))
        let lists = buildListsBFS(tree!)
        for list in lists {
            list.debugPrint()
        }
    }
    
    func buildLists(_ root:Node) -> [SinglyLinkedList] {
        var result = [SinglyLinkedList()]
        buildLists(root, level: 0, lists: &result)
        return result
    }
    
    func buildLists(_ root:Node?, level:Int, lists:inout [SinglyLinkedList]) {
        guard let node = root else {
            return
        }
        let list = lists[level]
        list.insertNode(nodeData: node.data)
        if level + 1 >= lists.count && (node.left != nil || node.right != nil){
            lists.append(SinglyLinkedList())
        }
        buildLists(node.left, level: level + 1, lists: &lists)
        buildLists(node.right, level: level + 1, lists: &lists)
    }
    
    func buildListsBFS(_ root:Node) -> [SinglyLinkedList] {
        var result = [SinglyLinkedList]()
        var current = [root]
        while current.isEmpty == false {
            let levelList = SinglyLinkedList()
            var newCurrent = [Node]()
            for node in current {
                if let left = node.left{
                    newCurrent.append(left)
                }
                if let right = node.right {
                    newCurrent.append(right)
                }
                levelList.insertNode(nodeData: node.data)
            }
            result.append(levelList)
            current = newCurrent
        }
        return result
    }
}
