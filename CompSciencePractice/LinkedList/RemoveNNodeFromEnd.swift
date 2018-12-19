//
//  RemoveNNodeFromEnd.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 12/18/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Cocoa

class RemoveNNodeFromEnd: BaseProblem {
    /**
     * Definition for singly-linked list.
     * public class ListNode {
     *     public var val: Int
     *     public var next: ListNode?
     *     public init(_ val: Int) {
     *         self.val = val
     *         self.next = nil
     *     }
     * }
     */
    
    func exec() {
        let list = SinglyLinkedList()
        for i in 1...10 {
            list.insertNode(nodeData: i)
        }
        list.debugPrint()

        list.head = removeNthFromEnd(list.head, 1)
        list.debugPrint()
    }
    
    func removeNthFromEnd(_ head: LinkedListNode?, _ n: Int) -> LinkedListNode? {
        if head == nil { return nil }
        
        var validHead = head
        
        var fastPointer: LinkedListNode? = head
        var slowPointer: LinkedListNode? = head
        
        for i in 1...n {
            if fastPointer?.next == nil && i != n {
                return nil
            }
            fastPointer = fastPointer?.next
        }
        
        if fastPointer == nil {
            validHead = validHead?.next
        } else {
            fastPointer = fastPointer?.next
            while fastPointer != nil {
                fastPointer = fastPointer?.next
                slowPointer = slowPointer?.next
            }
            
            var temp = slowPointer?.next
            slowPointer?.next = temp?.next
            
            temp = nil
        }
        
        return validHead
    }
}
