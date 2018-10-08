//
//  CycleDetection.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/8/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class CycleDetection: BaseProblem {
    func exec() {
        let list = SinglyLinkedList()
        for i in 1...10 {
            list.insertNode(nodeData: i)
        }
//        list.tail?.next = list.head
        print(listHasLoop(list.head as! SinglyLinkedListNode))
    }
    
    //O(n) space
//    func listHasLoop(_ head:SinglyLinkedListNode) -> Bool {
//        var visitedNodes = [SinglyLinkedListNode:Int]()
//        var node = head as? SinglyLinkedListNode
//        while node != nil {
//            if visitedNodes[node!] != nil {
//                return true
//            }
//            visitedNodes[node!] = node!.data
//            node = node!.next as? SinglyLinkedListNode
//        }
//        return false
//    }
    
    //fast/slow pointers
    //O(1) space
    func listHasLoop(_ head:SinglyLinkedListNode) -> Bool {
        var slow:SinglyLinkedListNode? = head
        var fast = head.next as? SinglyLinkedListNode
        
        while slow != fast {
            if fast?.next == nil {
                return false
            }
            slow = slow!.next as? SinglyLinkedListNode
            fast = fast!.next?.next as? SinglyLinkedListNode
        }
        return true
    }
}
