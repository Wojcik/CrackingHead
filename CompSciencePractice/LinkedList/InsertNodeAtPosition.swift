//
//  InsertNodeAtPosition.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/4/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

// Insert a node at a specific position in a linked list
/*
 https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=linked-lists
 */

import Foundation

class InsertNodeAtPosition:BaseProblem {
    func exec() {
        let list = SinglyLinkedList()
        for i in 1..<10 {
            list.insertNode(nodeData: i)
        }
        print(list.debugPrint())
        list.head = insertNodeAtPosition(head: list.head as! DoublyLinkedListNode, data: 5, position: 0)
        print(list.debugPrint())
    }
    
    func insertNodeAtPosition(head: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
        var startPointer = 0
        var node = head
        var head = head
        while (startPointer < position - 1) && node != nil {
            node = node?.next as? SinglyLinkedListNode
            startPointer += 1
        }
        
        let newNode = SinglyLinkedListNode(nodeData:data)
        if node != nil && position > 0 {
            let next = node!.next
            let newNode = SinglyLinkedListNode(nodeData:data)
            node!.next = newNode
            newNode.next = next
        } else if position == 0 {
            newNode.next = head
            head = newNode
        }
        return head
    }
}
