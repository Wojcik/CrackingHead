//
//  LinkedList.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/4/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//

import Foundation

class LinkedListNode:NSObject {
    var next:LinkedListNode?
    let data:Int
    public init(nodeData:Int) {
        data = nodeData
    }
}
//
//extension LinkedListNode: Equatable {
//    static func == (lhs: LinkedListNode, rhs: LinkedListNode) -> Bool {
//        lhs.data = rhs.data
//    }
//}

class SinglyLinkedListNode:LinkedListNode {
}

class SinglyLinkedList {
    var head:LinkedListNode?
    var tail:LinkedListNode?
    
    func insertNode(nodeData:Int) {
        insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }
    
    func insertNode(node:SinglyLinkedListNode) {
        if head == nil {
            head = node
        } else {
            tail?.next = node
            if let doubly = node as? DoublyLinkedListNode {
                doubly.prev = tail as? DoublyLinkedListNode
            }
        }
        tail = node
    }
    
    func debugPrint() {
        var node = head
        var result = [String]()
        while node != nil {
            result.append(String(node!.data))
            node = node?.next
        }
        print(result.joined(separator: " -> "))
    }
}

class DoublyLinkedListNode:SinglyLinkedListNode {
    weak var prev:DoublyLinkedListNode?
    var head:DoublyLinkedListNode?
    var tail:DoublyLinkedListNode?
}

class DoublyLinkedList:SinglyLinkedList {
    override func insertNode(nodeData:Int) {
        insertNode(node: DoublyLinkedListNode(nodeData: nodeData))
    }
    
    func debugPrintReversed() {
        var node = tail
        var result = [String]()
        while node != nil {
            result.append(String(node!.data))
            node = (node as! DoublyLinkedListNode).prev
        }
        print(result.joined(separator: " -> "))
    }
}
