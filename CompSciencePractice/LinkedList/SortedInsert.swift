//
//  SortedInsert.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/6/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

// Inserting a Node Into a Sorted Doubly Linked List
/*
 https://www.hackerrank.com/challenges/insert-a-node-into-a-sorted-doubly-linked-list/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=linked-lists
 */

import Foundation

class SortedInsert: BaseProblem {
    func exec() {
        let list = DoublyLinkedList()
        for i in [1,3,4,10] {
            list.insertNode(nodeData: i)
        }
        list.debugPrint()
        list.head = sortedInsert(head: list.head as! DoublyLinkedListNode, data: 9)
        list.debugPrint()
    }
    
    func sortedInsert(head: DoublyLinkedListNode?, data: Int) -> DoublyLinkedListNode? {
        guard var node = head, node.data <= data else {
            let newNode = DoublyLinkedListNode(nodeData: data)
            newNode.next = head
            head?.prev = newNode
            return newNode
        }
        
        while node.next != nil && node.next!.data < data  {
            node = node.next as! DoublyLinkedListNode
        }
        let newNode = DoublyLinkedListNode(nodeData: data)
        newNode.next = node.next
        (node.next as? DoublyLinkedListNode)?.prev = newNode
        node.next = newNode
        newNode.prev = node
        
        return head
    }
}
