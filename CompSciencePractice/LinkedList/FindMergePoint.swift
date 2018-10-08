//
//  FindMergePoint.swift
//  CompSciencePractice
//
//  Created by Anton Kovalov on 10/6/18.
//  Copyright © 2018 Anton Kovalov. All rights reserved.
//


//Find Merge Point of Two Lists
/* 
 https://www.hackerrank.com/challenges/find-the-merge-point-of-two-joined-linked-lists/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=linked-lists
 */

import Foundation


class FindMergePoint: BaseProblem {
    
    func exec() {
        let leftList = SinglyLinkedList()
        let rightList = SinglyLinkedList()
        var fifthNode:SinglyLinkedListNode?
        for i in 1...10 {
            leftList.insertNode(nodeData: i)
            if i == 5 {
                fifthNode = leftList.tail as! SinglyLinkedListNode
            }
        }
        
        for i in 0..<5 {
            rightList.insertNode(nodeData: i)
        }
        rightList.tail!.next = fifthNode
        leftList.debugPrint()
        rightList.debugPrint()
        print(findMergeNode(headFirst: leftList.head as! SinglyLinkedListNode, headSecond: rightList.head as! SinglyLinkedListNode))
    }
    
    func findMergeNode(headFirst:SinglyLinkedListNode, headSecond:SinglyLinkedListNode) -> Int {
        var leftHead = headFirst
        var rightHead = headSecond
        
        while leftHead !== rightHead {
            print(leftHead.data, rightHead.data)
            if leftHead.next == nil {
                leftHead = headSecond
            } else {
                leftHead = leftHead.next as! SinglyLinkedListNode
            }
            
            if rightHead.next == nil {
                rightHead = headFirst
            } else {
                rightHead = rightHead.next as! SinglyLinkedListNode
            }
        }
        return rightHead.data
    }
}
