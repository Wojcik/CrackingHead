//
//  ReverseDoubly.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/6/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

//Reverse a doubly linked list
/*
 https://www.hackerrank.com/challenges/reverse-a-doubly-linked-list/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=linked-lists
 */

import Foundation

class ReverseDoubly: BaseProblem {
    func exec() {
        let list = DoublyLinkedList()
        for i in 1...10 {
            list.insertNode(nodeData: i)
        }
        list.debugPrint()
        list.tail = list.head
        list.head = reverse(head: list.head as? DoublyLinkedListNode)
        list.debugPrint()
        list.debugPrintReversed()
    }
    
    func reverse(head: DoublyLinkedListNode?) -> DoublyLinkedListNode? {
        var node = head
        var prev:DoublyLinkedListNode?
        while node != nil {
            var next = node?.next as? DoublyLinkedListNode
            node?.prev = nil
            node?.next = prev
            prev?.prev = node
            prev = node
            node = next
        }
        return prev
    }
}
